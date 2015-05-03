import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class AgregarAdministrador extends HttpServlet{

	private static final long serialVersionUID = -6293495395580116052L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			
			String usuario = request.getParameter("usuario");
			String password = request.getParameter("password");
			String nombres = request.getParameter("nombres");
			String paterno = request.getParameter("paterno");
			String materno = request.getParameter("materno");
			String telefono = request.getParameter("telefono");
			String correo = request.getParameter("email");
			String direccion = "Calle: "+request.getParameter("calle")+" Colonia: "+request.getParameter("colonia")+" Ciudad: "+request.getParameter("ciudad")+" Estado: "+request.getParameter("estado")+" C.P: "+request.getParameter("codigoPostal");
			int rol = 2;
			
			
			String query = "SELECT id_administracion FROM Administracion WHERE id_administracion='"+usuario+"'";
			ResultSet res = dbc.executeQuery(query);
			
			if(res.next()){
				disp = getServletContext().getRequestDispatcher("/userTaken.jsp"); //Ver manera de no llevarlo a otro lado para que no se borren los datos(sql en jsp)
			}else{
				query = "INSERT INTO Administracion VALUES('"+usuario+"', '"+nombres+"', '"+paterno+"', '"+materno+"', '"+telefono+"', '"+correo+"', '"+direccion+"', "+"AES_ENCRYPT('"+password+"','root'),"+rol+" );";
				dbc.executeUpdate(query);
				disp = getServletContext().getRequestDispatcher("/adminAgregado.jsp");
			}
			
			disp.forward(request,response);
			
						
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}