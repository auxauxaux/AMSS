import java.util.Date;
import java.util.ArrayList;
public class PCuestionario{
	
	private int id;
	private String nombre;
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
	public String getNombre(){
		return nombre;
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
	public ArrayList<PPreguntaA> getPreguntasA(){
		return preguntasA;
	}
	public ArrayList<PPreguntaM> getPreguntasM(){
		return preguntasM;
	}
	public void setId(int id){
		this.id = id;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
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
	public void addA(PPreguntaA p){
		if(preguntasA!=null){
			preguntasA.add(p);
		}
	}
	public void addM(PPreguntaM m){
		if(preguntasM!=null){
			preguntasM.add(m);
		}
	}
	
	
}