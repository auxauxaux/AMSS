import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EditarPreguntaM extends HttpServlet{

	 private static final long serialVersionUID = 7865566270494810244L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			int preguntaID = Integer.parseInt(request.getParameter("eliminar"));
			
			String query = "SELECT id_Pregunta_multiple, texto, fecha, id_administracion FROM Pregunta_multiple WHERE id_Pregunta_multiple = "+preguntaID;
			ResultSet res = dbc.executeQuery(query);
			PPreguntaM pregunta = null;
			
			if(res.next()){
				int id = res.getInt("id_Pregunta_multiple");
				String texto = res.getString("texto");
				Date fecha = res.getDate("fecha");
				String supervisor = res.getString("id_administracion");
				
				pregunta = new PPreguntaM(id,texto,fecha, supervisor);
			}
			
			query = "SELECT * FROM Opcion WHERE id_Opcion="+pregunta.getId();
			
			res = dbc.executeQuery(query);
			
			while(res.next()){
				POpcion opcion = new POpcion();
				//opcion.setId()
				
			}
			disp = getServletContext().getRequestDispatcher("/editarPregunta.jsp");
			request.setAttribute("pregunta", pregunta);
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}