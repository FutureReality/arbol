CREATE TABLE pending_emails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    recipient VARCHAR(255),
    subject VARCHAR(255),
    message TEXT,
    sent TINYINT(1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_insert_trigger
AFTER INSERT ON Tickets
FOR EACH ROW
BEGIN
    DECLARE subject VARCHAR(255);
    DECLARE message TEXT;

    SET subject = 'Ticket Agregado Excitantemente';
    SET message = CONCAT('Tu ticket con id ', NEW.id, ' y título ', NEW.titulo, ' ha sido informado a los técnicos.');

    INSERT INTO pending_emails (recipient, subject, message)
    VALUES (NEW.correo, subject, message);
END;
//
DELIMITER ;
