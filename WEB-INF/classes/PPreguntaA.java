import java.util.Date;
public class PPreguntaA{
	
	private int id;
	private String texto;
	private Date fecha;
	private String idA;
	
	public PPreguntaA(){
		
	}
	
	public PPreguntaA(int id, String texto, Date fecha, String idA){
		this.id = id;
		this.texto = texto;
		this.fecha = fecha;
		this.idA = idA;
	}
	public int getId(){
		return id;
	}
	public String getTexto(){
		return texto;
	}
	public Date getFecha(){
		return fecha;
	}
	public String getIdA(){
		return idA;
	}
	public void setId(int id){
		this.id = id;
	}
	public void setTexto(String texto){
		this.texto = texto;
	}
	public void setFecha(Date fecha){
		this.fecha = fecha;
	}
	public void setIdA(String idA){
		this.idA = idA;
	}
}