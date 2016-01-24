<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>

<title>Ver Recorrido</title>

<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<s:url value="/resources/css/cssMenu.css" var="menuCss" />
<s:url value="/resources/css/table.css" var="tableCss"/>
<s:url value="/resources/js/menu.js" var="menuJs"/>
<link rel="stylesheet" type="text/css" href="${menuCss}"/>
<link rel="stylesheet" type="text/css" href="${tableCss}"/>
<script src="${menuJs}" type="text/javascript"></script>

<style type="text/css">

body {
	background-color: white;
	/* 	background: grey; */
	/*   	background: linear-gradient(grey, orange); */
}

#content {
	margin-left: 200px;
}

#navbar {
	float: left;
	width: 200px;
}

#ficha_informativa{
	margin-top:20px;
	width: 570px;
}

#datos_localizacion{
	margin-top:20px;
}

#datos_activo{
	margin-top:20px;
}

#texto_loc_actual{
	color:red;
}

#container {
	width: 1000px;
	height: 1000px;
	margin-left: auto;
	margin-right: auto;
}

#footer {
	clear: both;
}

#header {
	text-align: center;
}

.menu {
	position: relative
}

.showRow {
	background:black;
	
}

</style>

<script type="text/javascript">

function init(){
	
	
	for(var i=0; i<=${path_size}; i++) {
	    setAnimations(i);
	  }
	
	var svg=d3.select("#mapcontainer");
	
	
	
	console.log(svg);
	console.log(${paths});
	console.log(${path_size});
	console.log(${locActualX});
	console.log(${locActualY});
	
	
	
	
};

function markPath(i){
	
// 	var j;
// 	console.log(i);
// 	if((i%2)==0){
// 		j=i-1;
// 	}else{
// 		j=i;
// 	}
	if(i>=${path_size}){
		i=${path_size};
	}
// 	console.log(i);
	var path=d3.select("#path"+i);
// 	console.log(path);
// 	console.log(path.attr("stroke"));
	
	currentColor= path.attr("stroke") == "red" ? "blue" : "red"; 
	path.attr("stroke",currentColor);
	
};

function showRow(j){
	var tr=document.getElementById("localizaciones"+j);
	console.log(tr);
	$(tr).addClass("showRow");
	$(tr).children("td").each (function(){
		$(this).addClass("showRow");
	})	
};



function setAnimations(number) {
	  path=document.getElementById('path'+number);
	  pathLength=path.getTotalLength().toString();
	  pathAnim=document.getElementById('dashAnim'+number);
	  path.setAttributeNS(null,'stroke-dasharray',pathLength+" "+pathLength);
	  path.setAttributeNS(null,'stroke-dashoffset',pathLength);
	  path.setAttributeNS(null,'stroke','red');
	  path.setAttributeNS(null,'stroke-width','5');
	  pathAnim.setAttributeNS(null,'from',pathLength);
	  pathAnim.setAttributeNS(null,'values',pathLength+';0');
	}


// function animatePath(){
	
// 	var svg= d3.select(document.getElementById("mapcontainer"));
// 	svg.append("svg:defs")
// 	.append("svg:marker")
// 	.attr("id", "arrow")	
// 	.attr("refX", 2)
// 	.attr("refY", 6)
// 	.attr("markerWidth", 13)
// 	.attr("markerHeight", 13)
// 	.attr("orient", "auto")
// 	.append("svg:path")
// 	.attr("d", "M2,2 L2,11 L10,6 L2,2");
	
	
// 	var line=d3.svg.line()
// 		.x(d => d.x)
//   		.y(d => d.y)
	
	
// 	var path=svg.append('path')
// 	.datum(recorridos)
// 		.attr({
// 			'd':line,
// 			'stroke-dasharray':'385 385',
// 			'stroke-dashoffset': 385,
// 		})
// 	.transition()
// 		.duration(1500)
// 		.attr('stroke-dasoffset',0)
		
		
	
	
// };


</script>

</head>
<body onload="init()">

	<!-- 	<div id="localizaciones"> -->
	<%-- 		<c:forEach var="localizacion" items="${localizaciones}" --%>
	<%-- 			varStatus="status"> --%>
	<%-- 			<div id="activo${activo.idActivo}"> --%>
	<%-- 				<div id="coord_x">${localizacion.coord_x}</div> --%>
	<%-- 				<div id="coord_y">${localizacion.coord_y}</div> --%>
	<!-- 			</div> -->
	<%-- 		</c:forEach> --%>
	<!-- 	</div> -->
	<!-- 	<div id="localizaciones"> -->
	<%-- 		<c:forEach var="localizacion" items="${localizaciones}" varStatus="status"> --%>
	<%-- 			<td>${localizacion.coord_x}</td> --%>
	<%-- 			<td>${localizacion.coord_y}</td> --%>
	<%-- 		</c:forEach> --%>
	<!-- 	</div>	 -->


	<!-- 	<div id="paths"> -->
	<%-- 		<c:forEach var="path" items="${paths}" varStatus="status"> --%>
	<%-- 			<c:forEach var="i" begin="0" end="4" step="2"> --%>
	<%-- 				<td>${path[i]}</td> --%>
	<%-- 				<td>${path[i+1]}</td> --%>
	<%-- 			</c:forEach> --%>
	<%-- 		</c:forEach> --%>
	<!-- 	</div> -->

	<div id="container">
		<div id="header"></div>

		<div id="navbar">
			<div id="cssmenu" class="menu">
				<ul>
					<li class='active'><a class="home_link"
						href="<s:url value="/home"/>">HOME</a></li>
					<li>
						<c:url var="descargar" value="descarga">
							<c:param name="id" value="${idActivo}"/>
						</c:url>
						<a href="<c:out value="${descargar}"/>">Descargar informe</a>	
					</li>	
					<li><a class="home_link"
						href="<s:url value="/activos/listactivos"/>">Volver</a></li>
				</ul>
			</div>



		</div>

		<div id="content">
			<div id="mapa" class="mapa">
			<fieldset>
			<legend>Mapa</legend>
				 <svg xmlns="http://www.w3.org/2000/svg"  id="svg1" height="1000" width="800">
			  <g
			     id="mapcontainer">
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 29.947433,28.597981 612.509587,-0.530457 -0.65301,101.902856 61.68058,0.41841 -0.41842,869.44548 -613.162594,2e-5 -3.744743,-868.76275 -56.691095,0.41843 z"
			       id="path_mapa1"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.90345025px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 86.707356,131.26393 57.297494,-0.29694 0.35714,10.29079 -47.77098,0 0,69.77427 98.83652,0 -0.5824,-70.00912 -26.88884,-0.35752 -0.24124,-9.69334 36.97033,-0.11647 -0.19783,92.3111 -117.297717,0 z"
			       id="path_mapa2"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.87416732px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 205.16853,130.65398 53.06778,0.0599 0,10.11543 -44.71025,0 0,69.79641 92.50397,0 -0.54509,-70.03133 -25.16604,-0.35764 -0.22579,-9.69642 34.31311,0.24092 0.10334,91.98297 -109.50979,0.35764 z"
			       id="path_mapa3"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 641.07143,129.8622 -65,0.71429 -0.35714,-7.5 57.85714,-0.71429 -0.71429,-86.071425 -96.42857,0 1.07143,87.142855 17.14286,0 -0.17857,7.5 -28.21429,1e-5 0,-102.67858 115.53572,0.535715 z"
			       id="path_mapa4"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 526.07143,130.57649 -80.53571,0.17857 -0.35715,-7.32142 71.78572,-0.17858 -0.35715,-87.321429 -108.39285,0.714286 0,86.785713 13.92857,-0.17857 0,7.5 L 400,130.57649 399.46429,28.25506 525.89286,28.612203 Z"
			       id="path_mapa5"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 314.64286,222.71935 -0.29587,31.5765 -10.41842,-0.14793 -0.35714,-24.28572 -207.142858,0.71429 0,65.35714 208.384958,0 0,-27.70234 9.34391,0 0,27.77919 0,7.95496 -226.526707,-0.37881 0,-80.8122 z"
			       id="path_mapa6"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 87.76072,543.95962 129.92715,-0.71429 -0.50508,86.87312 -15.15228,0 0,-75.76145 -97.9848,0 0,214.15234 97.9848,0.50508 0.50507,-116.67262 14.70849,0.35714 -0.29587,128.43731 -127.78429,-0.50507 z"
			       id="path_mapa7"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.43012977px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 217.33675,542.19875 -0.3477,-169.56328 -15.64676,0 -0.0495,169.64459 z"
			       id="path_mapa8"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 399.51533,224.03712 242.43661,0 0,42.93148 -12.6269,0 0,-31.31473 -216.17265,0 0,94.95434 216.17265,-0.25254 0,-44.69925 12.87944,0 0.25254,58.33631 -242.18407,-0.50508 z"
			       id="path_mapa9"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 400.02092,344.37102 242.4366,0 0,42.93148 -12.6269,0 0,-31.31473 -216.17264,0 0,94.95434 216.17264,-0.25254 0,-44.69925 12.87944,0 0.25254,58.33631 -242.18406,-0.50508 z"
			       id="path_mapa10"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 400.77853,464.66583 242.4366,0 0,42.93148 -12.6269,0 0,-31.31473 -216.17264,0 0,94.95434 216.17264,-0.25254 0,-44.69925 12.87944,0 0.25254,58.33631 -242.18406,-0.50508 z"
			       id="path_mapa11"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 216.78571,780.93363 0,29.28572 -10.71428,0 0,-18.57143 -103.21429,0 0,68.21428 104.64286,0 0,-25 9.64285,0 0.35715,37.85715 -128.214286,0 0,-91.42857 z"
			       id="path_mapa12"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.17860413px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 217.23049,872.27385 0,40.73794 -10.69931,0 0,-25.83381 -103.07008,0 0,94.88957 104.49665,0 0,-34.77629 9.62938,0 0.35665,52.66124 -128.035145,0 0,-127.18183 z"
			       id="path_mapa13"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 274.82233,779.2092 0,220.71425 232.14286,0 0,-83.5714 -24.28572,0 0,66.42858 -183.57143,0 0,-186.42858 181.42858,0 0,72.14286 25.71428,0 0,-88.57143 z"
			       id="path_mapa14"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.93735927px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 506.13228,780.18797 113.56334,0 0,110.74604 -20.0775,0 0,-91.4548 -69.01639,0 0,69.3056 -25.09686,0 z"
			       id="path_mapa15"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:0.93610311px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 507.07301,916.35923 23.26316,0 0,61.82486 67.78806,0 0,-38.10138 23.01061,0 0,58.94929 -113.18738,0 z"
			       id="path_mapa16"
			       />
			    <path
			       style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
			       d="m 401.4719,584.84426 -0.75761,62.51794 18.57171,0 -2.9e-4,-47.85714 97.85715,0 0,118.57143 -97.48206,0.25254 -0.3748,-43.36222 -18.57171,0.25254 0,57.85714 140,0 0.25254,-148.78063 z"
			       id="path_mapa17"
			       />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector1"
			       width="14.932404"
			       height="10.009442"
			       x="102.59492"
			       y="196.58939" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector2"
			       width="14.932404"
			       height="10.009442"
			       x="219.60323"
			       y="195.15591" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector3"
			       width="14.932404"
			       height="10.009442"
			       x="34.855228"
			       y="33.428921" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector4"
			       width="14.932404"
			       height="10.009442"
			       x="406.94888"
			       y="135.44229" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector5"
			       width="14.932404"
			       height="10.009442"
			       x="491.67938"
			       y="47.406601" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector6"
			       width="14.932404"
			       height="10.009442"
			       x="607.56787"
			       y="44.733288" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector7"
			       width="14.932404"
			       height="10.009442"
			       x="287.17667"
			       y="268.78604" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector8"
			       width="14.932404"
			       height="10.009442"
			       x="419.32327"
			       y="245.80145" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector9"
			       width="14.932404"
			       height="10.009442"
			       x="680.44769"
			       y="140.24049" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector10"
			       width="14.932404"
			       height="10.009442"
			       x="421.8486"
			       y="364.99945" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector10"
			       width="14.932404"
			       height="10.009442"
			       x="422.35367"
			       y="482.17712" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector11"
			       width="14.932404"
			       height="10.009442"
			       x="92.033829"
			       y="399.3446" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector12"
			       width="14.932404"
			       height="10.009442"
			       x="106.68104"
			       y="672.08582" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector13"
			       width="14.932404"
			       height="10.009442"
			       x="493.57626"
			       y="701.68787" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector14"
			       width="14.932404"
			       height="10.009442"
			       x="108.19626"
			       y="797.84973" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector15"
			       width="14.932404"
			       height="10.009442"
			       x="108.19626"
			       y="892.29907" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector16"
			       width="14.932404"
			       height="10.009442"
			       x="381.94757"
			       y="805.4259" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector17"
			       width="14.932404"
			       height="10.009442"
			       x="557.03485"
			       y="809.60913" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector18"
			       width="14.932404"
			       height="10.009442"
			       x="682.97302"
			       y="747.84723" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.91773033;stroke-opacity:1"
			       id="lector19"
			       width="17.886852"
			       height="9.9334335"
			       x="378.45007"
			       y="633.73798" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector20"
			       width="14.932404"
			       height="10.009442"
			       x="168.30034"
			       y="117.007" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector21"
			       width="14.932404"
			       height="10.009442"
			       x="280.93234"
			       y="117.51207" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector22"
			       width="14.932404"
			       height="10.009442"
			       x="539.53137"
			       y="135.18973" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector23"
			       width="14.932404"
			       height="10.009442"
			       x="647.11261"
			       y="286.20755" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector24"
			       width="14.932404"
			       height="10.009442"
			       x="647.11267"
			       y="406.41571" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector25"
			       width="14.932404"
			       height="10.009442"
			       x="648.62787"
			       y="527.12891" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector26"
			       width="14.932404"
			       height="10.009442"
			       x="224.3638"
			       y="373.08066" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.7865414;stroke-opacity:1"
			       id="lector27"
			       width="12.967278"
			       height="10.064622"
			       x="221.30577"
			       y="653.37036" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector28"
			       width="14.932404"
			       height="10.009442"
			       x="221.33334"
			       y="834.7204" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector29"
			       width="14.932404"
			       height="10.009442"
			       x="221.83842"
			       y="946.84729" />
			    <rect
			       style="fill:#ffffff;fill-opacity:1;stroke:#000000;stroke-width:0.84172118;stroke-opacity:1"
			       id="lector30"
			       width="14.932404"
			       height="10.009442"
			       x="626.40448"
			       y="879.67218" />
			       
			    <c:set var="i" value="1" />
			    <marker id="arrow" orient="auto" markerWidth="2" markerHeight="4" refX="0.1" refY="2">
			    	<path d='M0,0 V4 L2,2 Z' fill='black' />
			    </marker>
			    <path id="path0" d=""> 
    			<animate id="dashAnim0" attributeName="stroke-dashoffset"
						from="0" to="0" dur="0.01s" begin="0s" fill="freeze"
						keySplines="0 0.5 0.5 1" calcMode="spline" />
  				</path>
			    			<c:forEach var="path" items="${paths}" varStatus="status">
					<path id="path${i}"
							d="M${path[0]},${path[1]} L${path[2]},${path[3]}" marker-end="url(#arrow)" style="cursor:hand;" onClick="showRow(${i})">
						<animate id="dashAnim${i}" attributeName="stroke-dashoffset"
							from="0" to="0" dur="10s" begin="dashAnim${i-1}.end+1s"
							fill="freeze" keySplines="0 0.5 0.5 1" calcMode="spline" />
  					</path>
				<c:set var="i" value="${i+1}" />
		</c:forEach>
		
				<polygon points="0,0 -15,-25 15,-25" style="fill:lime;stroke:black;stroke-width:1" transform="translate(${locActualX},${locActualY})" />
			  </g>
			  		  
			  
			  		  
			  		  
			  </svg>
			</fieldset>
			
			</div>
			<div id="ficha_informativa">
				<fieldset id="datos_localizacion">
					<legend>Localizaciones del activo</legend>
					<table id="tabla_localizaciones" cellspacing="0" class="tabla_activos">

						<thead>
							<tr>
								<th>Edificio</th>
								<th>Planta</th>
								<th>Area</th>
								<th>Zona</th>
								<th>Fecha</th>
								<th>Ver</th>
							</tr>
						</thead>

						<tbody>
							<c:set var="j" value="1"></c:set>
							<c:forEach var="localizacion" items="${localizaciones}" varStatus="status">

								<tr id="localizaciones${j}">
									<td>${localizacion.edificio}</td>
									<td>${localizacion.planta}</td>
									<td>${localizacion.area}</td>
									<td>${localizacion.zona}</td>
									<td>${localizacion.fecha}</td>
									<td><a onClick="markPath(${j});" style="cursor:pointer; cursor:hand;">Ver tramo</a></td>
								</tr>
								<c:set var="j" value="${j+1}"/>
							</c:forEach>
						</tbody>
					</table>

				</fieldset>
				
				<fieldset id="datos_activo">
					<legend>Datos del activo</legend>
					<table id="tabla_activo" cellspacing="0" class="tabla_activos">

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

				</fieldset>
				
			</div>
			
	
		</div>

	</div>
</body>
</html>