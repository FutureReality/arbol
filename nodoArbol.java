// 	{}

package EstructurasNoLineales;

public class nodoArbol {
	
	private int valor;
	private NodoArbol nodoI;
	private NodoArbol nodoD;
	
	public NodoArbol(int valor){
		this.valor = valor;
		this.nodoI = null;
		this.nodoD = null;
	}

	public int getValor() {
		
		return valor;
		
	}

	public void setValor(int valor) {
		
		this.valor = valor;
		
	}
	
	public NodoArbol getNodoI() {
		
		return nodoI;
		
	}

	public NodoArbol getNodoD() {
		
		return nodoD;
		
	}
	
	public void  insertar(int _valor) {
		
		if (_valor < this.valor){
			//insertar en lado izquierdo
			if(this.nodoI == null){
				
				this.nodoI = new NodoArbol(_valor);
				
			}
			
			else {
				
				this.nodoI.insertar(_valor);
				
			}
			
		}
		
		else {
			//insertar en lado derecho
			if(this.nodoD == null){
				
				this.nodoD = new NodoArbol(_valor);
				
			}
			
			else{
				
				this.nodoD.insertar(_valor);
				
			}
		}	
	}	
}
