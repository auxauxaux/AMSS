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
	<h2>Selecciona un cuestionario</h2>
	
	<div class="container">
      <div class="well">
        	<form action = "./contestar" method = "post">
        		<h3>
					Cuestionarios Disponibles
		  		</h3>
		        <table class="table table-striped table-condensed">
		          <tbody>
		            <tr>
		 				<th>ID Cuestionario</th>
						<th>Nombre</th>
						<th>Fecha</th>
						<th>Seleccionar</th>
		            </tr>
					<c:forEach items="${requestScope.cuestionarios}" var = "tuple">
						<tr>
							<td>${tuple.id}</td>
							<td>${tuple.nombre}</td>
							<td>${tuple.fecha}</td>
							<td><input type="radio" name="cuestionario" value="${tuple.id}"/></td>
						</tr>
					</c:forEach>
		          </tbody>
		        </table>
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
