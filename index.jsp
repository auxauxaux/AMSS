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
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
				    <meta name="description" content="">
				    <meta name="author" content="">
				    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
				    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
				</head>
				<body>
				
				<div class="container">
			      <div class="jumbotron">
			        <h1>
          				Bienvenidos a la aplicaci&oacute;n
			        </h1>
        			<p>
			          Login
        			</p>
					<form action="./login" method="post">
          				<div class="form-group">
				            <label>
				              Usuario
				            </label>
				            <input type="text" placeholder="usuario" size="20" id="usuario" name="usuario" class="form-control"/>
			          </div>
			          <div class="form-group">
				            <label>
					            Clave
				            </label>
				            <input type="password" placeholder="password" size="20" id="usuario" name="password" class="form-control">
			          </div>
			   		  <input type="submit" value="Entrar" class="btn btn-primary btn-lg"/>
			   	   </form>
      			  </div>
			    </div>

				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
			    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>		
				</body>
			</html>
		</c:otherwise>
		
</c:choose>
