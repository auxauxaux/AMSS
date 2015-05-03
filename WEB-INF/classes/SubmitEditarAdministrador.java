import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class SubmitEditarAdministrador extends HttpServlet{

	private static final long serialVersionUID = -1364090567212273662L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String usuario = request.getParameter("usuario");
			String usuarioA = request.getParameter("usuarioA");
			String nombres = request.getParameter("nombres");
			String paterno = request.getParameter("paterno");
			String materno = request.getParameter("materno");
			String telefono = request.getParameter("telefono");
			String correo = request.getParameter("email");
			String direccion = "Calle: "+request.getParameter("calle")+" Colonia: "+request.getParameter("colonia")+" Ciudad: "+request.getParameter("ciudad")+" Estado: "+request.getParameter("estado")+" C.P: "+request.getParameter("codigoPostal");
			int rol = 2;
			
			
			String query = "SELECT id_administracion FROM Administracion WHERE id_administracion='"+usuario+"'";
			ResultSet res = dbc.executeQuery(query);
			
			
			
			if(res.next()){ //Revisar condiciones para no repetir codigo
				String usuarioAux = res.getString("id_administracion");
				if( !(usuarioAux.equals(usuario)) ){
					disp = getServletContext().getRequestDispatcher("/userTaken.jsp");
				}else{
					query = "UPDATE Administracion SET nombres = '"+nombres+"', apellido_paterno = '"+paterno+"', apellido_materno = '"+materno+"', telefono = '"+telefono+"', correo = '"+correo+"', direccion = '"+direccion+"' WHERE id_administracion='"+usuario+"'";
				dbc.executeUpdate(query);
				disp = getServletContext().getRequestDispatcher("/adminModificado.jsp");
				}
			}else{
				//sí entra
				query = "UPDATE Administracion SET id_administracion = '"+usuario+"', nombres = '"+nombres+"', apellido_paterno = '"+paterno+"', apellido_materno = '"+materno+"', telefono = '"+telefono+"', correo = '"+correo+"', direccion = '"+direccion+"' WHERE id_administracion='"+usuarioA+"'";
				System.out.println(query);
				dbc.executeUpdate(query);
				disp = getServletContext().getRequestDispatcher("/adminModificado.jsp");
			}
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}