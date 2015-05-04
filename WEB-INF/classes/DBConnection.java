import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DBConnection{
	private String base="mydb";
	private String user="root";
	private String password="root";
	private String llaveAES="root";
	private Connection con;
	private Statement stat;
	private String url;
	private String host="localhost";

	public DBConnection(){
		try{
			url = "jdbc:mysql://localhost/"+base;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,user,password);
			stat = con.createStatement();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public DBConnection(String host){
		try{
			this.host = host;
			url = "jdbc:mysql://"+host+"/"+base;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,user,password);
			stat = con.createStatement();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public PAdministracion login(String username, String password){
		PAdministracion user = null;
		try{
			String query = "SELECT id_administracion, nombres, apellido_paterno, apellido_materno, rol FROM Administracion WHERE id_administracion = '"+username+"' AND password = AES_ENCRYPT('"+password+"','"+llaveAES+"');";
			//id_administracion, nombres, apellido_paterno, apellido_materno, rol
			ResultSet res = executeQuery(query);

			if(res.next()){
				user = new PAdministracion();
				user.setId(res.getString("id_administracion"));
				user.setNombre(res.getString("nombres"));
				user.setPaterno(res.getString("apellido_paterno"));
				user.setMaterno(res.getString("apellido_materno"));
				user.setRol(res.getInt("rol"));
			}

		}catch(Exception e){
			e.printStackTrace();
		}

		return user;

	}
	public void close() throws SQLException {
		if(stat != null){
			stat.close();
		}
		if(con != null){
			con.close();
		}
	}

	public ResultSet executeQuery(String query){
		ResultSet res = null;
		try{
			res = stat.executeQuery(query);
		}catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}

	public int executeUpdate(String query){
		int i = 0;
		try{
			i = stat.executeUpdate(query);
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}

}