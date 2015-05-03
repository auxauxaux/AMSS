<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Administrador</title>
</head>
<body>

	<c:choose> 
		<c:when test="${sessionScope.logged != null && sessionScope.logged.rol == 2}">
			Login de administrador exitoso
		</c:when>
		<c:otherwise>
			<c:redirect url="./index.jsp" />
		</c:otherwise>
		
	</c:choose>	
	<a href="./logout">log out</a>

</body>
</html>
