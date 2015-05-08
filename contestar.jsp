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
			Estado:
			<select>
				<option>Distrito Federal</option>
				<option>Aguascalientes</option>
				<option>Baja California</option>
				<option>Baja California Sur</option>
				<option>Campeche</option>
				<option>Chiapas</option>
				<option>Chihuahua</option>
				<option>Coahuila</option>
				<option>Colima</option>
				<option>Durango</option>
				<option>Guanajuato</option>
				<option>Guerrero</option>
				<option>Hidalgo</option>
				<option>Jalisco</option>
				<option>Estado de M&eacute;xico</option>
				<option>Michoac&aacute;n</option>
				<option>Morelos</option>
				<option>Nayarit</option>
				<option>Nuevo Le&oacute;n</option>
				<option>Oaxaca</option>
				<option>Puebla</option>
				<option>Quer&eacute;taro</option>
				<option>Quintana Roo</option>
				<option>San Luis Potos&iacute;</option>
				<option>Sinaloa</option>
				<option>Sonora</option>
				<option>Tabasco</option>
				<option>Tamaulipas</option>
				<option>Tlaxcala</option>
				<option>Veracruz</option>
				<option>Yucat&aacute;n</option>
				<option>Zacatecas</option>
			</select>
			Municipio:
			<select>
				<option>&Aacute;lvaro Obreg&oacute;n</option>
				<option>Iztapalapa</option>
				<option>Iztacalco</option>
				<option>Xochimilco</option>
				<option>Asientos</option>
				<option>Calvillo</option>
				<option>Campeche</option>
				<option>Loreto</option>
				<option>Ju&aacute;rez</option>
				<option>Reforma</option>
				<option>El bosque</option>
				<option>Tecom&aacute;n</option>
				<option>Aldama</option>
				<option>Allende</option>
			</select>
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
