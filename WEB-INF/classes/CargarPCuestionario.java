import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


public class CargarPCuestionario extends HttpServlet{

	private static final long serialVersionUID = 6058077547437234890L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String query = "SELECT * FROM Pregunta_multiple";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PPreguntaA> preguntasA=new ArrayList<PPreguntaA>();;
			ArrayList<PPreguntaM> preguntasM=new ArrayList<PPreguntaM>();;
			
			while(res.next()){
				PPreguntaM pregunta = new PPreguntaM();
				pregunta.setId(res.getInt("id_Pregunta_multiple"));
				pregunta.setTexto(res.getString("texto"));
				pregunta.setFecha(res.getTimestamp("fecha"));
				pregunta.setIdA(res.getString("id_administracion"));
				
				preguntasM.add(pregunta);
			}
			
			query = "SELECT id_Pregunta_abierta, texto, fecha, id_administracion FROM Pregunta_abierta";
			
			res = dbc.executeQuery(query);
			
			while(res.next()){
				PPreguntaA pregunta = new PPreguntaA();
				pregunta.setId(res.getInt("id_Pregunta_abierta"));
				pregunta.setTexto(res.getString("texto"));
				pregunta.setFecha(res.getTimestamp("fecha"));
				pregunta.setIdA(res.getString("id_administracion"));
								
				preguntasA.add(pregunta);
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
			
			request.setAttribute("preguntasA",preguntasA);
			request.setAttribute("preguntasM", preguntasM);
							
			disp = getServletContext().getRequestDispatcher("/agregarCuestionario.jsp");
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}