import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EditarPregunta extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			int preguntaID = Integer.parseInt(request.getParameter("editar"));
			
			String query = "SELECT id_Pregunta_abierta, texto, fecha, id_administracion FROM Pregunta_abierta WHERE id_Pregunta_abierta = "+preguntaID;
			ResultSet res = dbc.executeQuery(query);
			PPreguntaA pregunta = null;
			
			if(res.next()){
				int id = res.getInt("id_Pregunta_abierta");
				String texto = res.getString("texto");
				Date fecha = res.getDate("fecha");
				String supervisor = res.getString("id_administracion");
				
				pregunta = new PPreguntaA(id,texto,fecha, supervisor);
			}
			disp = getServletContext().getRequestDispatcher("/editarPregunta.jsp");
			request.setAttribute("pregunta", pregunta);
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}