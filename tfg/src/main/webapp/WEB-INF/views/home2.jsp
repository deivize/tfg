<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>HOME</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<s:url value="/resources/css/home_main.css" var="homeCss" />
<s:url value="/resources/css/bootstrap.min.css" var="bootstrapMin" />
<s:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />
<s:url value="/resources/images/RFID-Tag.jpg" var="rfidTag" />

<s:url value="/resources/css/map.jsp" var="mapaJsp" />
<s:url value="/resources/js/jquery.min.js" var="jquery" />
<s:url value="/resources/js/tipsy.js" var="tipsy" />
<script src="${jquery}"></script>
<script src="${tipsy}"></script>
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
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Activos<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<s:url value="/activos/listactivos"/>">Lista
										de activos</a></li>
								<li><a href="<s:url value="/activos/vertrazados"/>">Buscar 
											trazados</a></li>		
								<li><a href="<s:url value="/activos/nuevoactivo"/>">Crear
										nuevo activo</a></li>
								<li><a href="<s:url value="/activos/buscaractivos"/>">Buscar
										activos</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Lectores<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<s:url value="/lectores/buscarlectores"/>">Buscar
										lectores</a></li>
								<li><a href="<s:url value="/lectores/nuevolector"/>">Nuevo lector</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Localizaciones<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<s:url value="/localizaciones/buscarlocalizaciones"/>">Buscar localizaciones</a></li>
								<li><a href="<s:url value="/localizaciones/areas"/>">Definir áreas de interés</a></li>
								<li><a href="<s:url value="/localizaciones/lugares"/>">Definir lugares de interés</a></li>
							</ul></li>
<!-- 						<div class="form-group" id="mapa"> -->
<%-- 							<sf:form method="POST" commandName="file" --%>
<%-- 								enctype="multipart/form-data">  --%>
<!-- 									        Seleccione un archivo: -->
<!-- 									        <input type="file" class="form-control" name="file" /> -->
<!-- 								<input type="submit" class="button special small" value="Cargar" /> -->
<%-- 								<sf:errors path="file" cssStyle="color: #ff0000;" /> --%>
<%-- 							</sf:form> --%>
<!-- 						</div> -->
					</ul>
				</div>
			</div>
			<!--/.nav-collapse -->
		</div>
	</header>

	<!-- Main -->
	<div id="main">

		<section>
			<header class="major">
				<h2>
				</h2>
			</header>
			<h2>Mapas</h2>
			<div class="row">
				<c:forEach var="mapa" items="${mapas}">
					<s:url value="/resources/svgs/${mapa}" var="map"/>
					<article class="6u 12u$(xsmall) work-item">
						<a href="#" class="image fit"><img
							src="${map}" alt="" /></a>
						<h3></h3>
						<p></p>
						<sf:form id="${mapa}Form" modelAttribute="mapaForm" method="POST" style="display:none;">
							<sf:input class="nombreMapa" path="nombre"/>
						</sf:form>
						<a id="" mapa="${mapa}" href="#" class="button special small botonMapa">Seleccionar</a>
					</article>
				</c:forEach>
			</div>
		</section>

		<!-- One -->
		<section id="one">
			<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
				viewBox="0 0 800 1100">  
 							<jsp:include page="maps/${mapaActivo}.jsp"></jsp:include>  
  						</svg>  
 		</section> 
		<section>
			
			<h4>Notificaciones</h4>
			<div class="table-wrapper">
				<table id="tablaNotificacion" class="alt">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Categoria</th>
							<th style="display:none;">coord_x</th>
							<th style="display:none;">coord_y</th>
							<th>Fecha caducidad</th>
							<th>Ver</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="alerta" items="${alertas}" varStatus="status">
							<tr class="fila">
								<td class="nombre">${alerta.nombre}</td>
								<td>${alerta.categoria}</td>
								<td class="coord_x" style="display:none;">${alerta.coord_x}</td>
								<td class="coord_y" style="display:none;">${alerta.coord_y}</td>
								<td>${alerta.fechaCaducidad}</td>
								<td><a class="verLoc" href="#" onClick="return false">Ver en mapa</a></td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
			
			
		</section>
		<!--
						<section>
							<h4>Image</h4>
							<h5>Fit</h5>
							<div class="box alt">
								<div class="row 50% uniform">
									<div class="12u$"><span class="image fit"><img src="images/fulls/05.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/thumbs/01.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/thumbs/02.jpg" alt="" /></span></div>
									<div class="4u$"><span class="image fit"><img src="images/thumbs/03.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/thumbs/04.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/thumbs/05.jpg" alt="" /></span></div>
									<div class="4u$"><span class="image fit"><img src="images/thumbs/06.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/thumbs/03.jpg" alt="" /></span></div>
									<div class="4u"><span class="image fit"><img src="images/thumbs/02.jpg" alt="" /></span></div>
									<div class="4u$"><span class="image fit"><img src="images/thumbs/01.jpg" alt="" /></span></div>
								</div>
							</div>
							<h5>Left &amp; Right</h5>
							<p><span class="image left"><img src="images/avatar.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
							<p><span class="image right"><img src="images/avatar.jpg" alt="" /></span>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent tincidunt felis sagittis eget. tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu faucibus. Integer ac pellentesque praesent.</p>
						</section>

					</section>
				-->

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
				var lectores=[], lectorObject;
				var svg =d3.select("#svg1");
				var activeRect;
			
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

		var renderPath = d3.svg.line().x(function(d) {
			return d[0];
		}).y(function(d) {
			return d[1];
		}).interpolate("basis");

		svg.call(d3.behavior.drag().on("dragstart", dragstarted).on("drag",
				dragged).on("dragend", dragended));

		function dragstarted() {
			var p = d3.mouse(this);
			activeRect = svg.append("rect").attr({
				rx : 6,
				ry : 6,
				class : "selection draggable",
				x : p[0],
				y : p[1],
				width : 0,
				height : 0
			})
		}

		function dragged() {

			if (!activeRect.empty()) {
				var p = d3.mouse(this),

				d = {
					x : parseInt(activeRect.attr("x"), 10),
					y : parseInt(activeRect.attr("y"), 10),
					width : parseInt(activeRect.attr("width"), 10),
					height : parseInt(activeRect.attr("height"), 10)
				}, move = {
					x : p[0] - d.x,
					y : p[1] - d.y
				};

				if (move.x < 1 || (move.x * 2 < d.width)) {
					d.x = p[0];
					d.width -= move.x;
				} else {
					d.width = move.x;
				}

				if (move.y < 1 || (move.y * 2 < d.height)) {
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

		
		$(document).ready(
				function() {

					$("#tablaNotificacion").find(".fila").each(
											function() {
												var coord_x = $(this).find(
														".coord_x").html();
												var coord_y = $(this).find(
														".coord_y").html();
												var nombre = $(this).find(
														".nombre").html();
												$(this)
														.find(".verLoc")
														.click(
																function() {

																	var tip = d3
																			.tip()
																			.attr(
																					'class',
																					'd3-tip')
																			.offset(
																					[
																							-10,
																							0 ])
																			.html(
																					function() {
																						return "<strong>Nombre: </strong><span>"
																								+ nombre
																								+ "</span>";
																					})
																	svg
																			.call(tip);

																	svg
																			.append(
																					"polygon")
																			.attr(
																					"class",
																					"marker")
																			.attr(
																					"points",
																					"0,0 -15,-25 15,-25")
																			.attr(
																					"transform",
																					"translate("
																							+ coord_x
																							+ ","
																							+ coord_y
																							+ ")")
																			.attr(
																					"style",
																					"fill:lime;stroke:black;stroke-width:1")
																			.on(
																					'mouseover',
																					tip.show)
																			.on(
																					'mouseout',
																					tip.hide);

																});
											})
											

						});
		
		
		
		//función que envía el mapa seleccionado al controlador
		$(".botonMapa").each(function(){
			var nombre=$(this).attr("mapa");
			var form=document.getElementById(nombre+"Form");
			nombre=nombre.replace(".svg","");
			$(form).find("input").first().val(nombre);
			
			$(this).click(function(){
				$(form).submit();
			})
		});
		
		
		
	</script>

</body>
</html>