import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;
import java.text.SimpleDateFormat;


public class AgregarCuestionario extends HttpServlet{

	private static final long serialVersionUID = 6058077547437234890L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String[] preguntasA = request.getParameterValues("preguntasA");
			String[] preguntasM = request.getParameterValues("preguntasM");
			int numPreguntas = preguntasA.length + preguntasM.length;
			String admin = request.getParameter("admin");
			
			Date fecha = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetime = sdf.format(fecha); //este es el bueno
			
			String query = "INSERT INTO Cuestionario(numero_preguntas, fecha, id_administracion) VALUES('"+numPreguntas+"', '"+datetime+"', '"+admin+"');";
			dbc.executeUpdate(query);
			
			//Muy importante
			query = "SELECT LAST_INSERT_ID()";
			ResultSet res = dbc.executeQuery(query);
			res.next();
			int idC =  res.getInt(1);
			
			for(int i = 0; i<preguntasA.length; i++){
				query = "INSERT INTO PreguntaA_Cuestionario(id_pregunta, id_cuestionario) VALUES("+preguntasA[i]+", "+idC+");";
				dbc.executeUpdate(query);
			}
			
			for(int i = 0; i<preguntasM.length; i++){
				query = "INSERT INTO PreguntaM_Cuestionario(id_pregunta, id_cuestionario) VALUES("+preguntasM[i]+", "+idC+");";
				dbc.executeUpdate(query);
			}
							
			disp = getServletContext().getRequestDispatcher("/cuestionarioAgregado.jsp");
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}