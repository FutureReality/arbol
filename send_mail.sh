#!/bin/bash

DB_USER="usuario"
DB_PASS="contraseña"
DB_NAME="nombre_base"
SMTP_FROM="From: helpdesk <no-reply@computerinnovations.com>"

# Obtener correos pendientes
mysql -u $DB_USER -p$DB_PASS $DB_NAME -Bse \
"SELECT id, recipient, subject, message FROM pending_emails WHERE sent = 0" |
while IFS=$'\t' read -r id email subject message; do
    echo "$message" | mail -s "$subject" -a "$SMTP_FROM" "$email"
    
    # Marcar como enviado si fue exitoso
    if [ $? -eq 0 ]; then
        mysql -u $DB_USER -p$DB_PASS $DB_NAME -e \
        "UPDATE pending_emails SET sent = 1 WHERE id = $id"
    else
        echo "Error al enviar correo a $email"
    fi
done
