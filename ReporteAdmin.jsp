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

	<c:choose> 
		<c:when test="${sessionScope.logged != null && sessionScope.logged.rol == 2}">


			<div class="container">
  			    <div class="well">
       				<div class="row">
          				<div class="col-md-8">
            				<h3>
              					Bienvenido ${sessionScope.logged.nombre}
            				</h3>
            				<p>
              					Reportes de participacion
            				</p>
          				</div>
          				<div class="col-md-4">
              				<a href="../MexicoParticipa2/logout" class="btn btn-link pull-right">Log out</a>
				        </div>
			    	</div>
        			<div class="row">
          				<div class="col-md-3">
          					<form action="/AMSS/examples/column-basic/index.jsp" method="post">
			        			<button type="submit" class="btn btn-info">
    			      				Reporte por Estados
		        				</button>
        					</form>
                            <form action="/AMSS/examples/column-basic/muestra.jsp" method="post">
			        			<button type="submit" class="btn btn-info">
    			      				Reporte muestra
		        				</button>
        					</form>
        					
        					
          				</div>
          			<div class="col-md-3">
          			</div>
          			<div class="col-md-3">
          				<!--aqui puedes meter mas botones
          				puedes hacer mas columnas pero la suma de col-md-x debe ser 12-->
          			</div>
          			<div class="col-md-3">
          			</div>
        		</div>
		      </div>
    		</div>
		    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
		    </script>
		    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js">
		    </script>
		</c:when>
		<c:otherwise>
			<c:redirect url="./index.jsp" />
		</c:otherwise>
		
	</c:choose>
	
	
</body>
</html>