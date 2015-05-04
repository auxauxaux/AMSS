import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class SubmitEditarPreguntaM extends HttpServlet{

	//private static final long serialVersionUID = 5335064651208042486L; cambiar serialVer

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			int id = Integer.parseInt(request.getParameter("preguntaM"));
			String texto = request.getParameter("texto");
			String opciones = request.getParameter("opciones");
			
			String[] opcionesA = opciones.split("\\$@");
			
			String query = "DELETE From Opcion WHERE id_pregunta="+id;
			dbc.executeUpdate(query);
			
			query = "UPDATE Pregunta_multiple SET texto='"+texto+"' WHERE id_Pregunta_multiple="+id;
			
			dbc.executeUpdate(query);
			
			for(int i = 0; i<opcionesA.length; i++){
				query = "INSERT INTO Opcion(texto, posicion, id_pregunta) VALUES('"+opcionesA[i]+"', '"+(i+1)+"', '"+id+"');";
				dbc.executeUpdate(query);
			}
			
			disp = getServletContext().getRequestDispatcher("/preguntaMEditada.jsp");
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}