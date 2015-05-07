import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

public class SeleccionaCuestionario extends HttpServlet{

	//private static final long serialVersionUID = 8264626975466688353L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			
			
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_Cuestionario, nombre, fecha FROM Cuestionario ORDER BY fecha DESC";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PCuestionario> cuestionarios = new ArrayList<PCuestionario>();
			
			while(res.next()){
				PCuestionario cuestionario = new PCuestionario();
				cuestionario.setId(res.getInt("id_Cuestionario"));
				cuestionario.setNombre(res.getString("nombre"));
				cuestionario.setFecha(res.getTimestamp("fecha"));
				
				cuestionarios.add(cuestionario);
			}
			
			request.setAttribute("cuestionarios",cuestionarios);
			disp = getServletContext().getRequestDispatcher("/seleccionaCuestionario.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request,response);
	}
}