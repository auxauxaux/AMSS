import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EliminarPreguntaM extends HttpServlet{

	 private static final long serialVersionUID = -2925580448484490074L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String pregunta = request.getParameter("eliminar");
			
			String query = "DELETE FROM Opcion WHERE id_pregunta="+pregunta;
			dbc.executeUpdate(query);
			query = "DELETE FROM Pregunta_multiple WHERE id_Pregunta_multiple="+pregunta;
			dbc.executeUpdate(query);
			disp = getServletContext().getRequestDispatcher("/preguntaMEliminada.jsp");
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}