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
        <h3>
          Cuestionarios
        </h3>
        
        <table class="table table-striped table-condensed">
          <tbody>
            <tr>
 				<th>id</th>
 				<th>nombre</th>
				<th># Preguntas</th>
				<th>Preguntas Abiertas</th>
				<th>Opci&oacute;n M&uacute;ltiple</th>
				<th>Fecha</th>
				<th>Administrador</th>
				<th colspan="2">Acci&oacute;n</th>
            </tr>
			<c:forEach items="${cuestionarios}" var = "tuple">
				<tr>
					<td>${tuple.id}</td>
					<td>${tuple.nombre}</td>
					<td>${tuple.preguntas}</td>
					<td>
						<select>
							<c:forEach items="${tuple.preguntasA}" var = "pa">
								<option value = "${pa.id}">"${pa.texto}"</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select>
							<c:forEach items="${tuple.preguntasM}" var = "pm">
								<option value = "${pm.id}">"${pm.texto}"</option>
							</c:forEach>
						</select>
					</td>
					<td>${tuple.fecha}</td>
					<td>${tuple.idA}</td>
					<td>
					<!--
						<form action="./editaradmin" method="post">
							<input type = "hidden" value = "${tuple.id}" name="editar" id="editar">
								<button type="submit" class="btn btn-info">
      								Modificar
							    </button>
						</form>-->
					</td>
					<td>
					
						<form action="./eliminar_cuestionario" method="post">
							<input type ="hidden" value = "${tuple.id}" name = "eliminar" id="eliminar">
								<button type="submit" class="btn btn-info">
      								Eliminar
							    </button>
						</form>
					</td>
				</tr>
			</c:forEach>
          </tbody>
        </table>
		<br />
		<form action = "./pregCuestionario" method = "post">
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
