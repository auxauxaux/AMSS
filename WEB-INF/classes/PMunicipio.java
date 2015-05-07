import java.util.Date;
public class PMunicipio{
	
	private int id;
	private String nombre;
	private int idE;
	
	public PMunicipio(){
		
	}
	
	public PMunicipio(int id, String nombre, int idE){
		this.id = id;
		this.nombre = nombre;
		this.idE = idE;
	}
	public int getId(){
		return id;
	}
	public String getNombre(){
		return nombre;
	}
	public int getIdE(){
		return idE;
	}
	public void setId(int id){
		this.id = id;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	public void setIdE(int idE){
		this.idE = idE;
	}
}