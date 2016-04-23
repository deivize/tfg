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
	<script src="${jqueryPop}"></script>
	<script src="${skel}"></script>
	<script src="${util}"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${main}"></script>
	<script>
				var areas = [], areaObject;
				var svg =d3.select("#svg1");
				var activeRect;
				
				
				<c:forEach var="area" items="${areas}">
					areaObject = {tipo: "${area.tipo}", coord_x: "${area.localizacion.coord_x}",coord_y: "${area.localizacion.coord_y}",
							height:"${area.height}",width:"${area.width}"}
					areas.push(areaObject);
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
				  activeRect = svg.insert("rect",":first-child")
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
				
				
				
			</script>

</body>
</html>