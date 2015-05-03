public class PAdministracion{
	private String id;
	private String nombre;
	private String paterno;
	private String materno;
	private String telefono;
	private String correo;
	private String direccion;
	private int rol;
	public PAdministracion(){
		
	}
	public PAdministracion(String id, String nombre, String paterno, String materno, String telefono, String correo, String direccion, int rol){
		this.id = id;
		this.nombre = nombre;
		this.paterno = paterno;
		this.materno = materno;
		this.telefono = telefono;
		this.correo = correo;
		this.direccion = direccion;
		this.rol = rol;
	}
	public String getId(){
		return id;
	}
	public String getNombre(){
		return nombre;
	}
	public String getPaterno(){
		return paterno;
	}
	public String getMaterno(){
		return materno;
	}
	public String getTelefono(){
		return telefono;
	}
	public String getCorreo(){
		return correo;
	}
	public String getDireccion(){
		return direccion;
	}
	public int getRol(){
		return rol;
	}
	public void setId(String id){
		this.id = id;
	}
	public void setNombre(String nombre){
		this.nombre = nombre;
	}
	public void setPaterno(String paterno){
		this.paterno = paterno;
	}
	public void setMaterno(String materno){
		this.materno = materno;
	}
	public void setTelefono(String telefono){
		this.telefono = telefono;
	}
	public void setCorreo(String correo){
		this.correo=correo;
	}
	public void setDireccion(String direccion){
		this.direccion = direccion;
	}
	public void setRol(int rol){
		this.rol=rol;
	}
	
}