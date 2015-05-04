import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.Date;

public class TablaPreguntas extends HttpServlet{

	private static final long serialVersionUID = 8669659510068960004L;

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
				pregunta.setFecha(res.getTimestamp("fecha"));
				pregunta.setIdA(res.getString("id_administracion"));
								
				preguntas.add(pregunta);
			}
			String queryPM = "SELECT id_Pregunta_multiple, texto, fecha, id_administracion FROM Pregunta_multiple";

			res = dbc.executeQuery(queryPM);

			while(res.next()){
			
				PPreguntaM pregunta = new PPreguntaM();
				pregunta.setId(res.getInt("id_Pregunta_multiple"));
				pregunta.setTexto(res.getString("texto"));
				pregunta.setFecha(res.getTimestamp("fecha"));
				pregunta.setIdA(res.getString("id_administracion"));
				
				preguntasM.add(pregunta);
				
			}

			for(int i=0;i<preguntasM.size();i++){
				PPreguntaM p = preguntasM.get(i);
				
				String queryM = "SELECT Opcion.id_Opcion, Opcion.texto, Opcion.posicion, Opcion.id_pregunta, Opcion.id_pregunta FROM Opcion WHERE id_pregunta="+p.getId()+" ORDER BY id_opcion";
				
				res = dbc.executeQuery(queryM);
				
				while(res.next()){					
					POpcion opcion = new POpcion();
					opcion.setId(res.getInt("id_Opcion"));
					opcion.setTexto(res.getString("texto"));
					opcion.setPosicion(res.getInt("posicion"));
					opcion.setIdP(res.getInt("id_pregunta"));
					
					 p.add(opcion);
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