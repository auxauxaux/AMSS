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
		  				${opcion.texto} &nbsp; <input type="radio" name="opciones${preguntaM.id}" value="${opcion.id}"/>
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
			Edad:
			<select>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
				<option>6</option>
				<option>7</option>
				<option>8</option>
				<option>9</option>
				<option>10</option>
				<option>11</option>
				<option>12</option>
				<option>13</option>
				<option>14</option>
				<option>15</option>
				<option>16</option>
				<option>17</option>
				<option>18</option>
				<option>19</option>
				<option>20</option>
				<option>21</option>
				<option>22</option>
				<option>23</option>
				<option>24</option>
				<option>25</option>
				<option>26</option>
				<option>27</option>
				<option>28</option>
				<option>29</option>
				<option>30</option>
				<option>31</option>
				<option>32</option>
				<option>33</option>
				<option>34</option>
				<option>35</option>
				<option>36</option>
				<option>37</option>
				<option>38</option>
				<option>39</option>
				<option>40</option>
				<option>41</option>
				<option>42</option>
				<option>43</option>
				<option>44</option>
				<option>45</option>
				<option>46</option>
				<option>47</option>
				<option>48</option>
				<option>49</option>
				<option>50</option>
				<option>51</option>
				<option>52</option>
				<option>53</option>
				<option>54</option>
				<option>55</option>
				<option>56</option>
				<option>57</option>
				<option>58</option>
				<option>59</option>
				<option>60</option>
				<option>61</option>
				<option>62</option>
				<option>63</option>
				<option>64</option>
				<option>65</option>
				<option>66</option>
				<option>67</option>
				<option>68</option>
				<option>69</option>
				<option>70</option>
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
