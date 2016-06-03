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
			<p>Clique y arrastre para marcar una zona del mapa</p>
			
			<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
				viewBox="0 0 800 1100">
							<jsp:include page="maps/${mapaActivo}.jsp"></jsp:include>
						</svg>
		</section>
		
		<div class="oculto">
		<sf:form id="loc_interes_form" method="POST" modelAttribute="locInteresForm">
			<sf:input id="width" path="width" value=""></sf:input>
			<sf:input id="height" path="height" value=""></sf:input>
			<sf:input id="coord_x" path="coord_x" value=""></sf:input>
			<sf:input id="coor_y" path="coord_y" value=""></sf:input>
			<sf:select id="tipo" path="tipo">
				<option value="area" selected>Area</option>
			</sf:select>
		</sf:form>
		</div>
		<div style="margin-top:10px">
			<a href="#" class="button special" onClick="fillForm()">Guardar</a>
		</div>
		<div style="margin-top:10px">
			<a href="#" class="button special lugar" >Nueva</a>
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
				var despachos=[],despachoObject
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
				
				
				

				var renderPath = d3.svg.line()
				    .x(function(d) { return d[0]; })
				    .y(function(d) { return d[1]; })
				    .interpolate("basis");

				
				    svg.call(d3.behavior.drag()
				      .on("dragstart", dragstarted)
				      .on("drag", dragged)
				      .on("dragend", dragended));

				function dragstarted() {
				  var p = d3.mouse( this);
				  //activeRect = svg.insert("rect",":first-child")
				  activeRect = svg.append("rect")
				    .attr({
				        rx      : 6,
				        ry      : 6,
				        class   : "selection new",
				        x       : p[0],
				        y       : p[1],
				        width   : 0,
				        height  : 0
				    })
				}

				function dragged() {

				    if( !activeRect.empty()) {
				        var p = d3.mouse( this),

				            d = {
				                x       : parseInt( activeRect.attr( "x"), 10),
				                y       : parseInt( activeRect.attr( "y"), 10),
				                width   : parseInt( activeRect.attr( "width"), 10),
				                height  : parseInt( activeRect.attr( "height"), 10)
				            },
				            move = {
				                x : p[0] - d.x,
				                y : p[1] - d.y
				            }
				        ;

				        if( move.x < 1 || (move.x*2<d.width)) {
				            d.x = p[0];
				            d.width -= move.x;
				        } else {
				            d.width = move.x;       
				        }

				        if( move.y < 1 || (move.y*2<d.height)) {
				            d.y = p[1];
				            d.height -= move.y;
				        } else {
				            d.height = move.y;       
				        }
				       
				        activeRect.attr(d);
				  
				}
				}
				function dragended() {
				  activeRect = null;
				}
				
				function fillForm(){
					var rects=d3.selectAll(".new");
					var form= $("#loc_interes_form");
					var width = $("#width");
					var height = $("#height");
					var coord_x = $("#coord_x");
					var coord_y = $("#coor_y");
					var tipo = $("#tipo");
					
					tipo.val("area");
					width.val('');
					height.val('');
					coord_x.val('');
					coord_y.val('');
					
					for(i=0;i<rects[0].length;i++){
						width.val(width.val()+"-"+rects[0][i].width.animVal.value);
						height.val(height.val()+"-"+rects[0][i].height.animVal.value);
						coord_x.val(coord_x.val()+"-"+rects[0][i].x.animVal.value);
						coord_y.val(coord_y.val()+"-"+rects[0][i].y.animVal.value);
					}
					
					form.submit();
				}
				
				
				$(".lugar").on("click",function(){
					
					var path1 = svg.append("path").attr("d","m 66.973475,36.215342 -7.083631,0 c -0.508397,0 -0.486248,0.662958 -0.486248,0.662958 l 0.01002,6.674836 c 0,0 0.02147,0.662485 -0.486593,0.662485 l -4.89881,0.01572 c -0.508742,0 -0.486593,0.662957 -0.486593,0.662957 l 0.01027,6.645602 c 0,0 0.02147,0.662955 -0.486592,0.662955 l -4.942414,0.01505 c -0.508397,0 -0.486595,0.662486 -0.486595,0.662486 l 0.01077,6.645602 c 0,0 0.02147,0.662959 -0.486593,0.662959 l -4.899156,0.0146 c -0.508396,0 -0.486247,0.662957 -0.486247,0.662957 l 0.01027,6.645602 c 0,0 0.0173,0.629953 -0.456829,0.658244 l -4.777333,0 c -0.0093,0 -0.01632,0.0043 -0.02492,0.0051 -0.03113,0.0014 -0.05537,0.0094 -0.08238,0.0146 l -0.04429,0 0.01316,0.0057 c -0.342277,0.08815 -0.331892,0.47859 -0.331892,0.47859 l 0,1.789419 c 0,0.694549 0.471365,0.664373 0.471365,0.664373 l 6.862136,0 c 0.0093,0 0.01632,-0.0043 0.02492,-0.0052 0.0063,-4.71e-4 0.01027,-0.0023 0.01632,-0.0029 l 0.0059,0.0023 c 0.508397,0 0.486594,-0.662956 0.486594,-0.662956 l 0.0063,-6.659275 c 0,0 -0.02147,-0.662488 0.486594,-0.662488 l 4.88185,-0.0014 c 0.508739,0 0.486591,-0.662487 0.486591,-0.662487 l 0.0066,-6.659748 c 0,0 -0.02147,-0.662014 0.486245,-0.662014 l 4.925803,-9.25e-4 c 0.508398,0 0.486593,-0.662958 0.486593,-0.662958 l -0.01573,-6.659477 c 0,0 -0.02147,-0.662485 0.486248,-0.662485 l 4.904,-9.27e-4 c 0.508743,0 0.486594,-0.662957 0.486594,-0.662957 l -0.01553,-6.689423 c 0,0 -0.02144,-0.662484 0.486595,-0.662484 l 4.925456,0.0126 c 0.508744,0 0.486941,-0.500756 0.486941,-0.500756 l 0,-1.782343 c 6.62e-4,-0.693605 -0.485902,-0.664373 -0.485902,-0.664373 z")
								.attr("transform","translate(359.7316589355469,416.134521484375)")
								.attr("class","stair")
								.attr("tipo","stair")
								.attr("coord_x","359.7316589355469")
								.attr("coord_y","416.134521484375");
					
					
				});
				
			</script>

</body>
</html>