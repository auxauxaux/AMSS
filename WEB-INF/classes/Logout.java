import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

//@WebServlet(name="ServletLogin", urlPatterns={"/login"})

public class Logout extends HttpServlet{

	private static final long serialVersionUID = -6635008861043906183L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){
			doGet(request, response);
	}
			
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try{
		
			RequestDispatcher disp = null;
			
			HttpSession session = request.getSession();
			session.setAttribute("logged",null);
			session.invalidate();
			disp = getServletContext().getRequestDispatcher("/index.jsp");
			disp.forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}