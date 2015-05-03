<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Agregar Pregunta</title>
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
	
	<form method = "post" name = "pregunta" onsubmit="return (validate());" action = "./altaPregunta">
	            <center>
	                <div id ="agregarAdministrador">
	                    <fieldset>
	                        <legend>Informaci&oacute;n</legend>
	                        <table>
	                            <tr>
	                                <td colspan = "6"><center><h2>Datos</h2></center></td>
	                            </tr>
	                            <tr>
	                            	<td>Pregunta:</td>
	                                <td><input type="text" name="texto" class="textoPA" maxlength="1000"></td>
	                                <input type="hidden" name="supervisor" value="${sessionScope.logged.id}">
	                            </tr>
	                            <tr>
	                                <td>&nbsp;</td>
	                            </tr>
	                            <tr>
	                                <td colspan = "6"><input class = "button" type="submit" value="Agregar"/></td>
	                            </tr>
	                            
	                        </table>
	                    </fieldset>
	                </div>
	            </center>
	        </form>
	        </body>
</html>