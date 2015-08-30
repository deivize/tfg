<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>Lista de activos</title>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>


<style type="text/css">
table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table {
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child {
	text-align: left;
	padding-left:20px;
}
table tr:first-child th:first-child {
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child {
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr {
	text-align: center;
	padding-left:20px;
}
table td:first-child {
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td {
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td {
	border-bottom:0;
}
table tr:last-child td:first-child {
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child {
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td {
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}


body{
	background-color: white;	
/* 	background: grey; */
/*   	background: linear-gradient(grey, orange); */

}



#content{
	margin-left:200px;
}

#navbar{
	float: left;
	width:200px;
}

#container{
	width:1000px;
	height:1000px;
	margin-left:auto;
	margin-right:auto;
}


#footer{
	clear:both;
}

#header{
	text-align: center;
}

#lista_activos{
	margin-top:20px;
	
}

#datos_activos{
	width:400px;
}

.menu{
	position: relative
}

.tabla_activos{
	float: left;
}

#cssmenu,
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul li a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  line-height: 1;
  display: block;
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
#cssmenu {
  width: 200px;
  font-family: Helvetica, Arial, sans-serif;
  color: #ffffff;
}
#cssmenu ul ul {
  display: none;
}
.align-right {
  float: right;
}
#cssmenu > ul > li > a {
  padding: 15px 20px;
  border-left: 1px solid #1682ba;
  border-right: 1px solid #1682ba;
  border-top: 1px solid #1682ba;
  cursor: pointer;
  z-index: 2;
  font-size: 14px;
  font-weight: bold;
  text-decoration: none;
  color: #ffffff;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.35);
  background: #36aae7;
  background: -webkit-linear-gradient(#36aae7, #1fa0e4);
  background: -moz-linear-gradient(#36aae7, #1fa0e4);
  background: -o-linear-gradient(#36aae7, #1fa0e4);
  background: -ms-linear-gradient(#36aae7, #1fa0e4);
  background: linear-gradient(#36aae7, #1fa0e4);
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15);
}
#cssmenu > ul > li > a:hover,
#cssmenu > ul > li.active > a,
#cssmenu > ul > li.open > a {
  color: #eeeeee;
  background: #1fa0e4;
  background: -webkit-linear-gradient(#1fa0e4, #1992d1);
  background: -moz-linear-gradient(#1fa0e4, #1992d1);
  background: -o-linear-gradient(#1fa0e4, #1992d1);
  background: -ms-linear-gradient(#1fa0e4, #1992d1);
  background: linear-gradient(#1fa0e4, #1992d1);
}
#cssmenu > ul > li.open > a {
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.15), 0 1px 1px rgba(0, 0, 0, 0.15);
  border-bottom: 1px solid #1682ba;
}
#cssmenu > ul > li:last-child > a,
#cssmenu > ul > li.last > a {
  border-bottom: 1px solid #1682ba;
}
.holder {
  width: 0;
  height: 0;
  position: absolute;
  top: 0;
  right: 0;
}
.holder::after,
.holder::before {
  display: block;
  position: absolute;
  content: "";
  width: 6px;
  height: 6px;
  right: 20px;
  z-index: 10;
  -webkit-transform: rotate(-135deg);
  -moz-transform: rotate(-135deg);
  -ms-transform: rotate(-135deg);
  -o-transform: rotate(-135deg);
  transform: rotate(-135deg);
}
.holder::after {
  top: 17px;
  border-top: 2px solid #ffffff;
  border-left: 2px solid #ffffff;
}
#cssmenu > ul > li > a:hover > span::after,
#cssmenu > ul > li.active > a > span::after,
#cssmenu > ul > li.open > a > span::after {
  border-color: #eeeeee;
}
.holder::before {
  top: 18px;
  border-top: 2px solid;
  border-left: 2px solid;
  border-top-color: inherit;
  border-left-color: inherit;
}
#cssmenu ul ul li a {
  cursor: pointer;
  border-bottom: 1px solid #32373e;
  border-left: 1px solid #32373e;
  border-right: 1px solid #32373e;
  padding: 10px 20px;
  z-index: 1;
  text-decoration: none;
  font-size: 13px;
  color: #eeeeee;
  background: #49505a;
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
}
#cssmenu ul ul li:hover > a,
#cssmenu ul ul li.open > a,
#cssmenu ul ul li.active > a {
  background: #424852;
  color: #ffffff;
}
#cssmenu ul ul li:first-child > a {
  box-shadow: none;
}
#cssmenu ul ul ul li:first-child > a {
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
}
#cssmenu ul ul ul li a {
  padding-left: 30px;
}
#cssmenu > ul > li > ul > li:last-child > a,
#cssmenu > ul > li > ul > li.last > a {
  border-bottom: 0;
}
#cssmenu > ul > li > ul > li.open:last-child > a,
#cssmenu > ul > li > ul > li.last.open > a {
  border-bottom: 1px solid #32373e;
}
#cssmenu > ul > li > ul > li.open:last-child > ul > li:last-child > a {
  border-bottom: 0;
}
#cssmenu ul ul li.has-sub > a::after {
  display: block;
  position: absolute;
  content: "";
  width: 5px;
  height: 5px;
  right: 20px;
  z-index: 10;
  top: 11.5px;
  border-top: 2px solid #eeeeee;
  border-left: 2px solid #eeeeee;
  -webkit-transform: rotate(-135deg);
  -moz-transform: rotate(-135deg);
  -ms-transform: rotate(-135deg);
  -o-transform: rotate(-135deg);
  transform: rotate(-135deg);
}
#cssmenu ul ul li.active > a::after,
#cssmenu ul ul li.open > a::after,
#cssmenu ul ul li > a:hover::after {
  border-color: #ffffff;
}



</style>

<script type="text/javascript">

( function( $ ) {
	$( document ).ready(function() {
	$('#cssmenu li.has-sub>a').on('click', function(){
			$(this).removeAttr('href');
			var element = $(this).parent('li');
			if (element.hasClass('open')) {
				element.removeClass('open');
				element.find('li').removeClass('open');
				element.find('ul').slideUp();
			}
			else {
				element.addClass('open');
				element.children('ul').slideDown();
				element.siblings('li').children('ul').slideUp();
				element.siblings('li').removeClass('open');
				element.siblings('li').find('li').removeClass('open');
				element.siblings('li').find('ul').slideUp();
			}
		});

		$('#cssmenu>ul>li.has-sub>a').append('<span class="holder"></span>');

		(function getColor() {
			var r, g, b;
			var textColor = $('#cssmenu').css('color');
			textColor = textColor.slice(4);
			r = textColor.slice(0, textColor.indexOf(','));
			textColor = textColor.slice(textColor.indexOf(' ') + 1);
			g = textColor.slice(0, textColor.indexOf(','));
			textColor = textColor.slice(textColor.indexOf(' ') + 1);
			b = textColor.slice(0, textColor.indexOf(')'));
			var l = rgbToHsl(r, g, b);
			if (l > 0.7) {
				$('#cssmenu>ul>li>a').css('text-shadow', '0 1px 1px rgba(0, 0, 0, .35)');
				$('#cssmenu>ul>li>a>span').css('border-color', 'rgba(0, 0, 0, .35)');
			}
			else
			{
				$('#cssmenu>ul>li>a').css('text-shadow', '0 1px 0 rgba(255, 255, 255, .35)');
				$('#cssmenu>ul>li>a>span').css('border-color', 'rgba(255, 255, 255, .35)');
			}
		})();

		function rgbToHsl(r, g, b) {
		    r /= 255, g /= 255, b /= 255;
		    var max = Math.max(r, g, b), min = Math.min(r, g, b);
		    var h, s, l = (max + min) / 2;

		    if(max == min){
		        h = s = 0;
		    }
		    else {
		        var d = max - min;
		        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
		        switch(max){
		            case r: h = (g - b) / d + (g < b ? 6 : 0); break;
		            case g: h = (b - r) / d + 2; break;
		            case b: h = (r - g) / d + 4; break;
		        }
		        h /= 6;
		    }
		    return l;
		}
	});
	} )( jQuery );

</script>


</head>

<body>

<div id="container">
<div id="header"></div>

<div id="navbar">
			<div id="cssmenu" class="menu">
				<ul>
					<li class='active'><a class="home_link"
						href="<s:url value="/home"/>">HOME</a>
					</li>
					<li><a class="home_link"
						href="<s:url value="/home"/>">Volver</a>
					</li>
				</ul>
			</div>

</div>

	<div id="content">
	
	<fieldset id="localizaciones_actuales">
	<legend>Localizaciones actuales</legend>
		<div id="mapa" class="mapa">
 				<svg id="svg1" height="500" width="1000">> 
					<g 
					id="mapcontainer"> 
					<path
					style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
					d="m 27.274119,33.118286 680.337741,-0.505076 2.0203,343.95694 -275.77164,-2.0203 -1.01015,-183.34269 -31.31473,-0.50508 -0.50508,182.83761 L 23.233509,370.00416 19.697975,32.61321 Z"
					id="map-border" /> 
					<path
					style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
					d="m 39.39595,172.01426 0.505076,27.7792 32.829958,0 0,-28.28428 z"
					id="lector1" class="lector" name="Lector 1" />
					<path
					style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
					d="m 401.03508,44.233775 0.50508,27.7792 32.82996,0 0,-28.28427 z"
					id="lector2" class="lector" name="Lector 2"/> 
					<path
					style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
					d="m 603.57067,140.19827 0.50508,27.77919 32.82995,0 0,-28.28427 z"
					id="lector3" class="lector" name="Lector 3"/>
					
					<c:forEach var="loc" items="${localizaciones}" varStatus="status">
						<circle cx="${loc.coord_x}" cy="${loc.coord_y}" r="30"
						stroke="black" stroke-width="3" fill="none" />
					</c:forEach>
					 </g>
				</svg>
			</div>
	
	</fieldset>
	
	<div id="lista_activos">
	<fieldset id="datos_activos">
	<legend>Activos</legend>
	<table cellspacing="0" class="tabla_activos">
		
		<thead>
			<tr>
				<th>Id activo</th>
				<th>Nombre activo</th>
				<th>Ver recorrido</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="activo" items="${activos}" varStatus="status">

			<tr>
				<td>${activo.idActivo}</td>
				<td>${activo.nombre}</td>
				<c:url var="verRecorrido" value="verRecorrido">
					<c:param name="id" value="${activo.idActivo}"/>
				</c:url>
				<td><a href="<c:out value="${verRecorrido}"/>">Ver Recorrido</a></td>
			</tr>

		</c:forEach>
		</tbody>
	</table>
	</fieldset>
	</div>
	</div>
	
</div>	
	
	

</body>
</html>