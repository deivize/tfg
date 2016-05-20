<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Buscar localizaciones</title>
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
					<li>
						<c:url var="descargar" value="descarga">
							<c:param name="edificio" value="${localizacionForm.edificio}"/>
							<c:param name="planta" value="${localizacionForm.planta}"/>
							<c:param name="area" value="${localizacionForm.area}"/>
							<c:param name="zona" value="${localizacionForm.zona}"/>
						</c:url>
						<a href="<c:out value="${descargar}"/>">Descargar informe</a>
					</li>
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
		
		<sf:form id="buscar_localizaciones_form" method="POST" modelAttribute="localizacionForm"
				class="form-lector">
				<div class="row uniform 50%">
					<div class="12u$">
						<sf:input type="text" path="edificio" name="edificio_loc"
							id="edificio_loc" value="" placeholder="Edificio" />
					</div>
					<div class="12u$">
						<sf:input type="text" path="area" name="area_loc"
							id="area_loc" value="" placeholder="Area" />
					</div>
					<div class="12u$">
						<sf:input type="text" path="zona" name="zona_loc"
							id="zona_loc" value="" placeholder="Zona" />
					</div>
					<div class="12u$">
						<sf:input type="number" path="planta" name="planta_loc"
							id="planta_loc" value="" />
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input id="localizacion_button" type="submit"
								value="Buscar localizaciones" class="special" /></li>
						</ul>
					</div>
				</div>
			</sf:form>	
	</section>
	<section>
		<div class="table-wrapper">
			<table class="alt">

				<thead>
					<tr>
						<th>Id localizacion</th>
						<th>Edificio</th>
						<th>Planta</th>
						<th>Area</th>
						<th>Zona</th>
						<th>Fecha</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="localizacion" items="${localizaciones}" varStatus="status">

						<tr>
							<td>${localizacion.idLocalizacion}</td>
							<td>${localizacion.edificio}</td>
							<td>${localizacion.planta}</td>
							<td>${localizacion.area}</td>
							<td>${localizacion.zona}</td>
							<td>${localizacion.fecha}</td>
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
	var lectores=[],lectorObject;
	
	
	<c:forEach var="lector" items="${lectores}">
	lectorObject = {id:"${lector.idLector}",tipo:"${lector.tipo}",modelo:"${lector.modelo}"};
	lectores.push(lectorObject);
	</c:forEach>
				
</script>
</body>
</html>