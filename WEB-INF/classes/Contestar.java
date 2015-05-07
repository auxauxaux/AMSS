import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

public class Contestar extends HttpServlet{

	//private static final long serialVersionUID = 8264626975466688353L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			
			
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			int id = Integer.parseInt(request.getParameter("cuestionario"));
			String query = "SELECT id_Cuestionario, nombre, fecha FROM Cuestionario WHERE id_Cuestionario="+id;
			
			ResultSet res = dbc.executeQuery(query);
			
			PCuestionario cuestionario=null;
			ArrayList<PPreguntaA> preguntasA = new ArrayList<PPreguntaA>();
			ArrayList<PPreguntaM> preguntasM = new ArrayList<PPreguntaM>();
			
			if(res.next()){
				cuestionario = new PCuestionario();
				cuestionario.setId(res.getInt("id_Cuestionario"));
				cuestionario.setNombre(res.getString("nombre"));
				cuestionario.setFecha(res.getTimestamp("fecha"));
			}else{
				System.out.println("NO ENCONTRÖ CUESTIONARIO Contestar.java");
			}
			
				query = "SELECT id_pregunta FROM PreguntaM_Cuestionario WHERE id_cuestionario="+cuestionario.getId();
				
				res = dbc.executeQuery(query);
				
				while(res.next()){
					PPreguntaM p =  new PPreguntaM();
					p.setId(res.getInt("id_pregunta"));
					
					preguntasM.add(p);
				}
				
				for(int j = 0; j<preguntasM.size(); j++){
					PPreguntaM p = preguntasM.get(j);
					
					query = "SELECT texto FROM Pregunta_multiple WHERE id_Pregunta_multiple="+p.getId();
					res = dbc.executeQuery(query);
					
					res.next();
					p.setTexto(res.getString("texto"));
					
					query = "SELECT id_Opcion, texto, posicion, id_pregunta, id_pregunta FROM Opcion WHERE id_pregunta="+p.getId()+" ORDER BY id_opcion";
					
					res = dbc.executeQuery(query);
					
					while(res.next()){					
						POpcion opcion = new POpcion();
						opcion.setId(res.getInt("id_Opcion"));
						opcion.setTexto(res.getString("texto"));
						opcion.setPosicion(res.getInt("posicion"));
						opcion.setIdP(res.getInt("id_pregunta"));
						
						p.add(opcion);
					}
					 
					cuestionario.addM(p);
				}
				
				query = "SELECT id_pregunta FROM PreguntaA_Cuestionario WHERE id_cuestionario="+cuestionario.getId();
				
				res = dbc.executeQuery(query);
				
				while(res.next()){
					PPreguntaA p = new PPreguntaA();
					p.setId(res.getInt("id_pregunta"));
					
					preguntasA.add(p);
				}
				
				for(int j = 0; j<preguntasA.size(); j++){
					PPreguntaA p = preguntasA.get(j);
					
					query = "SELECT texto FROM Pregunta_abierta WHERE id_Pregunta_abierta="+p.getId();
					res = dbc.executeQuery(query);
					
					res.next();
					p.setTexto(res.getString("texto"));
					cuestionario.addA(p);
				}
			
				request.setAttribute("cuestionario",cuestionario);
				
				disp = getServletContext().getRequestDispatcher("/contestar.jsp");
			
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