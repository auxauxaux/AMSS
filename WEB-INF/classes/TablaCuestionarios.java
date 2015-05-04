import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

public class TablaCuestionarios extends HttpServlet{

	//private static final long serialVersionUID = 8264626975466688353L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			
			
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_Cuestionario, numero_preguntas, fecha, id_administracion FROM Cuestionario";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PCuestionario> cuestionarios = new ArrayList<PCuestionario>();
			
			while(res.next()){
				PCuestionario cuestionario = new PCuestionario();
				cuestionario.setId(res.getInt("id_Cuestionario"));
				cuestionario.setPreguntas(res.getInt("numero_preguntas"));
				cuestionario.setFecha(res.getTimestamp("fecha"));
				cuestionario.setIdA(res.getString("id_administracion"));
				
				cuestionarios.add(cuestionario);
			}
			
			request.setAttribute("cuestionarios",cuestionarios);
			disp = getServletContext().getRequestDispatcher("/tablaCuestionarios.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}