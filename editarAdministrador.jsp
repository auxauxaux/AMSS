<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose> 
		<c:when test="${sessionScope.logged != null && sessionScope.logged.rol == 1}">
		</c:when>
		<c:otherwise>
			<c:redirect url="./index.jsp" /> <!--Mandar a una ventanda de acceso restringido-->
		</c:otherwise>
		
</c:choose>
<c:choose> 
		<c:when test="${requestScope.user == null}">
			<c:redirect url = "./agregarAdministrador.jsp" /> <!--Mostrar algun mensaje de que no se encontró el id, pero eso no debería de pasar más que si la tabla está vacía o algo-->
		</c:when>
</c:choose>
<html>
	<head>
		<title>Editar Administrador</title>
		<script type = "text/javascript">
            function validate(){
                var usuario = document.forms["administrador"]["usuario"].value;
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
		
	<form method = "post" name = "administrador" onsubmit="return (validate());" action = "./subedit">
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
	                                <td><input type="text" name="usuario" value="${requestScope.user.id}"></td>
	                                <input type = "hidden" name = "usuarioA" value = "${requestScope.user.id}">
	                            </tr>
	                            <tr>
	                                <td>Nombre(s):</td>
	                                <td><input type="text" name="nombres" value="${requestScope.user.nombre}"></td>
	                                <td>&nbsp;Apellido Paterno:</td>
	                                <td><input type="text" name="paterno" value = "${requestScope.user.paterno}"></td>
	                                <td>&nbsp;Apellido Materno:</td>
	                                <td><input type="text" name="materno" value = "${requestScope.user.materno}"></td>
	                            </tr>
	                            <tr>
	                                <td>&nbsp;</td>
	                            </tr>
	                            <tr>
	                                <td>Tel&eacute;fono:</td>
	                                <td><input type= "text" name="telefono" value = "${requestScope.user.telefono}"></td>
	                                <td>&nbsp;Email:</td>
	                                <td><input type = "text" name = "email" value = "${requestScope.user.correo}"></td>
	                            </tr>
	                            <tr><td>&nbsp;</td></tr>
	                            <tr>
	                                <td colspan = "6"><center><b>Direcci&oacute;n</b></center></td>
	                            </tr>
	                            <tr>
	                                <td>Calle:</td>
	                                <td><input type="text" name="calle" value = "${requestScope.user.direccion}"></td>
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
	                                <td colspan = "6"><input class = "button" type="submit" value="Editar"/></td>
	                            </tr>
	                            
	                        </table>
	                    </fieldset>
	                </div>
	            </center>
	        </form>
	        </body>
</html>