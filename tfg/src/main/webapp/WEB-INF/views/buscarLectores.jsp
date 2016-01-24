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
	#buscar_lectores_form{
		float:left;
	}
 
 	#lectores_consulta{
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
			
			<sf:form id="buscar_lectores_form" method="POST" modelAttribute="lectorForm" class="form-activo">
				<ul>
					<li>
						<label for="tipo_lector">Tipo lector:</label>
						<sf:input path="tipo" size="15" id="tipo_lector"/>
						<span>Introducir el tipo del lector</span>
					</li>
					<li>
						<label for="model_lector">Modelo lector:</label>
						<sf:input path="modelo" size="20"
								id="modelo_lector"/>
						<span>Introducir modelo del lector </span>
					</li>		
					<li>
						
						<button id="lector_button" type="submit" value="Buscar lector">Buscar lectores</button>
						
					</li>
				</ul>
			</sf:form>
			
			<div id="lectores_consulta">
			
				<table class="">
						<thead>
							<tr>
								<td>Id lector</td>
								<td>Tipo</td>
								<td>Modelo</td>
							</tr>
						</thead>
						<tbody>
						<c:if test="${not empty lectores}">
							<c:forEach var="lector" items="${lectores}" varStatus="status">
								<tr>
									<td>${lector.idLector}</td>
									<td>${lector.tipo}</td>
									<td>${lector.modelo}</td>
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
