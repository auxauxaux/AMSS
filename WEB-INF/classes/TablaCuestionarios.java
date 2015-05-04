import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import java.util.ArrayList;

public class TablaCuestionarios extends HttpServlet{

	//private static final long serialVersionUID = 8264626975466688353L;

	public void doPost(HttpServletRequest request, HttpServletResponse response){

		try{
			
			
			RequestDispatcher disp = null;
			DBConnection dbc = new DBConnection();
			String query = "SELECT id_Cuestionario, numero_preguntas, fecha, id_administracion FROM Cuestionario";
			
			ResultSet res = dbc.executeQuery(query);
			
			ArrayList<PCuestionario> cuestionarios = new ArrayList<PCuestionario>();
			ArrayList<PPreguntaA> preguntasA = new ArrayList<PPreguntaA>();
			ArrayList<PPreguntaM> preguntasM = new ArrayList<PPreguntaM>();
			
			
			while(res.next()){
				PCuestionario cuestionario = new PCuestionario();
				cuestionario.setId(res.getInt("id_Cuestionario"));
				cuestionario.setPreguntas(res.getInt("numero_preguntas"));
				cuestionario.setFecha(res.getTimestamp("fecha"));
				cuestionario.setIdA(res.getString("id_administracion"));
				
				cuestionarios.add(cuestionario);
			}
			
			for(int i=0;i<cuestionarios.size();i++){
				PCuestionario c = cuestionarios.get(i);
			
				String queryM = "SELECT id_pregunta FROM PreguntaM_Cuestionario WHERE id_cuestionario="+c.getId();
				
				res = dbc.executeQuery(queryM);
				
				while(res.next()){
					PPreguntaM p =  new PPreguntaM();
					p.setId(res.getInt("id_pregunta"));
					
					preguntasM.add(p);
				}
				
				for(int j = 0; j<preguntasM.size(); j++){
					PPreguntaM p = preguntasM.get(j);
					
					queryM = "SELECT texto FROM Pregunta_multiple WHERE id_Pregunta_multiple="+p.getId();
					res = dbc.executeQuery(queryM);
					
					res.next();
					p.setTexto(res.getString("texto"));
					c.addM(p);
				}
				preguntasM.clear();
				
				queryM = "SELECT id_pregunta FROM PreguntaA_Cuestionario WHERE id_cuestionario="+c.getId();
				
				res = dbc.executeQuery(queryM);
				
				while(res.next()){
					PPreguntaA p = new PPreguntaA();
					p.setId(res.getInt("id_pregunta"));
					
					preguntasA.add(p);
				}
				
				for(int j = 0; j<preguntasA.size(); j++){
					PPreguntaA p = preguntasA.get(j);
					
					queryM = "SELECT texto FROM Pregunta_abierta WHERE id_Pregunta_abierta="+p.getId();
					res = dbc.executeQuery(queryM);
					
					res.next();
					p.setTexto(res.getString("texto"));
					c.addA(p);
				}
				preguntasA.clear();
				cuestionarios.add(c);
			}
			
			
			request.setAttribute("cuestionarios",cuestionarios);
			disp = getServletContext().getRequestDispatcher("/tablaCuestionarios.jsp");
			
			dbc.close();		
			
			if(disp!=null){
				disp.forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}



	}
}