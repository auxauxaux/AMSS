import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class EditarAdministrador extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String usuarioF = request.getParameter("editar");
			
			String query = "SELECT id_administracion, nombres, apellido_paterno, apellido_materno, telefono, correo, direccion, rol FROM Administracion WHERE id_administracion = '"+usuarioF+"';";
			ResultSet res = dbc.executeQuery(query);
			PAdministracion user = null;
			
			if(res.next()){
				String usuario = res.getString("id_administracion");
				String nombres = res.getString("nombres");
				String paterno = res.getString("apellido_paterno");
				String materno = res.getString("apellido_materno");
				String telefono = res.getString("telefono");
				String correo = res.getString("correo");
				String direccion = res.getString("direccion");
				int rol = res.getInt("rol");
				
				user = new PAdministracion(usuario, nombres, paterno, materno, telefono, correo, direccion, rol);
			}
			disp = getServletContext().getRequestDispatcher("/editarAdministrador.jsp");
			request.setAttribute("user", user);
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}