<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Nueva tecnologia</title>
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
						<li><a href="<s:url value="/etiquetas/nuevaetiqueta"/>">Volver</a></li>
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
			<h4>Crear nuevo parametro</h4>
			<sf:form id="crear_tecnologia_form" method="POST"
				modelAttribute="tecnologia" class="form-tecnologia"
				onsubmit="return validateForm()">
				<div class="row uniform 50%">
					<div class="12u$">
						<sf:input type="text" path="tipo" name="tipo_tecnologia"
							id="tipo_tecnologia" value="" placeholder="Tipo tecnologia" />
					</div>
					<div class="12u$">
						<sf:input type="text" path="subtipo" name="subtipo_tecnologia"
							id="subtipo_tecnologia" value="" placeholder="Subtipo tecnologia" />
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input id="parametro_button" type="submit"
								value="Crear tecnologia" class="special" /></li>
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
		var tipo= document.getElementById("tipo_tecnologia").value;
		
	    
	    if (tipo == null || tipo == "") {
	        alert("Debe especificar un tipo para la tecnologia");
	        return false;
	    }
	    
	    
	    
	}
	</script>

</body>
</html>