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
        <script>
		
			var numOp=0;
		
			function agregar(){
				var op = document.getElementById("pregunta").value;
				document.getElementById("opciones").value = document.getElementById("opciones").value + op + "$@";
				document.getElementById("aux").innerHTML = document.getElementById("aux").innerHTML + "<tr><td><div id='op"+numOp+"'> "+op+"</td> <td><input type='button' value='borrar' class='btn btn-info' onclick=\"borrar("+numOp+",'"+op+"')\" /> </div></td></tr>";
				numOp++;
				document.getElementById("pregunta").value="";
			}
			
			function borrar(num, txt){
				var borrar = document.getElementById("op"+num);
				var padre = document.getElementById("aux")
				padre.removeChild(borrar);
				
				var op = document.getElementById("opciones").value;
				op = op.replace(txt+"$@","");
				document.getElementById("opciones").value=op;
				
			}
		
		</script>
	</head>
	<body>
	
	<form method = "post" name = "preguntaM" onsubmit="return (validate());" action = "./agregar_preguntaM">
	            <center>
	                <div id ="agregarAdministrador">
	                    <fieldset>
	                        <legend>Informaci&oacute;n</legend>
	                        <table>
	                            <tr>
	                                <td colspan = "6"><center><h2>Pregunta</h2></center></td>
	                            </tr>
	                            <tr>
	                            	<td>Pregunta:</td>
	                                <td><input type="text" name="texto" maxlength="1000"></td>
	                                <input type="hidden" name="supervisor" value="${sessionScope.logged.id}">
	                            </tr>
	                        </table>
	                    </fieldset>
	                    
	                    <fieldset>
	                        <legend>Opciones</legend>
	                        Opci&oacute;n: <input type="text" name="pregunta" id="pregunta" />
	                        <input type="button" class="btn btn-info" onclick="agregar()" value="Agregar"/>
	                        
	                        <table>
	                            <th>Opciones</th>
	                            <tr><td><div id = "aux"></div><td></tr>
	                        </table>
							<input type="hidden" name="opciones" id="opciones" />
	                    </fieldset>
	                </div>
	                <!--<input type="button" onclick="alert(document.getElementById('opciones').value);" value="agregadas"/>-->
					<button type="submit" class="btn btn-info">
				      Agregar pregunta
				    </button>	                
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