<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Supervisor</title>
</head>
<body>

		<table border = "1">
			<tr>
				<th>Usuario</th>
				<th>Nombre(s)</th>
				<th>Apellido Paterno</th>
				<th>Apellido Materno</th>
				<th>Tel&eacute;fono</th>
				<th>Correo</th>
				<th>Direcci&oacute;n</th>
			</tr>
			<c:forEach items="${admins}" var = "tuple">
				<tr>
					<td>${tuple.id}</td>
					<td>${tuple.nombre}</td>
					<td>${tuple.paterno}</td>
					<td>${tuple.materno}</td>
					<td>${tuple.telefono}</td>
					<td>${tuple.correo}</td>
					<td>${tuple.direccion}</td>
					<td>
						<form action="./editaradmin" method="post">
							<input type = "hidden" value = "${tuple.id}" name="editar" id="editar">
							<input type="submit" value="Modificar" />
						</form>
					</td>
					<td>
						<form action="./eliminaradmin" method="post">
							<input type ="hidden" value = "${tuple.id}" name = "eliminar" id="eliminar">
							<input type="submit" value="Eliminar" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</table><br>
		<form action = "./agregarAdministrador.jsp" method = "post">
			<input type = "submit" value = "Agregar" />
		</form>
</body>
</html>
