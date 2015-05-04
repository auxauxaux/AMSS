 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose> 
		<c:when test="${sessionScope.logged != null && sessionScope.logged.rol == 1}">
			<c:redirect url = "./supervisor.jsp" />
		</c:when>
		<c:when test = "${sessionScope.logged != null && sessionScope.logged.rol == 2}">
			<c:redirect url = "./administrador.jsp" />
		</c:when>
		<c:otherwise>
			<html>
				<head>
					<title>Inicio</title>
				</head>
				<body>
					<form action="./login" method="post">
						<input type="text" placeholder="usuario" size="20" id="usuario" name="usuario"/><br>
						<input type="password" placeholder="password" size="20" id="usuario" name="password"><br>
						<input type="submit" value="Entrar" />
					</form>
				</body>
			</html>
		</c:otherwise>
		
</c:choose>
