<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<style type="text/css">
.mapa {
	display: none;
}
</style>
<title>Home Page</title>
<script type="text/javascript">
	function showMap() {

		document.getElementById('mapa').style.display = "block";

	}
	function printTrace() {
		line = document.createElement('line');
		lector1 = document.getElementById('lector1');
		lector2 = document.getElementById('lector2');
		lector3 = document.getElementById('lector3');
		line.setAttribute('x1', '8.9151812');
		line.setAttribute('y1', '19.530167');
		line.setAttribute('x2', '340.43829');
		line.setAttribute('x2', '330.79755');
		line.setAttribute('style','stroke:rgb(255,0,0);stroke-width:2')
		document.getElementById("mapcontainer").appendChild(line);
	}
</script>
</head>

<body>
	<div id="menu" class="menu">
		<input type="button" value="Ver Mapa" onclick="showMap()"><br>
		<a href="<s:url value="/activos/listactivos"/>">Ver lista deactivos</a><br>
		<a href="<s:url value="activos?new"/>">Crearnuevo activo</a><br> 
		<input type="button" value="Dibujar recorrido" onclick="printTrace()"><br>

	</div>

	<div id="mapa" class="mapa">
		<svg height="1000" width="1000"> 
		<g id="mapcontainer"
			style="fill:none;stroke:#000000"
			transform="matrix(0.92131341,0,0,0.93511906,35.636145,35.381704)"
			id="g4"> 
			<path style="stroke-width:0.83458px"
			d="m -0.082709,-0.082712 735.929999,0 0,682.420002 -735.929999,0 z"
			id="map_border" /> 
			<path style="stroke-width:1px"
			d="m 356.73,682.25 0,-334.44" id="path4143" /> 
			<path id="path3339"
			d="m 356.76909,-0.6820391 0,260.3327391"
			style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.07569587px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" />
		<rect style="fill:#f9f9f9;stroke-width:1.07736492" id="lector1"
			width="43.491894" height="30.722496" x="8.9151812" y="19.530167" />
		<rect style="fill:#f9f9f9;stroke-width:1.07736492" id="lector2"
			width="29.541664" height="15.361248" x="340.43829" y="330.79755" />
		<rect style="fill:#f9f9f9;stroke-width:1.07736492" id="lector3"
			width="36.106476" height="24.254602" x="654.72876" y="289.56473" />
		</g> 
		</svg>
	</div>
</body>

</html>