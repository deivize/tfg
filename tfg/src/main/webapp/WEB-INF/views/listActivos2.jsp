<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Lista de activos</title>
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
				Ipsum lorem dolor aliquam ante commodo<br /> magna sed accumsan
				arcu neque.
			</h2>
		</header>
		<p>Accumsan orci faucibus id eu lorem semper. Eu ac iaculis ac
			nunc nisi lorem vulputate lorem neque cubilia ac in adipiscing in
			curae lobortis tortor primis integer massa adipiscing id nisi
			accumsan pellentesque commodo blandit enim arcu non at amet id arcu
			magna. Accumsan orci faucibus id eu lorem semper nunc nisi lorem
			vulputate lorem neque cubilia.</p>
		<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
			viewBox="0 0 800 1000">
							<jsp:include page="map.jsp"></jsp:include>
						</svg>
	</section>
	<section>
		<h4>Activos</h4>
		<div class="table-wrapper">
			<table class="alt">

				<thead>
					<tr>
						<th>Id activo</th>
						<th>Nombre activo</th>
						<th>Ver recorrido</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="activo" items="${activos}" varStatus="status">

						<tr>
							<td>${activo.idActivo}</td>
							<td>${activo.nombre}</td>
							<c:url var="verRecorrido" value="verRecorrido">
								<c:param name="id" value="${activo.idActivo}" />
							</c:url>
							<td><a href="<c:out value="${verRecorrido}"/>">Ver
									Recorrido</a></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="table-wrapper">
			<table class="alt">

				<thead>
					<tr>
						<th>Id activo</th>
						<th>Nombre activo</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="loc" items="${localizaciones}" varStatus="status">

						<tr>
							<td>${loc.coord_x}</td>
							<td>${loc.coord_y}</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
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
<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
<script src="${jqueryPop}"></script>
<script src="${skel}"></script>
<script src="${util}"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="${main}"></script>
<script>
				var localizaciones = [], locObject;
				
				<c:forEach var="loc" items="${localizaciones}">
					locObject = { coord_x: "${loc.coord_x}",coord_y: "${loc.coord_y}" }
					localizaciones.push(locObject);
				</c:forEach>
				
				var svg =d3.select("#svg1");
				
				var rect = svg.append("rect").attr("width", "100%").attr(
						"height", "100%").attr("fill-opacity","0.0").on("click", mouseclick);

				function mouseclick(d, i) {
					var coordinates = [0, 0];
// 					console.log(d3.mouse(this));
					coordinates = d3.mouse(this);
					$("#coordenadaX").val(coordinates[0]);
					$("#coordenadaY").val(coordinates[1]);
					
				};
				
				$("#botonCoord").on("click",function(){
					console.log($("#coordenadaX").val());
					
					var text = svg.append("text")
					.attr("x",$("#coordenadaX").val())
					.attr("y",$("#coordenadaY").val())
					.attr("font-family","sans-serif")
					.text($("#nombreLocalizacion").val())
					.attr("font-size","20px")
					.attr("fill","blue");
					
				});
				
				$(document).ready(function(){
					console.log(localizaciones[0].coord_x);
					console.log(localizaciones[0].coord_y);
				});
				
			</script>
</body>
</html>