import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;
import java.text.SimpleDateFormat;


public class AgregarEstado extends HttpServlet{

	private static final long serialVersionUID = 824296382068695168L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String nombre = request.getParameter("nombre");
			
			String query = "INSERT INTO Estado(nombre) VALUES('"+nombre+"');";
			dbc.executeUpdate(query);
			disp = getServletContext().getRequestDispatcher("/estadoAgregado.jsp");
			
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}