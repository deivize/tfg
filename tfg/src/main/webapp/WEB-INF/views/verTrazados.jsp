<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Ver trazados</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<s:url value="/resources/css/home_main.css" var="homeCss" />
<s:url value="/resources/css/bootstrap.min.css" var="bootstrapMin" />
<s:url value="/resources/css/dateTimePicker.css" var="dateTimePickerCss" />
<s:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />
<s:url value="/resources/images/RFID-Tag.jpg" var="rfidTag" />
<s:url value="/resources/css/map.jsp" var="mapaJsp" />
<s:url value="/resources/js/jquery.min.js" var="jquery" />
<script src="${jquery}"></script>
<link rel="stylesheet" type="text/css" href="${bootstrapMin}" />
<link rel="stylesheet" type="text/css" href="${dateTimePickerCss}" />
<link rel="stylesheet" href="${homeCss}" />
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${bootstrapJs}" type="text/javascript"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"
	type="text/javascript"></script>


<style type="text/css">
.line {
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
		<sf:form id="trazado_form" method="POST" modelAttribute="trazadoForm">
			<div class="12u$">
				<sf:input path="fechaDesde" name="fecha_desde"
					id="datepicker1" value="" placeholder="Fecha desde"/>
			</div>
			<div class="12u$">
				<sf:input path="fechaHasta" name="fecha_hasta"
					id="datepicker2" value="" placeholder="Fecha hasta"/>
			</div>
		</sf:form>	
		<div style="margin-top:2px">
			<a href="#" class="button special" onClick="fillForm()">Buscar</a>
		</div>
		
		
		<svg xmlns="http://www.w3.org/2000/svg" id="svg1"
			viewBox="0 0 800 1100">
							<jsp:include page="maps/${mapaActivo}.jsp"></jsp:include>
						</svg>
	</section>
	
	<section>
		<table class="alt">
				<thead>
					<tr>
						<th>idActivo</th>
						<th>Nombre</th>
						<th>idEtiqueta</th>
						<th>Contenido</th>
						<th>Tecnología</th>
						<th>Estándar</th>
						<th>Parámetro</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="traz" items="${trazados}"
						varStatus="status">

						<tr>
							<td>${traz.idActivo}</td>
							<td>${traz.nombre}</td>
							<td>${traz.etiqueta.idEtiqueta}</td>
							<td>${traz.etiqueta.contenido}</td>
							<td>${traz.etiqueta.tecnologia.tipo}</td>
							<td>${traz.etiqueta.estandar.nombre}</td>
							<td>${traz.etiqueta.parametros.nombre}</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
	
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
<s:url value="/resources/js/dateTimePicker.js" var="dateTimePicker" />
<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
<s:url value="/resources/js/areas.js" var="area" />
<s:url value="/resources/js/randomColor.js" var="randomColor" />
<script src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"></script>
<script src="${area}"></script>
<script src="${jqueryPop}"></script>
<script src="${skel}"></script>
<script src="${util}"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="${main}"></script>
<script src="${dateTimePicker}"></script>
<script src="${randomColor}"></script>
<script>
				var localizaciones = [], locObject;
				var paths = [], pathObject;
				var areas=[],areaObject;
				var lectores = [], lectorObject;
				var dataLocs = [], dataLocObject;
				var escaleras=[],escaleraObject;
				var ascensores=[],ascensorObject;
				var banos=[],banoObject;
				var despachos=[],despachoObject;
				var textosLugares=[],textoObject;
				var trazados=[], trazadoObject;
				var coordenadas=[], coordObject;
				
				
				<c:forEach var="traz" items="${trazados}">
					coordenadas=[];
					coordObject={};
					<c:forEach var="coord" items="${traz.coordenadas}">
						coordObject = { coord_x1: "${coord[0]}",coord_y1: "${coord[1]}", coord_x2: "${coord[2]}", coord_y2: "${coord[3]}" };
						coordenadas.push(coordObject);
					</c:forEach>;
					trazadoObject={idActivo:"${traz.idActivo}",etiqueta:"${traz.etiqueta.idEtiqueta}",contenidoEtq:"${traz.etiqueta.contenido}",nombre:"${traz.nombre}",coord:coordenadas};
					trazados.push(trazadoObject);
				</c:forEach>
				
				
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
				
				<c:forEach var="text" items="${textosLugares}">
				textoObject = {
					coord_x : "${text.width}",
					coord_y : "${text.height}",
					texto : "${text.texto}"
				}
				textosLugares.push(textoObject);
				</c:forEach>
				
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
				
				
				
				
				function fillForm(){
					var form=$("#trazado_form");
					
					
					if($("#datepicker1").val()==""){
						$("#datepicker1").val('12/20/2200 11:07');	
					}
					
					if($("#datepicker2").val()==""){
						$("#datepicker2").val('06/03/2200 11:22');	
					}
					
					form.submit();
				}
				
				
				
				

				
				$(document).ready(function(){
					$("#datepicker1").datetimepicker({
					
					});
					$("#datepicker2").datetimepicker({
						
					});
	
					
					
					for(i=0; i<trazados.length; i++){
						var strokePath=randomColor();
						
						for(j=0;j<trazados[i].coord.length;j++){
						var div = d3.select("body").append("div")	
								    .attr("class", "tooltipPath")				
								    .style("opacity", 0);
						
						var path = svg.append("path")
						.attr("id","path"+i+""+j)
						.data([{source: {x : trazados[i].coord[j].coord_x1, y : trazados[i].coord[j].coord_y1}, 
							target: {x :trazados[i].coord[j].coord_x2, y : trazados[i].coord[j].coord_y2}}])
						.attr("class","line")
						.attr("d",lineData)
						.attr("numero",i)
						.attr("stroke",strokePath)
						.on('mouseover',function(d) {		
					            div.transition()		
				            	.duration(200)		
				            	.style("opacity", .9);
					            div.html("<strong>Activo id: </strong><span>"+trazados[$(this).attr("numero")].idActivo+ "</span><br/>" +
	 									"<strong>Nombre: </strong><span>"+trazados[$(this).attr("numero")].nombre+ "</span><br/>"+
										"<strong>Etiqueta id: </strong><span>"+trazados[$(this).attr("numero")].etiqueta+ "</span><br/>"+
										"<strong>Contenido etq: </strong><span>"+trazados[$(this).attr("numero")].contenidoEtq+ "</span><br/>")	
				            		.style("left", (d3.event.pageX) + "px")		
				            		.style("top", (d3.event.pageY - 28) + "px");})
							.on('mouseout',function(d) {		
					            div.transition()		
				            		.duration(500)		
				            		.style("opacity", 0);});
						
// 						var arrow = svg.append("svg:path")
// 						.attr("d", d3.svg.symbol().type("triangle-down")(10,1));
						
// 						arrow.transition()
// 					      .duration(2000)
// 					      .ease("linear")
// 					      .attrTween("transform", translateAlong(path.node()));

						var marker = svg.append("circle")
						 				.attr("r", 7)
						 				.attr("fill","red");
						transition();    
						
						function transition() {
						    marker.transition()
						        .duration(7500)
						        .attrTween("transform", translateAlong(path.node()))
						  }
					      
					    var totalLength = path.node().getTotalLength();
					    path
					      .attr("stroke-dasharray", totalLength + " " + totalLength)
					      .attr("stroke-dashoffset", totalLength)
					      .transition()
					        .duration(2000)        
					        .ease("linear")
					        .attr("stroke-dashoffset", 0);  
					}
					};
				});
				
			</script>
</body>
</html>