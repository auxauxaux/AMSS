<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Supervisor</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
    rel="stylesheet">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"
    rel="stylesheet">
</head>
<body>
	
	<div class="container">
      <div class="well">
        	<form action = "./respondido.jsp" method = "post">
        		<h1>
					Cuestionario: ${cuestionario.nombre}
		  		</h1>
		  		
		  		<h3>Preguntas Abiertas</h3>
		  		<br />
		  		<c:forEach items = "${cuestionario.preguntasA}" var = "preguntaA">
		  			${preguntaA.texto}
		  			<br />
		  			<textarea rows="4" cols="50" name="${preguntaA.id}"></textarea>
		  			<br />
		  			<br />
		  		</c:forEach>
		  		<br />
		  		<h3>Opci&oacute;n M&uacute;ltiple</h3>
		  		<c:forEach items = "${cuestionario.preguntasM}" var = "preguntaM">
		  			${preguntaM.texto}
		  			<br />
		  			<c:forEach items = "${preguntaM.opciones}" var = "opcion">
		  				${opcion.texto} &nbsp; <input type="radio" name="opciones" value="${opcion.id}"/>
		  			</c:forEach>
		  			<br />
		  			<br />
		  		</c:forEach>
				<br />
		<br />
			<button type="submit" class="btn btn-info">
      			Contestar
		    </button>
		</form>
      </div>
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"
    >
    </script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"
    >
    </script>
</body>
</html>
