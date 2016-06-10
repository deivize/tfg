<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Nuevo lector</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<s:url value="/resources/css/home_main.css" var="homeCss" />
<s:url value="/resources/css/bootstrap.min.css" var="bootstrapMin" />
<s:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />
<s:url value="/resources/images/RFID-Tag.jpg" var="rfidTag" />
<s:url value="/resources/css/map.jsp" var="mapaJsp" />
<s:url value="/resources/js/jquery.min.js" var="jquery" />
<script src="${jquery}"></script>
<link rel="stylesheet" type="text/css" href="${bootstrapMin}" />
<link rel="stylesheet" href="${homeCss}" />
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${bootstrapJs}" type="text/javascript"></script>

</head>
<body id="top">

		<!-- Header -->
<header id="header">
	<a href="#" class="image avatar"><img src="${rfidTag}" alt="" /></a>
	<h1>
		<strong>MENU</strong>
	</h1>
	<div class="sidebar-nav">
		<div class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<span class="visible-xs navbar-brand">Sidebar menu</span>
			</div>
			<div class="navbar-collapse collapse sidebar-navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<s:url value="/home"/>">HOME</a></li>
					<li><a href="<s:url value="/home"/>">Volver</a></li>
				</ul>
			</div>
		</div>
		<!--/.nav-collapse -->
	</div>
</header>

<!-- Main -->
<div id="main">

	<!-- One -->
	<section id="one">
		<header class="major">
			<h2>
			</h2>
		</header>
		<p>Cree un nuevo lector y desplácelo hasta su posción</p>
		<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
			viewBox="0 0 800 1100">
							<jsp:include page="maps/${mapaActivo}.jsp"></jsp:include>
		</svg>
		
		<div style="margin-top:5px">
		<ul class="actions">
			<li><a href="#" id="nuevoLector" class="button special" onClick="return false">Nuevo lector</a></li>
		</ul>
		</div>
		
		<div>
		<sf:form id="nuevo_lector_form" method="POST" modelAttribute="lectorForm">
			<div class="oculto">
			<sf:input id="coord_x" path="coord_x" value=""></sf:input>
			<sf:input id="coord_y" path="coord_y" value=""></sf:input>
			</div>
			<sf:input id="modelo" path="modelo" value="" placeholder="Modelo"></sf:input>
			<sf:input id="tipo" path="tipo" value="" placeholder="Tipo"></sf:input>
			<sf:input id="edificio" path="edificio" value="" placeholder="Edificio"></sf:input>
			<sf:input id="area" path="area" value="" placeholder="Area"></sf:input>
			<sf:input id="zona" path="zona" value="" placeholder="Zona"></sf:input>
			<sf:input type="number" id="planta" path="planta" value="" placeholder="Planta"></sf:input>
		</sf:form>
		</div>
		<div style="margin-top:10px">
			<a href="#" class="button special" onClick="fillForm()">Guardar</a>
		</div>
		
		
	</section>
	<section>
		
		
	</section>
</div>

<!-- Footer -->
<!-- 			<footer id="footer"> -->
<!-- 				<ul class="icons"> -->
<%-- 					<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li> --%>
<%-- 					<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li> --%>
<%-- 					<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li> --%>
<%-- 					<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li> --%>
<!-- 				</ul> -->
<!-- 				<ul class="copyright"> -->
<!-- 					<li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li> -->
<!-- 				</ul> -->
<!-- 			</footer> -->

<!-- Scripts -->
<s:url value="/resources/js/jquery.poptrox.min.js" var="jqueryPop" />
<s:url value="/resources/js/skel.min.js" var="skel" />
<s:url value="/resources/js/util.js" var="util" />
<s:url value="/resources/js/main.js" var="main" />
<s:url value="/resources/js/areas.js" var="area" />
<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
<script src="${jqueryPop}"></script>
<script src="${area}"></script>
<script src="${skel}"></script>
<script src="${util}"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="${main}"></script>
<script>
		
	var lectores=[],lectorObject;
	var areas=[],areaObject;
	var escaleras=[],escaleraObject;
	var ascensores=[],ascensorObject;
	var banos=[],banoObject;
	var despachos=[],despachoObject;
	var textosLugares=[],textoObject;
	
	<c:forEach var="area" items="${areas}">
	areaObject = {
		tipo : "${area.tipo}",
		coord_x : "${area.localizacion.coord_x}",
		coord_y : "${area.localizacion.coord_y}",
		height : "${area.height}",
		width : "${area.width}"
	}
	areas.push(areaObject);
	</c:forEach>
	
	
	
	<c:forEach var="lector" items="${lectores}">
	lectorObject = {
		tipo : "${lector.tipo}",
		modelo : "${lector.modelo}",
		coord_x : "${lector.coord_x}",
		coord_y : "${lector.coord_y}"
	}
	lectores.push(lectorObject);
	</c:forEach>
	
	<c:forEach var="escalera" items="${escaleras}">
	escaleraObject = {
		coord_x : "${escalera.width}",
		coord_y : "${escalera.height}"
	}
	escaleras.push(escaleraObject);
	</c:forEach>
	
	<c:forEach var="ascensor" items="${ascensores}">
	ascensorObject = {
		coord_x : "${ascensor.width}",
		coord_y : "${ascensor.height}"
	}
	ascensores.push(ascensorObject);
	</c:forEach>
	
	<c:forEach var="bano" items="${banos}">
	banoObject = {
		coord_x : "${bano.width}",
		coord_y : "${bano.height}"
	}
	banos.push(banoObject);
	</c:forEach>
	
	<c:forEach var="despacho" items="${despachos}">
	despachoObject = {
		coord_x : "${despacho.width}",
		coord_y : "${despacho.height}"
	}
	despachos.push(despachoObject);
	</c:forEach>
	
	<c:forEach var="text" items="${textosLugares}">
	textoObject = {
		coord_x : "${text.width}",
		coord_y : "${text.height}",
		texto : "${text.texto}"
	}
	textosLugares.push(textoObject);
	</c:forEach>
	
	

	var svg = d3.select("#svg1");

	function fillForm() {
		var rects = d3.selectAll(".newLect");
		var form = $("#nuevo_lector_form");
		var coord_x = $("#coord_x");
		var coord_y = $("#coord_y");

		coord_x.val('');
		coord_y.val('');

		for (i = 0; i < rects[0].length; i++) {
			coord_x.val(coord_x.val() + "-" + rects[0][i].x.animVal.value);
			coord_y.val(coord_y.val() + "-" + rects[0][i].y.animVal.value);
		}

		form.submit();
	}

	$(document).ready(
			function() {
				$("#nuevoLector").click(
						function crearLector() {

							var w = svg.node().getBBox().width;
							var h = svg.node().getBBox().height;
							var width = 14.932404, height = 10.009442;

							var drag = d3.behavior.drag().origin(Object).on(
									"drag", dragmove);

							var dragrect = svg.append("rect").attr("width",
									width).attr("height", height).attr("x",
									"327.1229553222656").attr("y",
									"483.6956481933594").attr("stroke",
									"#000000").attr("stroke-width",
									"0.84172118").attr("stroke-opacity", "1")
									.attr("fill", "#36e30e").attr("class",
											"newLect ").attr("cursor", "move")
									.call(drag);

							function dragmove() {
								dragrect.attr("x", Math.max(0, Math.min(w
										- width, d3.mouse(this)[0])))

								dragrect.attr("y", Math.max(0, Math.min(h
										- height, d3.mouse(this)[1])));

							}
						});
			});
</script>
</body>
</html>