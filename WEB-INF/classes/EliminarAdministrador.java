import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EliminarAdministrador extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String usuario = request.getParameter("eliminar");
			
			String query = "DELETE FROM Administracion WHERE id_administracion='"+usuario+"'";
			dbc.executeUpdate(query);

			disp = getServletContext().getRequestDispatcher("/adminEliminado.jsp"); //Ver manera de no llevarlo a otro lado para que no se borren los datos(sql en jsp)
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}