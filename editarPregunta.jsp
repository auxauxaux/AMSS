<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose> 
		<c:when test="${sessionScope.logged != null && sessionScope.logged.rol == 1}">
			
		</c:when>
		<c:otherwise>
			<c:redirect url="./index.jsp" /> <!--Mandar a una pantalla de que el acceso es restringido-->
		</c:otherwise>
		
</c:choose>
<c:choose> 
		<c:when test="${requestScope.pregunta == null}">
			<c:redirect url = "./agregarAdministrador.jsp" /> <!--Mostrar algun mensaje de que no se encontró el id, pero eso no debería de pasar más que si la tabla está vacía o alguien cambie el id en el proceso-->
		</c:when>
</c:choose>
<html>
	<head>
		<title>Editar Pregunta</title>
		<script type = "text/javascript">
            function validate(){
                var pregunta = document.forms["pregunta"]["texto"].value;
                
                if(pregunta === null || pregunta===""){
                    alert("Ingrese el texto de la pregunta");
                    return false;
                }
            }
        </script>
	</head>
	<body>
	
	<form method = "post" name = "pregunta" onsubmit="return (validate());" action = "./sub_pregunta">
	            <center>
	                <div id ="agregarPregunta">
	                    <fieldset>
	                        <legend>Informaci&oacute;n</legend>
	                        <table>
	                            <tr>
	                                <td colspan = "6"><center><h2>Datos</h2></center></td>
	                            </tr>
	                            <tr>
	                            	<td>Pregunta:</td>
	                                <td><input type="text" name="texto" class="textoPA" maxlength="1000" value = "${requestScope.pregunta.texto}"></td>
	                                	<input type = "hidden" name = "id" value = "${requestScope.pregunta.id}">
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