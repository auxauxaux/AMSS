<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Agregar Administrador</title>
		<script type = "text/javascript">
            function validate(){
                var usuario = document.forms["administrador"]["usuario"].value;
                var password = document.forms["administrador"]["password"].value;
                var nombres = document.forms["administrador"]["nombres"].value;
                var paterno = document.forms["administrador"]["paterno"].value;
                var materno = document.forms["administrador"]["materno"].value;
                var telefono = document.forms["administrador"]["telefono"].value;
                var email = document.forms["administrador"]["email"].value;
                var calle = document.forms["administrador"]["calle"].value;
                var colonia = document.forms["administrador"]["colonia"].value;
                var ciudad = document.forms["administrador"]["ciudad"].value;
                var estado = document.forms["administrador"]["estado"].value;
                var cp = document.forms["administrador"]["codigoPostal"].value;
                
                if(usuario === null || usuario===""){
                    alert("Ingrese un usuario");
                    return false;
                }
                if(password === null || password===""){
                    alert("Ingrese su contraseña");
                    return false;
                }
                if(nombres === null || nombres===""){
                    alert("Ingrese su nombre");
                    return false;
                }
                if(paterno=== null || paterno ===""){
                    alert("Ingrese su primer apellido");
                    return false;
                }
                if(telefono=== null || telefono ===""){
                    alert("Ingrese su tel\xE9fono");
                    return false;
                }
                if(email!==null || email!==""){//agregar lo de la variable x
                    var posat=email.indexOf("@");
                    var posdot = email.indexOf(".");
                    if (posat<1 || posdot<posat+2 || posdot+2>=x.length){
                        alert("El e-mail no es v\xE1lido");
                        return false;
                    }
                }

                if(calle===null || calle ===""){
                    alert("Ingrese su calle");
                    return false;
                }
                if(colonia===null || colonia ===""){
                    alert("Ingrese su colonia");
                    return false;
                }
                if(ciudad===null || ciudad ===""){
                    alert("Ingrese su ciudad");
                    return false;
                }
                if(estado===null || estado ===""){
                    alert("Ingrese su estado");
                    return false;
                }
                if(cp===null || cp ===""){
                    alert("Ingrese su c\xF3digo postal");
                    return false;
                }
            }
        </script>
	</head>
	<body>
	
	<form method = "post" name = "administrador" onsubmit="return (validate());" action = "./altaAdministrador">
	            <center>
	                <div id ="agregarAdministrador">
	                    <fieldset>
	                        <legend>Informaci&oacute;n</legend>
	                        <table>
	                            <tr>
	                                <td colspan = "6"><center><h2>Datos</h2></center></td>
	                            </tr>
	                            <tr>
	                            	<td>Usuario:</td>
	                                <td><input type="text" name="usuario"></td>
	                                <td>Contrase&ntilde;a:</td>
	                                <td><input type="password" name="password"></td>
	                            </tr>
	                            <tr>
	                                <td>Nombre(s):</td>
	                                <td><input type="text" name="nombres"></td>
	                                <td>&nbsp;Apellido Paterno:</td>
	                                <td><input type="text" name="paterno"></td>
	                                <td>&nbsp;Apellido Materno:</td>
	                                <td><input type="text" name="materno"></td>
	                            </tr>
	                            <tr>
	                                <td>&nbsp;</td>
	                            </tr>
	                            <tr>
	                                <td>Tel&eacute;fono:</td>
	                                <td><input type= "text" name="telefono"></td>
	                                <td>&nbsp;Email:</td>
	                                <td><input type = "text" name = "email"></td>
	                            </tr>
	                            <tr><td>&nbsp;</td></tr>
	                            <tr>
	                                <td colspan = "6"><center><b>Direcci&oacute;n</b></center></td>
	                            </tr>
	                            <tr>
	                                <td>Calle:</td>
	                                <td><input type="text" name="calle"></td>
	                                <td>Colonia:</td>
	                                <td><input type="text" name="colonia"></td>
	                            </tr>
	                            <tr>
	                                <td>Ciudad:</td>
	                                <td><input type="text" name="ciudad"></td>
	                                <td>Estado:</td>
	                                <td><input type="text" name="estado"></td>
	                                <td>C&oacute;digo Postal:</td>
	                                <td><input type="text" name="codigoPostal"></td>
	                            </tr>
	                                
	                            <tr>
	                                <td>&nbsp;</td>
	                            </tr>
	                            <tr>
	                                <td colspan = "6"><input class = "button" type="submit" value="Guardar"/></td>
	                            </tr>
	                            
	                        </table>
	                    </fieldset>
	                </div>
	            </center>
	        </form>
	        </body>
</html>