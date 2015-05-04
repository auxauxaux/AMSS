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
	<h2>Seleccionar preguntas de cuestionario</h2>
	<div class="container">
      <div class="well">
        <h3>
          Preguntas Abiertas
        </h3>
        	<form action = "./agregarCuestionario" method = "post">
		        <table class="table table-striped table-condensed">
		          <tbody>
		            <tr>
		 				<th>ID Pregunta</th>
						<th>Pregunta</th>
						<th>Fecha</th>
						<th>Supervisor</th>
						<th>Seleccionar</th>
		            </tr>
					<c:forEach items="${requestScope.preguntasA}" var = "tuple">
						<tr>
							<td>${tuple.id}</td>
							<td>${tuple.texto}</td>
							<td>${tuple.fecha}</td>
							<td>${tuple.idA}</td>
							<td><input type="checkbox" name="preguntasA" value="${tuple.id}"/></td>
						</tr>
					</c:forEach>
		          </tbody>
		        </table>
				<br />
				
		        <h3>
		          Opci&oacute;n M&uacute;ltiple
		        </h3>
		        <table class="table table-striped table-condensed">
		          <tbody>
		            <tr>
		 				<th>ID Pregunta</th>
						<th>Pregunta</th>
						<th>Opciones</th>
						<th>Fecha</th>
						<th>Supervisor</th>
						<th>Seleccionar</th>
		            </tr>
					<c:forEach items="${requestScope.preguntasM}" var = "tupleM">
						<tr>
							<td>${tupleM.id}</td>
							<td>${tupleM.texto}</td>
							<td>
								<select>
									<c:forEach items="${tupleM.opciones}" var = "opcion">
										<option value = "${opcion.id}">"${opcion.texto}"</option>
									</c:forEach>
								</select>
							</td>
							<td>${tupleM.fecha}</td>
							<td>${tupleM.idA}</td>
							<td><input type="checkbox" name="preguntasM" value="${tupleM.id}"/></td>
						</tr>
					</c:forEach>
		          </tbody>
		        </table>
		<br />
			<input type="hidden" name="admin" id="admin" value = "${sessionScope.logged.id}" />
			<button type="submit" class="btn btn-info">
      			Agregar
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
