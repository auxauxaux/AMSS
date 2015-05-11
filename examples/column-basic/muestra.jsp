<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
    	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Reporte de participacion</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
${demo.css}
		</style>
		<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Mexico Participa'
        },
        subtitle: {
            text: 'Reporte de participacion por estado'
        },
        xAxis: {
            categories: [
                'Aguascalientes',
				'Baja California',
				'Baja California Sur',
				'Campeche',
				'Chiapas',
				'Chihuahua',
				'Coahuila',
				'Colima',
				'Distrito Federal',
				'Durango',
				'Estado de México',
				'Guanajuato',
				'Guerrero',
				'Hidalgo',
				'Jalisco',
				'Michoacán',
				'Morelos',
				'Nayarit',
				'Nuevo León',
				'Oaxaca',
				'Puebla',
				'Querétaro',
				'Quintana Roo',
				'San Luis Potosí',
				'Sinaloa',
				'Sonora',
				'Tabasco',
				'Tamaulipas',
				'Tlaxcala',
				'Veracruz',
				'Yucatán',
				'Zacatecas',
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Numero de Ciudadanos'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} participantes</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
		
        subtitle2: {
            text: 'Rango de edad de participacion'
        },
		
        series: [
	   {
            name: 'menores de 18',
            data: [10,7,47,39,18,13,53,62,60,51,42,22,30,34,27,19,50,53,49,52,39,64,44,36,10,34,13,29,26,23,43,12]

        }, {
            name: '18-24',
            data:[22,32,100,23,98,10,76,09,13,99,10,34,83,53,83,33,33,12,65,98,36,33,43,53,63,63,53,123,73,73,23,21]

        }, {
            name: '25-34',
            data: [12,32,45,52,43,90,80,19,23,82,67,73,75,23,87,32,18,21,13,12,19,19,12,89,48,12,83,19,93,87,90,91]


        },{
            name: '35-44',
            data:[51,12,36,47,55,76,87,98,89,40,11,12,13,14,10,11,11,82,65,25,27,22,23,28,89,36,62,28,29,38,37,36]

        }, {
            name: '45-54',
            data: [121,131,46,21,12,29,38,92,10,23,33,19,23,84,27,28,23,45,32,32,45,34,39,12,23,82,72,83,20,19,13,93]

        }, {
            name: '54 en adelante',
            
data:[22,15,33,29,23,10,51,62,64,57,41,27,47,33,22,27,55,51,44,42,31,61,42,32,11,30,19,20,26,23,41,48]

        }
		]
    });
});
		</script>
	</head>
	<body>
    
   
<script src="../../../../../../../xampp/tomcat/webapps/AMSS-master/js/highcharts.js"></script>
<script src="../../../../../../../xampp/tomcat/webapps/AMSS-master/js/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	</body>
</html>