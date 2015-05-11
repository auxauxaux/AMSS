import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EliminarCuestionario extends HttpServlet{

	 //private static final long serialVersionUID = -2925580448484490074L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			int cuestionario = Integer.parseInt(request.getParameter("eliminar"));
			
			String query = "DELETE FROM PreguntaA_Cuestionario where id_cuestionario="+cuestionario;
			dbc.executeUpdate(query);
			query = "DELETE FROM PreguntaM_Cuestionario where id_cuestionario="+cuestionario;
			dbc.executeUpdate(query);
			
			query = "DELETE FROM Cuestionario WHERE id_Cuestionario="+cuestionario;
			dbc.executeUpdate(query);

			disp = getServletContext().getRequestDispatcher("/cuestEliminado.jsp"); //Ver manera de no llevarlo a otro lado para que no se borren los datos(sql en jsp)
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}