import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;
import java.text.SimpleDateFormat;


public class AgregarPregunta extends HttpServlet{

	private static final long serialVersionUID = 824296382068695168L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String supervisor = request.getParameter("supervisor");
			String texto = request.getParameter("texto");
			
			Date fecha = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetime = sdf.format(fecha);
			
			String query = "INSERT INTO Pregunta_abierta(texto, fecha, id_administracion) VALUES('"+texto+"', '"+datetime+"', '"+supervisor+"');";
			System.out.println(query);
			dbc.executeUpdate(query);
			disp = getServletContext().getRequestDispatcher("/preguntaAgregada.jsp");
			
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}