<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html>
	<head>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
		<s:url value="/resources/css/cssMenu.css" var="menuCss" />
		<s:url value="/resources/css/form.css" var="formCss" />
		<s:url value="/resources/css/main.css" var="mainCss" />
		<s:url value="/resources/css/table.css" var="tableCss"/>
		<s:url value="/resources/images/menu_button.png" var="menu_button"/>
		<link rel="stylesheet" type="text/css" href="${menuCss}"/>
		<link rel="stylesheet" type="text/css" href="${formCss}"/>
		<link rel="stylesheet" type="text/css" href="${mainCss}"/>
		<link rel="stylesheet" type="text/css" href="${tableCss}"/>


	</head>
	
<style type="text/css">
	#buscar_activo_form{
		float:left;
	}
 
 	#activos_consulta{
 		display:block;
 		float:left;
 	}
 
</style>


<script type="text/javascript">

$(function() {
	  var menuVisible = false;
	  $('#menu_button').click(function() {
	    if (menuVisible) {
	      $('#cssmenu').css({'display':'none'});
	      menuVisible = false;
	      return;
	    }
	    $('#cssmenu').css({'display':'block'});
	    menuVisible = true;
	  });
	});
	
	
$(document).ready(

		/* This is the function that will get executed after the DOM is fully loaded */
		function() {
			$("#datepicker").datepicker({
				changeMonth : true,//this option for allowing user to select month
				changeYear : true//this option for allowing user to select from year range
			});
		}

		);
		
</script>

<body>
	<div id="container">
	
	<div id="header"></div>
	
	<div id="navbar">
		<img id="menu_button" src="${menu_button}" width="40">
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
			
			<sf:form id="buscar_activo_form" method="POST" modelAttribute="activoForm" class="form-activo">
				<ul>
					<li>
						<label for="nombre_activo">Nombre activo:</label>
						<sf:input path="nombre" size="15" id="nombre_activo"/>
						<span>Introducir el nombre del activo</span>
					</li>
					<li>
						<label for="categoria_activo">Categoria activo:</label>
						<sf:input path="categoria" size="20"
								id="categoria_activo"/>
						<span>Introducir categoria del activo </span>
					</li>		
					<li>
						
						<button id="activo_button" type="submit" value="Buscar activo">Buscar activos</button>
						
					</li>
				</ul>
			</sf:form>
			
			<div id="activos_consulta">
			
				<table class="tabla_notificaciones">
						<thead>
							<tr>
								<td>Nombre</td>
								<td>Categoria</td>
								<td>Fecha Caducidad</td>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty activos}">
							<c:forEach var="activo" items="${activos}" varStatus="status">
								<tr>
									<td>${activo.nombre}</td>
									<td>${activo.categoria}</td>
									<td>${activo.fechaCaducidad}</td>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
				</table>
			
			
			</div>
			
			
		</div>
	</div>
</body>

</html>

