<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Areas de interés</title>
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
<%-- 		<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> --%>
<script src="${bootstrapJs}" type="text/javascript"></script>
<%-- <script src="https://use.fontawesome.com/350ec7c656.js"></script> --%>
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
			<p>Seleccione un tipo lugar y muévalo a la posición deseada.</p>
			
			<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
				viewBox="0 0 800 1100">
							<jsp:include page="maps/${mapaActivo}.jsp"></jsp:include>
						</svg>
		</section>
		
		<div class="oculto">
		<sf:form id="lugar_interes_form" method="POST" modelAttribute="lugaresForm">
			<sf:input id="escalera_x" path="escalera_coord_x" value=""></sf:input>
			<sf:input id="escalera_y" path="escalera_coord_y" value=""></sf:input>
			<sf:input id="ascensor_x" path="ascensor_coord_x" value=""></sf:input>
			<sf:input id="ascensor_y" path="ascensor_coord_y" value=""></sf:input>
			<sf:input id="bano_x" path="bano_coord_x" value=""></sf:input>
			<sf:input id="bano_y" path="bano_coord_y" value=""></sf:input>
			<sf:input id="despacho_x" path="despacho_coord_x" value=""></sf:input>
			<sf:input id="despacho_y" path="despacho_coord_y" value=""></sf:input>
		</sf:form>
		</div>
		<div style="margin-top:10px">
			<a href="#" onClick="return false" class="button special escaleraButton" >Nueva escalera</a>
			<a href="#" onClick="return false" class="button special ascensorButton" >Nuevo ascensor</a>
			<a href="#" onClick="return false" class="button special despachoButton" >Nuevo despacho</a>
			<a href="#" onClick="return false" class="button special banoButton" >Nuevo baño</a>
		</div>
		<div style="margin-top:10px">
			<a href="#" class="button special" onClick="fillForm()">Guardar</a>
		</div>
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
	<script src="${area}"></script>
	<script type="text/javascript"
		src="http://mbostock.github.com/d3/d3.js"></script>
	<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>	
	<script src="${jqueryPop}"></script>
	<script src="${skel}"></script>
	<script src="${util}"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${main}"></script>
	<script>
				var areas = [], areaObject;
				var lectores =[],lectorObject;
				var escaleras=[],escaleraObject;
				var ascensores=[],ascensorObject;
				var banos=[],banoObject;
				var despachos=[],despachoObject;
				var svg =d3.select("#svg1");
				var activeRect;
				
				
				<c:forEach var="area" items="${areas}">
					areaObject = {tipo: "${area.tipo}", coord_x: "${area.localizacion.coord_x}",coord_y: "${area.localizacion.coord_y}",
							height:"${area.height}",width:"${area.width}"}
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
				
				
				function fillForm(){
					var lugares=$(".lugar");
					var form= $("#lugar_interes_form");
					var escalera_x = $("#escalera_x");
					var escalera_y = $("#escalera_y");
					var ascensor_x = $("#ascensor_x");
					var ascensor_y = $("#ascensor_y");
					var bano_x = $("#bano_x");
					var bano_y = $("#bano_y");
					var despacho_x = $("#despacho_x");
					var despacho_y = $("#despacho_y");
					
					escalera_x.val('');
					escalera_y.val('');
					ascensor_x.val('');
					ascensor_y.val('');
					bano_x.val('');
					bano_y.val('');
					despacho_x.val('');
					despacho_y.val('');
					
					for(i=0;i<lugares.length;i++){
						if($(lugares[i]).attr("tipo")=="escalera"){
							escalera_x.val(escalera_x.val()+"-"+$(lugares[i]).attr("x"));
							escalera_y.val(escalera_y.val()+"-"+$(lugares[i]).attr("y"));
						}
						if($(lugares[i]).attr("tipo")=="ascensor"){
							ascensor_x.val(ascensor_x.val()+"-"+$(lugares[i]).attr("x"));
							ascensor_y.val(ascensor_y.val()+"-"+$(lugares[i]).attr("y"));
						}
						if($(lugares[i]).attr("tipo")=="bano"){
							bano_x.val(bano_x.val()+"-"+$(lugares[i]).attr("x"));
							bano_y.val(bano_y.val()+"-"+$(lugares[i]).attr("y"));
						}
						if($(lugares[i]).attr("tipo")=="despacho"){
							despacho_x.val(despacho_x.val()+"-"+$(lugares[i]).attr("x"));
							despacho_y.val(despacho_y.val()+"-"+$(lugares[i]).attr("y"));
						}
					}
					
					form.submit();
				}
				
				
				
				$(".escaleraButton").on("click",function(){
					
					var w = svg.node().getBBox().width;
					var h = svg.node().getBBox().height;
					var width = 28.9, height = 32.17;
					
					var drag = d3.behavior.drag().origin(Object).on(
							"drag", dragmove);
					
					
					var escalera= svg.append("text")
									.attr("x","359.7316589355469")
									.attr("y","416.134521484375")
									.attr("font-family","FontAwesome")
									.attr("font-size","20px")
									.attr("tipo","escalera")
									.attr("class","lugar")
									.text(function(d){return "\uf0dc"})
									.attr("cursor","move")
									.call(drag);
					
					function dragmove() {
 						var x= Math.max(0, Math.min(w- width, d3.mouse(this)[0]));
 						var y= Math.max(0, Math.min(h- height, d3.mouse(this)[1]));
						
						escalera.attr("x", x);
						escalera.attr("y", y);

					}
					
					
				});
				
				$(".ascensorButton").on("click",function(){
					
					var w = svg.node().getBBox().width;
					var h = svg.node().getBBox().height;
					var width = 30.68, height = 29.09;
					
					var drag = d3.behavior.drag().origin(Object).on(
							"drag", dragmove);
					
					var ascensor= svg.append("text")
									.attr("x","359.7316589355469")
									.attr("y","416.134521484375")
									.attr("font-family","FontAwesome")
									.attr("font-size","20px")
									.attr("tipo","ascensor")
									.attr("class","lugar")
									.text(function(d){return "\uf151"})
									.attr("cursor","move")
									.call(drag);
					
					function dragmove() {
 						var x= Math.max(0, Math.min(w- width, d3.mouse(this)[0]));
 						var y= Math.max(0, Math.min(h- height, d3.mouse(this)[1]));
										
						ascensor.attr("x", x);
						ascensor.attr("y", y);

					}
					
					
				});
				
				$(".despachoButton").on("click",function(){
					
					var w = svg.node().getBBox().width;
					var h = svg.node().getBBox().height;
					var width = 30.68, height = 29.09;
					
					var drag = d3.behavior.drag().origin(Object).on(
							"drag", dragmove);
					
					var despacho= svg.append("text")
									.attr("x","359.7316589355469")
									.attr("y","416.134521484375")
									.attr("font-family","FontAwesome")
									.attr("font-size","20px")
									.attr("tipo","despacho")
									.attr("class","lugar")
									.text(function(d){return "\uf108"})
									.attr("cursor","move")
									.call(drag);
					
					function dragmove() {
 						var x= Math.max(0, Math.min(w- width, d3.mouse(this)[0]));
 						var y= Math.max(0, Math.min(h- height, d3.mouse(this)[1]));
										
						despacho.attr("x", x);
						despacho.attr("y", y);

					}
					
					
				});
				
				$(".banoButton").on("click",function(){
					
					var w = svg.node().getBBox().width;
					var h = svg.node().getBBox().height;
					var width = 30.68, height = 29.09;
					
					var drag = d3.behavior.drag().origin(Object).on(
							"drag", dragmove);
					
					var bano= svg.append("text")
									.attr("x","359.7316589355469")
									.attr("y","416.134521484375")
									.attr("font-family","FontAwesome")
									.attr("font-size","20px")
									.attr("tipo","bano")
									.attr("class","lugar")
									.text(function(d){return "\uf182"})
									.attr("cursor","move")
									.call(drag);
					
					function dragmove() {
 						var x= Math.max(0, Math.min(w- width, d3.mouse(this)[0]));
 						var y= Math.max(0, Math.min(h- height, d3.mouse(this)[1]));
										
						bano.attr("x", x);
						bano.attr("y", y);

					}
					
					
				});
				
			</script>

</body>
</html>