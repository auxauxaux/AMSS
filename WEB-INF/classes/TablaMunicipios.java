import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;
import java.util.Date;

public class TablaMunicipios extends HttpServlet{

	private static final long serialVersionUID = 8669659510068960004L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_Municipio, nombre, id_estado FROM Municipio";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PMunicipio> municipios = new ArrayList<PMunicipio>();
			
			while(res.next()){
				PMunicipio municipio = new PMunicipio();
				municipio.setId(res.getInt("id_Municipio"));
				municipio.setNombre(res.getString("nombre"));
				municipio.setIdE(res.getInt("id_estado"));
								
				municipios.add(municipio);
			}

			request.setAttribute("municipios",municipios);
			disp = getServletContext().getRequestDispatcher("/tablaMunicipios.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}