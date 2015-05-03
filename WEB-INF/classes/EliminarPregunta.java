import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EliminarPregunta extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			int pregunta = Integer.parseInt(request.getParameter("eliminar"));
			
			String query = "DELETE FROM Pregunta_abierta WHERE id_Pregunta_abierta="+pregunta;
			
			dbc.executeUpdate(query);

			disp = getServletContext().getRequestDispatcher("/preguntaEliminada.jsp"); //Ver manera de no llevarlo a otro lado para que no se borren los datos(sql en jsp)
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}