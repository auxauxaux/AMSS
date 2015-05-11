<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <%
String password="root"; 
String usuario="root";
String base = "mydb";
String url="jdbc:mysql://localhost/"+base;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(url, usuario, password);
Statement st = con.createStatement();

String query = "SELECT * FROM Resp WHERE 1";

ResultSet res = st.executeQuery(query);
res.next();
int estado =  res.getInt("estado");
int edad =  res.getInt("edad");
int[] estados =new int[33];
int[] estados2 =new int[33];
int[] estados3 =new int[33];
int[] estados4 =new int[33];
int[] estados5 =new int[33];
int[] estados6 =new int[33];
while (res.next()){
	if(edad<18){
		estados[estado] = estados[estado]+1;
	}else{
		if(edad>17 && edad<25){
			estados2[estado] = estados2[estado]+1;
		}else{
			if(edad>24 && edad<35){
				estados3[estado] = estados3[estado]+1;
			}else{
				if(edad>34 && edad<45){
					estados4[estado] = estados4[estado]+1;
				}else{
					if(edad>44 && edad < 54){
						estados5[estado] = estados5[estado]+1;
					}else{
						estados6[estado] = estados6[estado]+1;
					}
				}
			}
		}		
	}
	estado =  res.getInt("estado");
	edad =  res.getInt("edad");
}
estados[estado] = estados[estado]+1;


%>
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
            data: [<%for(int i = 0; i < 32;i++){
						if(i==32){
							out.println(estados[i+1]);
						}else{
							out.println(estados[i+1]+",");
						}
				   		
					};%>]

        }, {
            name: '18-24',
            data: [<%for(int i = 0; i < 32;i++){
						if(i==32){
							out.println(estados2[i+1]);
						}else{
							out.println(estados2[i+1]+",");
						}
				   		
					};%>]

        }, {
            name: '25-34',
            data: [<%for(int i = 0; i < 32;i++){
						if(i==32){
							out.println(estados3[i+1]);
						}else{
							out.println(estados3[i+1]+",");
						}
				   		
					};%>]

        },{
            name: '35-44',
            data: [<%for(int i = 0; i < 32;i++){
						if(i==32){
							out.println(estados4[i+1]);
						}else{
							out.println(estados4[i+1]+",");
						}
				   		
					};%>]

        }, {
            name: '45-54',
            data: [<%for(int i = 0; i < 32;i++){
						if(i==32){
							out.println(estados5[i+1]);
						}else{
							out.println(estados5[i+1]+",");
						}
				   		
					};%>]

        }, {
            name: '54 en adelante',
            data: [<%for(int i = 0; i < 32;i++){
						if(i==32){
							out.println(estados6[i+1]);
						}else{
							out.println(estados6[i+1]+",");
						}
				   		
					};%>]

        }
		]
    });
});
		</script>
	</head>
	<body>
    
   
<script src="../../js/highcharts.js"></script>
<script src="../../js/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

	</body>
</html>
