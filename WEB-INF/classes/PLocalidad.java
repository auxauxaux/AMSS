import java.util.Date;
public class PLocalidad{
	
	private int id;
	private String nombre;
	private int idM;
	
	public PLocalidad(){
		
	}
	
	public PLocalidad(int id, String nombre, int idE){
		this.id = id;
		this.nombre = nombre;
		this.idM = idM;
	}
	public int getId(){
		return id;
	}
	public String getNombre(){
		return nombre;
	}
	public int getIdM(){
		return idM;
	}
	public void setId(int id){
		this.id = id;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	public void setIdM(int idM){
		this.idM = idM;
	}
}