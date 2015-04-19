<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<style type="text/css">
	
	.mapa{
		display:none;	
	}


</style>
<title>Home Page</title>
<script type="text/javascript">
function showMap(){
	
	document.getElementById('mapa').style.display="block";
	
}
</script>
</head>

<body>
<div id="menu" class="menu">
	<input type="button" value="Ver Mapa" onclick="showMap()"></b><br>
	<a href="<s:url value="/activos/listactivos"/>">Ver lista de activos</a><br>
	<a href="<s:url value="activos?new"/>">Crear nuevo activo</a><br>
	<b>Dibujar recorrido</b><br>

</div>

<div id="mapa" class="mapa">
	<svg height="1000" width="1000">
		<g
     style="fill:none;stroke:#000000"
     transform="matrix(0.92131341,0,0,0.93511906,35.636145,35.381704)"
     id="g4">
    <path
       style="stroke-width:0.83458px"
       d="m -0.082709,-0.082712 735.929999,0 0,682.420002 -735.929999,0 z"
       id="map_border" />
    <path
       style="stroke-width:1px"
       d="m 356.73,682.25 0,-334.44"
       id="path4143" />
    <path
       id="path3339"
       d="m 356.76909,-0.6820391 0,260.3327391"
       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.07569587px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
  </g>
	</svg>
</div>
</body>

</html>