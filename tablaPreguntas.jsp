<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Supervisor</title>
</head>
<body>
		<h2>Preguntas Abiertas<h2>
		<table border = "1">
			<tr>
				<th>ID Pregunta</th>
				<th>Pregunta</th>
				<th>Fecha</th>
				<th>Supervisor</th>
				<th colspan="2">Acci&oacute;n</th>
			</tr>
			<c:forEach items="${requestScope.preguntas}" var = "tuple">
				<tr>
					<td>${tuple.id}</td>
					<td>${tuple.texto}</td>
					<td>${tuple.fecha}</td>
					<td>${tuple.idA}</td>
					<td>
						<form action="./editar_pregunta_abierta" method="post">
							<input type = "hidden" value = "${tuple.id}" name="editar" id="editar">
							<input type="submit" value="Modificar" />
						</form>
					</td>
					<td>
						<form action="./eliminar_pregunta" method="post">
							<input type ="hidden" value = "${tuple.id}" name = "eliminar">
							<input type="submit" value="Eliminar" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</table><br>
		
		<form action = "./agregarPregunta.jsp" method = "post">
			<input type = "submit" value = "Agregar" />
		</form>
		
		<h2>Opci&oacute;n M&uacute;ltiple<h2>
		<table border = "1">
			<tr>
				<th>ID Pregunta</th>
				<th>Pregunta</th>
				<th>Opciones</th>
				<th>Fecha</th>
				<th>Supervisor</th>
				<th colspan="2">Acci&oacute;n</th>
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
					<td>
						<form action="./editar_pregunta_multiple" method="post">
							<input type = "hidden" value = "${tupleM.id}" name="editar" id="editar">
							<input type="submit" value="Modificar" />
						</form>
					</td>
					<td>
						<form action="./eliminar_pregunta" method="post">
							<input type ="hidden" value = "${tupleM.id}" name = "eliminar">
							<input type="submit" value="Eliminar" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</table><br>
		
		<form action = "./agregarPreguntaM.jsp" method = "post">
			<input type = "submit" value = "Agregar" />
		</form>
</body>
</html>
