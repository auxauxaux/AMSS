import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.Date;
import java.text.SimpleDateFormat;


public class AgregarMunicipio extends HttpServlet{

	private static final long serialVersionUID = 824296382068695168L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String nombre = request.getParameter("nombre");
			int ide = Integer.parseInt(request.getParameter("estado"));
			
			String query = "INSERT INTO Municipio(nombre, id_estado) VALUES('"+nombre+"',"+ide+");";
			dbc.executeUpdate(query);
			disp = getServletContext().getRequestDispatcher("/municipioAgregado.jsp");
			
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}