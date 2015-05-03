import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

public class TablaAdministradores extends HttpServlet{

	private static final long serialVersionUID = 8264626975466688353L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			
			
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_administracion, nombres, apellido_paterno, apellido_materno, telefono, correo, direccion FROM ADMINISTRACION WHERE rol=2";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PAdministracion> admins = new ArrayList<PAdministracion>();
			
			while(res.next()){
				PAdministracion admin = new PAdministracion();
				admin.setId(res.getString("id_administracion"));
				admin.setNombre(res.getString("nombres"));
				admin.setPaterno(res.getString("apellido_paterno"));
				admin.setMaterno(res.getString("apellido_materno"));
				admin.setTelefono(res.getString("telefono"));
				admin.setCorreo(res.getString("correo"));
				admin.setDireccion(res.getString("direccion"));
				
				admins.add(admin);
			}
			
			request.setAttribute("admins",admins);
			disp = getServletContext().getRequestDispatcher("/tablaAdministradores.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				//Hacia quien va el forward?
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}