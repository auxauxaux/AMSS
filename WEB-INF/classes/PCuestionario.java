import java.util.Date;
import java.util.ArrayList;
public class PCuestionario{
	
	private int id;
	private int preguntas;
	private Date fecha;
	private String idA;
	private ArrayList<PPreguntaA> preguntasA;
	private ArrayList<PPreguntaM> preguntasM;
	
	public PCuestionario(){
		preguntasA = new ArrayList<PPreguntaA>();
		preguntasM = new ArrayList<PPreguntaM>();
	}
	public int getId(){
		return id;
	}
	public int getPreguntas(){
		return preguntas;
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
	public void setPreguntas(int preguntas){
		this.preguntas = preguntas;
	}
	public void setFecha(Date fecha){
		this.fecha = fecha;
	}
	public void setIdA(String idA){
		this.idA = idA;
	}
}