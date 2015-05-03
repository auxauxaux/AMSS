import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;
import java.text.SimpleDateFormat;


public class AgregarPreguntaM extends HttpServlet{

	private static final long serialVersionUID = 6058077547437234890L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String supervisor = request.getParameter("supervisor");
			String texto = request.getParameter("texto");
			String opciones = request.getParameter("opciones");
			
			Date fecha = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetime = sdf.format(fecha);
			
			String query = "INSERT INTO Pregunta_multiple(texto, fecha, id_administracion) VALUES('"+texto+"', '"+datetime+"', '"+supervisor+"');";
			dbc.executeUpdate(query);
			
			disp = getServletContext().getRequestDispatcher("/preguntaMAgregada.jsp");
			
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}