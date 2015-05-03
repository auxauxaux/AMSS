import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.Date;

public class TablaPreguntas extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String queryA = "SELECT id_Pregunta_abierta, texto, fecha, id_administracion FROM Pregunta_abierta";
			
			ResultSet res = dbc.executeQuery(queryA);
			
			ArrayList<PPreguntaA> preguntas = new ArrayList<PPreguntaA>();
			ArrayList<PPreguntaM> preguntasM = new ArrayList<PPreguntaM>();
			
			while(res.next()){
				PPreguntaA pregunta = new PPreguntaA();
				pregunta.setId(res.getInt("id_Pregunta_abierta"));
				pregunta.setTexto(res.getString("texto"));
				pregunta.setFecha(res.getDate("fecha"));
				pregunta.setIdA(res.getString("id_administracion"));
								
				preguntas.add(pregunta);
			}
			String queryM = "SELECT Opcion.id_Opcion, Opcion.texto, Opcion.posicion, Opcion.id_pregunta, Pregunta_multiple.id_Pregunta_multiple, Pregunta_multiple.texto, Pregunta_multiple.fecha, Pregunta_multiple.id_administracion FROM Opcion LEFT JOIN Pregunta_multiple ON Opcion.id_pregunta = Pregunta_multiple.id_Pregunta_multiple ORDER BY id_Pregunta_multiple";
			
			res = dbc.executeQuery(queryM);
			
			int aux = -1, aux2;
			boolean flag = false;
			
			
			while(res.next()){
				PPreguntaM pregunta = null;
				POpcion opcion = new POpcion();
				opcion.setId(res.getInt("id_Opcion"));
				opcion.setTexto(res.getString("texto"));
				opcion.setPosicion(res.getInt("posicion"));
				opcion.setIdP(res.getInt("id_pregunta"));
				aux2 = aux;
				aux = res.getInt("id_Pregunta_multiple");
				
				if(aux != aux2){
					if(pregunta!=null){
						preguntasM.add(pregunta);
					}
					pregunta = new PPreguntaM();
					pregunta.setId(aux);
					pregunta.setTexto(res.getString("texto"));
					pregunta.setFecha(res.getDate("fecha"));
					pregunta.setIdA(res.getString("id_administracion"));
				}
				if(pregunta != null){
					pregunta.add(opcion);
				}
			}
			request.setAttribute("preguntas",preguntas);
			request.setAttribute("preguntasM", preguntasM);
			disp = getServletContext().getRequestDispatcher("/tablaPreguntas.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}