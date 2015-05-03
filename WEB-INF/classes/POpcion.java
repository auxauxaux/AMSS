import java.util.Date;
public class POpcion{
	
	private int id;
	private String texto;
	private int posicion;
	private int idP;
	
	public POpcion(){
		
	}
	
	public POpcion(int id, String texto, int posicion, int idP){
		this.id = id;
		this.texto = texto;
		this.posicion = posicion;
		this.idP = idP;
	}
	public int getId(){
		return id;
	}
	public String getTexto(){
		return texto;
	}
	public int getPosicion(){
		return posicion;
	}
	public int getIdP(){
		return idP;
	}
	public void setId(int id){
		this.id = id;
	}
	public void setTexto(String texto){
		this.texto = texto;
	}
	public void setPosicion(int posicion){
		this.posicion = posicion;
	}
	public void setIdP(int idP){
		this.idP = idP;
	}
}