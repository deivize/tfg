<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>Lista de activos</title>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<s:url value="/resources/css/cssMenu.css" var="menuCss" />
<s:url value="/resources/css/table.css" var="tableCss"/>
<s:url value="/resources/js/menu.js" var="menuJs"/>
<link rel="stylesheet" type="text/css" href="${menuCss}"/>
<link rel="stylesheet" type="text/css" href="${tableCss}"/>
<script src="${menuJs}" type="text/javascript"></script>

<style type="text/css">

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
	display:;
	position: relative;
}

.tabla_activos{
	float: left;
}



</style>

<script type="text/javascript">


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
 				
					<jsp:include page="map.jsp"></jsp:include>
					<c:forEach var="loc" items="${localizaciones}" varStatus="status">
						<circle cx="${loc.coord_x}" cy="${loc.coord_y}" r="30"
 						stroke="black" stroke-width="3" fill="none" />
					</c:forEach>
					
				
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