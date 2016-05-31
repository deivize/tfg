<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Nueva etiqueta</title>
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
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<%-- <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> --%>
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
						<li><a href="<s:url value="/activos/nuevoactivo"/>">Volver</a></li>
						<li><a href="<s:url value="/etiquetas/nuevoparametro"/>">Crear
								Parametro</a></li>
						<li><a href="<s:url value="/etiquetas/nuevoestandar"/>">Crear
								Estandar</a></li>
						<li><a href="<s:url value="/etiquetas/nuevatecnologia"/>">Crear
								Tecnologia</a></li>
					</ul>
				</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</header>

	<!-- Main -->
	<div id="Main">
		<section>
			<header class="major">
				<h2>
				</h2>
			</header>
			<p></p>
			<h4>Crear nueva etiqueta</h4>
			<sf:form id="crear_etiqueta_form" method="POST"
				modelAttribute="etiqueta" class="form-etiqueta"
				onsubmit="return validateForm()">
				<div class="row uniform 50%">
					<div class="12u$">
						<sf:input type="text" path="contenido" name="contenido_etiqueta"
							id="contenido_etiqueta" value="" placeholder="Contenido" />
					</div>
					<div class="12u$">
						<sf:input type="text" path="fabricante" name="fabricante_etiqueta"
							id="fabricante_etiqueta" value="" placeholder="Fabricante" />
					</div>
					<div class="12u$">
						<sf:select path="infoCifrada" id="info_cifrada_etiqueta">
							<option value="TRUE">Si</option>
							<option value="FALSE">No</option>
						</sf:select>
					</div>
					<div class="12u$">
						<div class="select-wrapper">
							<sf:select path="parametro" id="parametro_etiqueta">
								<c:choose>
									<c:when test="${not empty parametros}">
										<option value="">Parametro</option>
										<c:forEach var="parametro" items="${parametros}">
											<option value="${parametro.idParametro}">${parametro.nombre}</option>
										</c:forEach>
										<sf:errors path="parametro" />
									</c:when>
									<c:when test="${empty parametros}">
										<option value="no_parametros">No hay parametros</option>
									</c:when>
								</c:choose>
							</sf:select>
						</div>
					</div>
					<div class="12u$">
						<div class="select-wrapper">
							<sf:select path="estandar" id="estandar_etiqueta">
								<c:choose>
									<c:when test="${not empty estandares}">
										<option value="">Estandar</option>
										<c:forEach var="estandar" items="${estandares}">
											<option value="${estandar.idEstandar}">${estandar.nombre}</option>
										</c:forEach>
										<sf:errors path="estandar" />
									</c:when>
									<c:when test="${empty estandares}">
										<option value="no_estandares">No hay estandares</option>
									</c:when>
								</c:choose>
							</sf:select>
						</div>
					</div>
					<div class="12u$">
						<div class="select-wrapper">
							<sf:select path="tecnologia" id="tecnologia_etiqueta">
								<c:choose>
									<c:when test="${not empty tecnologias}">
										<option value="">Tecnologia</option>
										<c:forEach var="tecnologia" items="${tecnologias}">
											<option value="${tecnologia.idTecnologia}">${tecnologia.tipo}</option>
										</c:forEach>
										<sf:errors path="tecnologia" />
									</c:when>
									<c:when test="${empty tecnologias}">
										<option value="no_tecnologias">No hay tecnologias</option>
									</c:when>
								</c:choose>
							</sf:select>
						</div>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input id="etiqueta_button" type="submit"
								value="Crear etiqueta" class="special" /></li>
						</ul>
					</div>
				</div>
			</sf:form>
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
	<script type="text/javascript"
		src="http://mbostock.github.com/d3/d3.js"></script>
	<script src="${jqueryPop}"></script>
	<script src="${skel}"></script>
	<script src="${util}"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${main}"></script>
	<script>
		

	function validateForm() {
		var contenido= document.getElementById("contenido_etiqueta").value;
		var fabricante= document.getElementById("fabricante_etiqueta").value;
	    var parametro =document.getElementById("parametro_etiqueta").value;
	    var estandar =document.getElementById("estandar_etiqueta").value;
	    var tecnologia =document.getElementById("tecnologia_etiqueta").value;
	    if (contenido == null || contenido == "") {
	        alert("Debe especificar un contenido para la etiqueta");
	        return false;
	    }
	    if (fabricante == null || fabricante == "") {
	        alert("Debe especificar un fabricante para la etiqueta");
	        return false;
	    }
	    if (parametro == null || parametro == "") {
	        alert("Debe seleccionar un parametro para la etiqueta");
	        return false;
	    }
	    if (estandar == null || estandar == "") {
	        alert("Debe seleccionar un estandar para la etiqueta");
	        return false;
	    }
	    
	    if (tecnologia == null || tecnologia == "") {
	        alert("Debe seleccionar una tecnologia para la etiqueta");
	        return false;
	    }

		
	}
	</script>

</body>
</html>