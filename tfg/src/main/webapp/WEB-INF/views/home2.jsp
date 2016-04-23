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
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Activos<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<s:url value="/activos/listactivos"/>">Lista
										de activos</a></li>
								<li><a href="<s:url value="/activos/nuevoactivo"/>">Crear
										nuevo activo</a></li>
								<li><a href="<s:url value="/activos/buscaractivos"/>">Buscar
										activos</a></li>
								<li><a href="<s:url value="/activos/borraractivo"/>">Borrar
										activos</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Lectores<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<s:url value="/lectores/buscarlectores"/>">Buscar
										lectores</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Localizaciones<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<s:url value="#"/>">Buscar localizaciones</a></li>
								<li><a href="<s:url value="/localizaciones/areas"/>">Definir áreas de interés</a></li>
							</ul></li>
						<div class="form-group" id="mapa">
							<sf:form method="POST" commandName="file"
								enctype="multipart/form-data"> 
									        Seleccione un archivo:
									        <input type="file" class="form-control" name="file" />
								<input type="submit" class="button special small" value="Cargar" />
								<sf:errors path="file" cssStyle="color: #ff0000;" />
							</sf:form>
						</div>
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
			<sf:form>
				<div class="row uniform 50%">
					<div class="12u$">
						<input type="text" id="nombreLocalizacion" value
							placeholder="Nombre" />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="12u$">
						<input type="text" id="coordenadaX" value
							placeholder="Coordenada X" disabled />
					</div>
				</div>
				<div class="row uniform 50%">
					<div class="12u$">
						<input type="text" id="coordenadaY" value
							placeholder="Coordenada Y" disabled />
					</div>
				</div>
				<a id="botonCoord" href="#" class="button special small">Nueva</a>
			</sf:form>
			<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
				viewBox="0 0 800 1000">
							<jsp:include page="map.jsp"></jsp:include>
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
								<td>${alerta.nombre}</td>
								<td>${alerta.categoria}</td>
								<td class="coord_x" style="display:none;">${alerta.coord_x}</td>
								<td class="coord_y" style="display:none;">${alerta.coord_y}</td>
								<td>${alerta.fechaCaducidad}</td>
								<td><a class="verLoc" href="#">Ver en mapa</a></td>
							</tr>
						</c:forEach>					
					</tbody>
				</table>
			</div>
			
			
		</section>

		<section>
			<h4>Buttons</h4>
			<ul class="actions">
				<li><a href="#" class="button special">Special</a></li>
				<li><a href="#" class="button">Default</a></li>
			</ul>
			<ul class="actions">
				<li><a href="#" class="button big">Big</a></li>
				<li><a href="#" class="button">Default</a></li>
				<li><a href="#" class="button small">Small</a></li>
			</ul>
			<ul class="actions fit">
				<li><a href="#" class="button special fit">Fit</a></li>
				<li><a href="#" class="button fit">Fit</a></li>
			</ul>
			<ul class="actions fit small">
				<li><a href="#" class="button special fit small">Fit +
						Small</a></li>
				<li><a href="#" class="button fit small">Fit + Small</a></li>
			</ul>
			<ul class="actions">
				<li><a href="#" class="button special icon fa-download">Icon</a></li>
				<li><a href="#" class="button icon fa-download">Icon</a></li>
			</ul>
			<ul class="actions">
				<li><span class="button special disabled">Special</span></li>
				<li><span class="button disabled">Default</span></li>
			</ul>
		</section>

		<section>
			<h4>Form</h4>
			<form method="post" action="#">
				<div class="row uniform 50%">
					<div class="6u 12u$(xsmall)">
						<input type="text" name="demo-name" id="demo-name" value=""
							placeholder="Name" />
					</div>
					<div class="6u$ 12u$(xsmall)">
						<input type="email" name="demo-email" id="demo-email" value=""
							placeholder="Email" />
					</div>
					<div class="12u$">
						<div class="select-wrapper">
							<select name="demo-category" id="demo-category">
								<option value="">- Category -</option>
								<option value="1">Manufacturing</option>
								<option value="1">Shipping</option>
								<option value="1">Administration</option>
								<option value="1">Human Resources</option>
							</select>
						</div>
					</div>
					<div class="4u 12u$(small)">
						<input type="radio" id="demo-priority-low" name="demo-priority"
							checked> <label for="demo-priority-low">Low
							Priority</label>
					</div>
					<div class="4u 12u$(small)">
						<input type="radio" id="demo-priority-normal" name="demo-priority">
						<label for="demo-priority-normal">Normal Priority</label>
					</div>
					<div class="4u$ 12u(small)">
						<input type="radio" id="demo-priority-high" name="demo-priority">
						<label for="demo-priority-high">High Priority</label>
					</div>
					<div class="6u 12u$(small)">
						<input type="checkbox" id="demo-copy" name="demo-copy"> <label
							for="demo-copy">Email me a copy of this message</label>
					</div>
					<div class="6u$ 12u$(small)">
						<input type="checkbox" id="demo-human" name="demo-human" checked>
						<label for="demo-human">I am a human and not a robot</label>
					</div>
					<div class="12u$">
						<textarea name="demo-message" id="demo-message"
							placeholder="Enter your message" rows="6"></textarea>
					</div>
					<div class="12u$">
						<ul class="actions">
							<li><input type="submit" value="Send Message"
								class="special" /></li>
							<li><input type="reset" value="Reset" /></li>
						</ul>
					</div>
				</div>
			</form>
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
	<script src="${jqueryPop}"></script>
	<script src="${skel}"></script>
	<script src="${util}"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${main}"></script>
	<script>
				var areas = [], areaObject;
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
				        class   : "selection draggable",
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
				
				$(document).ready(function(){
				
					$("#tablaNotificacion").find(".fila").each(function(){
						var coord_x=$(this).find(".coord_x").html();
						var coord_y=$(this).find(".coord_y").html();
						$(this).find(".verLoc").click(function(){
							svg.append("polygon")
							.attr("points","0,0 -15,-25 15,-25")
							.attr("transform","translate("+coord_x+","+coord_y+")")
							.attr("style","fill:lime;stroke:black;stroke-width:1");
						});
					})
					
					
				});
				
				transform="translate(${locActualX},${locActualY})"
				
				
			</script>

</body>
</html>