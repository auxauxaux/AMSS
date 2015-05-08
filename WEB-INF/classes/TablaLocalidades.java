import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.Date;

public class TablaLocalidades extends HttpServlet{

	//private static final long serialVersionUID = 8669659510068960004L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_Localidad, nombre, id_municipio FROM Localidad";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PLocalidad> localidades = new ArrayList<PLocalidad>();
			
			while(res.next()){
				PLocalidad l = new PLocalidad();
				l.setId(res.getInt("id_Localidad"));
				l.setNombre(res.getString("nombre"));
				l.setIdM(res.getInt("id_municipio"));
								
				localidades.add(l);
			}

			request.setAttribute("localidades",localidades);
			disp = getServletContext().getRequestDispatcher("/tablaLocalidades.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}