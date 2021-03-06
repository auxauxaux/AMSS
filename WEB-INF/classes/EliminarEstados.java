import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EliminarEstados extends HttpServlet{

	 private static final long serialVersionUID = -2925580448484490074L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String query = "DELETE FROM Estado";
			dbc.executeUpdate(query);
			query = "ALTER TABLE Estado AUTO_INCREMENT = 1";
			dbc.executeUpdate(query);

			disp = getServletContext().getRequestDispatcher("/estadosEliminados.jsp"); //Ver manera de no llevarlo a otro lado para que no se borren los datos(sql en jsp)
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}