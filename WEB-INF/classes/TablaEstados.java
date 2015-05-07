import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.Date;

public class TablaEstados extends HttpServlet{

	private static final long serialVersionUID = 8669659510068960004L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_Estado, nombre FROM Estado";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PEstado> estados = new ArrayList<PEstado>();
			
			while(res.next()){
				PEstado estado = new PEstado();
				estado.setId(res.getInt("id_Estado"));
				estado.setNombre(res.getString("nombre"));
								
				estados.add(estado);
			}

			request.setAttribute("estados",estados);
			disp = getServletContext().getRequestDispatcher("/tablaEstados.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}