import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class Login extends HttpServlet{

	private static final long serialVersionUID = 5014489099772037255L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			
			String usuarioF = request.getParameter("usuario");
			String passwordF = request.getParameter("password");
			
			RequestDispatcher disp = null;
			
			PAdministracion user = login(usuarioF, passwordF);
			
			{
				HttpSession session = request.getSession();
				
				if(user != null){
		 			int rol = user.getRol();
			 		session.setAttribute("logged",user);
			 		
			 		if(rol==1){
			 			disp =  getServletContext().getRequestDispatcher("/supervisor.jsp");
			 		}else if(rol==2){
			 			disp =  getServletContext().getRequestDispatcher("/administrador.jsp");
			 		}else{
			 			disp = getServletContext().getRequestDispatcher("/error.jsp");
			 		}
			 	}else{
			 		session.setAttribute("logged",null);
			 		session.invalidate();
		 			disp = getServletContext().getRequestDispatcher("/noUser.jsp");
		 		}
			}
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
	
	private PAdministracion login(String usuario, String password) throws Exception{
 		
 		DBConnection dbc = new DBConnection();
 		PAdministracion user = null;
 		user = dbc.login(usuario, password);
 			
 		dbc.close();
 		
 		return user;
	}
}