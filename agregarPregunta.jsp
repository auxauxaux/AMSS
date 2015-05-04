<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Agregar Pregunta</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta name="description" content="">
	    <meta name="author" content="">
    	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	    rel="stylesheet">
    	<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
	    rel="stylesheet">
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
	                                <td colspan = "6"><button type="submit" class="btn btn-info">Agregar</button></td>
	                            </tr>
	                            
	                        </table>
	                    </fieldset>
	                </div>
	            </center>
	        </form>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"
		    >
		    </script>
		    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"
		    >
		    </script>
	        </body>
</html>