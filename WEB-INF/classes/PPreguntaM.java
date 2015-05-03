import java.util.Date;
import java.util.ArrayList;
public class PPreguntaM{
	//Esto podria ser solo un objeto para los dos tipos de preguntas
	private int id;
	private String texto;
	private Date fecha;
	private String idA;
	private ArrayList<POpcion> opciones;
	
	public PPreguntaM(){
		
	}
	
	public PPreguntaM(int id, String texto, Date fecha, String idA){
		this.id = id;
		this.texto = texto;
		this.fecha = fecha;
		this.idA = idA;
		opciones = new ArrayList<POpcion>();
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
	public ArrayList<POpcion> getOpciones(){
		return opciones;
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
	public void setOpciones(ArrayList<POpcion> opciones){
		this.opciones = opciones;
	}
	public void add(POpcion o){
		if(opciones!=null){
			opciones.add(o);
		}
	}
}