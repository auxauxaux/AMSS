import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class SubmitEditarPregunta extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			int id = Integer.parseInt(request.getParameter("id"));
			String texto = request.getParameter("texto");
			
			String query = "UPDATE Pregunta_abierta SET texto = '"+texto+"' WHERE id_Pregunta_abierta="+id;
			dbc.executeUpdate(query);
			disp = getServletContext().getRequestDispatcher("/preguntaModificada.jsp");
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}