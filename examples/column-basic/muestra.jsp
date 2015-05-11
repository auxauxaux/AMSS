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
            data:[22,322,100,234,98,10,76,09,13,999,101,3343,983,7653,83,33,4323,1233,7653,983,376,4323,443,553,663,653,653,1253,7893,7653,223,213]

        }, {
            name: '25-34',
            data: [123,32,45,502,423,900,800,199,283,5682,697,723,745,283,837,302,1238,2011,1273,122,112,192,128,829,480,1029,823,1039,923,837,900,912]


        },{
            name: '35-44',
            data:[51,12,36,47,545,786,887,978,869,410,131,122,103,149,150,161,171,182,1965,2065,2671,2562,2453,2314,225,236,627,288,209,380,371,362]

        }, {
            name: '45-54',
            data: [121,131,546,201,102,209,38,932,102,293,383,192,123,184,127,128,123,345,432,132,145,2345,239,102,1283,182,372,183,200,199,103,1193]

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