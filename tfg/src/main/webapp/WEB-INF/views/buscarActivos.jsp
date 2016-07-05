<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Buscar Activos</title>
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
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"
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
<!-- 					<li> -->
<%-- 						<c:url var="descargar" value="descarga"> --%>
<%-- 							<c:param name="tipo" value="${lectorForm.tipo}"/> --%>
<%-- 							<c:param name="modelo" value="${lectorForm.modelo}"/> --%>
<%-- 						</c:url> --%>
<%-- 						<a href="<c:out value="${descargar}"/>">Descargar informe</a> --%>
<!-- 					</li> -->
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
		<p></p>
		
		<sf:form id="activo_form" method="POST" modelAttribute="activoForm"
				class="form-lector">
				<div class="row uniform 50%">
					<div class="12u$">
						<sf:input type="text" path="nombre" name="nombre_activo"
							id="nombre_activo" value="" placeholder="Nombre activo" />
					</div>
					<div class="12u$">
						<sf:input type="text" path="categoria" name="categoria_activo"
							id="categoria_activo" value="" placeholder="Categoria activo" />
					</div>
					<div class="12u$">
						<sf:input path="fechaCaducidad" name="fecha_caducidad"
							id="datepicker" value="" placeholder="Fecha caducidad" />
					</div>
				</div>
			</sf:form>	
			<div style="margin-top:2px">
				<a href="#" class="button special" onClick="fillForm()">Buscar</a>
			</div>
	</section>
	<section>
		<div class="table-wrapper">
			<table class="alt">

				<thead>
					<tr>
						<th>Id activo</th>
						<th>Nombre activo</th>
						<th>Categoria activo</th>
						<th>Fecha caducidad</th>
						<th>Id etiqueta</th>
						<th>Contenido etiqueta</th>
						<th>Ver en mapa</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="activo" items="${listaActivos}" varStatus="status">
						<c:url var="ver" value="/activos/verRecorrido">
							<c:param name="id" value="${activo.idActivo}"/>
						</c:url>
						<tr>
							<td>${activo.idActivo}</td>
							<td>${activo.nombre}</td>
							<td>${activo.categoria}</td>
							<td>${activo.fechaCaducidad}</td>
							<td>${activo.etiqueta.idEtiqueta}</td>
							<td>${activo.etiqueta.contenido}</td>
							<td><a href="<c:out value="${ver}"/>">Ver mapa</a></td>
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

	
function fillForm(){
	var form=$("#activo_form");
	
	
	if($("#datepicker").val()==""){
		$("#datepicker").val('12/20/2200 11:07');	
	}
	
	form.submit();
}

	
	$(document).ready(

		
		function() {
			$("#datepicker").datepicker({
			
			});
		}

		);
				
</script>
</body>
</html>