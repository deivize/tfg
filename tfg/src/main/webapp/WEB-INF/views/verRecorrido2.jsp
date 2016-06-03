<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Ver recorrido</title>
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


<style type="text/css">
.line {
	stroke: blue;
	stroke-width: 3px;
	fill: white;
}
</style>

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
							<c:param name="id" value="${idActivo}"/>
						</c:url>
						<a href="<c:out value="${descargar}"/>">Descargar informe</a>
					</li>
					<li><a href="<s:url value="/activos/listactivos"/>">Volver</a></li>
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
		<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
			viewBox="0 0 800 1100">
							<jsp:include page="maps/${mapaActivo}.jsp"></jsp:include>
						</svg>
	</section>
	<section>
		<h4>Datos del activo</h4>
		<div class="table-wrapper">
			<table class="alt">

				<thead>
					<tr>
						<th>Nombre</th>
						<th>Categoria</th>
						<th>Informacion etiqueta</th>
						<th>Tecnologia etiqueta</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>${activo.nombre}</td>
						<td>${activo.categoria}</td>
						<td>${activo.etiqueta.contenido}</td>
						<td>${activo.etiqueta.tecnologia.tipo}</td>

					</tr>
				</tbody>
			</table>
		</div>
		<h4>Localizaciones</h4>
		<div class="table-wrapper">
			<table class="alt">

				<thead>
					<tr>
						<th>Edificio</th>
						<th>Planta</th>
						<th>Area</th>
						<th>Zona</th>
						<th>Fecha</th>
<!-- 						<th>Ver</th> -->
					</tr>
				</thead>

				<tbody>
					<c:set var="j" value="1"></c:set>
					<c:forEach var="localizacion" items="${localizaciones}"
						varStatus="status">

						<tr id="localizaciones${j}">
							<td>${localizacion.edificio}</td>
							<td>${localizacion.planta}</td>
							<td>${localizacion.area}</td>
							<td>${localizacion.zona}</td>
							<td>${localizacion.fecha}</td>
<%-- 							<td><a onClick="markPath(${j});" --%>
<!-- 								style="cursor: pointer; cursor: hand;">Ver tramo</a></td> -->
						</tr>
						<c:set var="j" value="${j+1}" />
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
<s:url value="/resources/js/areas.js" var="area" />
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
<script src="${area}"></script>
<script src="${jqueryPop}"></script>
<script src="${skel}"></script>
<script src="${util}"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="${main}"></script>
<script>
				var localizaciones = [], locObject;
				var paths = [], pathObject;
				var areas=[],areaObject;
				var lectores = [], lectorObject;
				var dataLocs = [], dataLocObject;
				var escaleras=[],escaleraObject;
				var ascensores=[],ascensorObject;
				var banos=[],banoObject;
				var despachos=[],despachoObject
				
				
				<c:forEach var="loc" items="${localizaciones}">
					locObject = { coord_x: "${loc.coord_x}",coord_y: "${loc.coord_y}" };
					localizaciones.push(locObject);
				</c:forEach>;
				
				<c:forEach var="path" items="${paths}">
					pathObject = { coord_x1: "${path[0]}",coord_y1: "${path[1]}", coord_x2: "${path[2]}", coord_y2: "${path[3]}" };
					paths.push(pathObject);
				</c:forEach>;
				
				<c:forEach var="area" items="${areas}">
				areaObject = {
					tipo : "${area.tipo}",
					coord_x : "${area.localizacion.coord_x}",
					coord_y : "${area.localizacion.coord_y}",
					height : "${area.height}",
					width : "${area.width}"
				}
				areas.push(areaObject);
				</c:forEach>;

				<c:forEach var="lector" items="${lectores}">
				lectorObject = {
					tipo : "${lector.tipo}",
					modelo : "${lector.modelo}",
					coord_x : "${lector.coord_x}",
					coord_y : "${lector.coord_y}"
				}
				lectores.push(lectorObject);
				</c:forEach>;
				
				<c:forEach var="dataLoc" items="${localizaciones}">
				dataLocObject = {
					edificio : "${dataLoc.edificio}",
					planta : "${dataLoc.planta}",
					area : "${dataLoc.area}",
					zona : "${dataLoc.zona}",
					fecha : "${dataLoc.fecha}"
				}
				dataLocs.push(dataLocObject);
				</c:forEach>;
				
				<c:forEach var="escalera" items="${escaleras}">
				escaleraObject = {
					coord_x : "${escalera.width}",
					coord_y : "${escalera.height}"
				}
				escaleras.push(escaleraObject);
				</c:forEach>;
				
				<c:forEach var="ascensor" items="${ascensores}">
				ascensorObject = {
					coord_x : "${ascensor.width}",
					coord_y : "${ascensor.height}"
				}
				ascensores.push(ascensorObject);
				</c:forEach>;
				
				<c:forEach var="bano" items="${banos}">
				banoObject = {
					coord_x : "${bano.width}",
					coord_y : "${bano.height}"
				}
				banos.push(banoObject);
				</c:forEach>;
				
				<c:forEach var="despacho" items="${despachos}">
				despachoObject = {
					coord_x : "${despacho.width}",
					coord_y : "${despacho.height}"
				}
				despachos.push(despachoObject);
				</c:forEach>;
				
				var svg =d3.select("#svg1");
				
				
				var line = d3.svg.line()
                .x( function(point) { return point.lx; })
                .y( function(point) { return point.ly; });

				function lineData(d){
				   var points = [
				       {lx: d.source.x, ly: d.source.y},
				       {lx: d.target.x, ly: d.target.y}
				   ];
				   return line(points);
				}
				
				function translateAlong(path) {
					  var l = path.getTotalLength();
					    var ps = path.getPointAtLength(0);
					    var pe = path.getPointAtLength(l);
					    var angl = Math.atan2(pe.y - ps.y, pe.x - ps.x) * (180 / Math.PI) - 90;
					    var rot_tran = "rotate(" + angl + ")";
					  return function(d, i, a) {
					    console.log(d);
					    
					    return function(t) {
					      var p = path.getPointAtLength(t * l);
					      return "translate(" + p.x + "," + p.y + ") " + rot_tran;
					    };
					  };
					}

				
				
				
				

				
				$(document).ready(function(){
					for(i=0; i<paths.length; i++){
						var div = d3.select("body").append("div")	
								    .attr("class", "tooltipPath")				
								    .style("opacity", 0);
						
						var path = svg.append("path")
						.attr("id","path"+i)
						.data([{source: {x : paths[i].coord_x1, y : paths[i].coord_y1}, 
							target: {x : paths[i].coord_x2, y : paths[i].coord_y2}}])
						.attr("class","line")
						.attr("d",lineData)
						.attr("numero",i)
						.on('mouseover',function(d) {		
					            div.transition()		
				            	.duration(200)		
				            	.style("opacity", .9);
					            div.html("<strong>Area: </strong><span>"+dataLocs[$(this).attr("numero")].area+ "</span><br/>" +
	 									"<strong>Edificio: </strong><span>"+dataLocs[$(this).attr("numero")].edificio+ "</span><br/>"+
										"<strong>Planta: </strong><span>"+dataLocs[$(this).attr("numero")].planta+ "</span><br/>"+
										"<strong>Zona: </strong><span>"+dataLocs[$(this).attr("numero")].zona+ "</span><br/>"+
	 									"<strong>Fecha: </strong><span>"+dataLocs[$(this).attr("numero")].fecha+ "</span>")	
				            		.style("left", (d3.event.pageX) + "px")		
				            		.style("top", (d3.event.pageY - 28) + "px");})
							.on('mouseout',function(d) {		
					            div.transition()		
				            		.duration(500)		
				            		.style("opacity", 0);});
						
						var arrow = svg.append("svg:path")
						.attr("d", d3.svg.symbol().type("triangle-down")(10,1));
						
						arrow.transition()
					      .duration(2000)
					      .ease("linear")
					      .attrTween("transform", translateAlong(path.node()));
					      
					    var totalLength = path.node().getTotalLength();
					    path
					      .attr("stroke-dasharray", totalLength + " " + totalLength)
					      .attr("stroke-dashoffset", totalLength)
					      .transition()
					        .duration(2000)        
					        .ease("linear")
					        .attr("stroke-dashoffset", 0);  
					};
				});
				
			</script>
</body>
</html>