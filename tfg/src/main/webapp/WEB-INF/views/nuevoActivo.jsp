<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%-- <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script> --%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js" type="text/javascript"></script>
   
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
<s:url value="/resources/css/cssMenu.css" var="menuCss" />
<s:url value="/resources/css/form.css" var="formCss" />
<s:url value="/resources/js/menu.js" var="menuJs"/>
<link rel="stylesheet" type="text/css" href="${menuCss}"/>
<link rel="stylesheet" type="text/css" href="${formCss}"/>
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

.menu{
	position: relative
}


</style>

<script type="text/javascript">
//auto expand textarea
function adjust_textarea(h) {
    h.style.height = "20px";
    h.style.height = (h.scrollHeight)+"px";
}

$(function() {
    $('#activo_button').hide(); 
    $('#etiqueta_activo').change(function(){
        if(($('#etiqueta_activo').val() == 'no_etiquetas')||($('#etiqueta_activo').val() == 'crear_etiqueta')) {
            $('#nueva_etiqueta_link').show();
            $('#activo_button').hide();
        } else {
            $('#nueva_etiqueta_link').hide();
            $('#activo_button').show();
        } 
    });
});

function validateForm() {
    var etiqueta =document.getElementById("parametro_etiqueta").value;
    var categoria =document.getElementById("estandar_etiqueta").value;
    
    if (etiqueta == null || etiqueta == "" || etiqueta=="crear_etiqueta") {
        alert("Debe seleccionar una etiqueta para el activo o crear una nueva");
        return false;
    }
    if (categoria == null || categoria == "") {
        alert("Debe introducir una categoria para el activo");
        return false;
    }
    
   
    
}

	
	
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

<title>Nuevo activo</title>
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
					<li>
						<a id="nueva_etiqueta_link" class="home_link" href="<s:url value="/etiquetas/nuevaetiqueta"/>">Crear Etiqueta</a>
					</li>
				</ul>
			</div>
	
	</div>	
		
		<div id="content">
		<sf:form id="crear_activo_form" method="POST" modelAttribute="activo" class="form-activo" onsubmit="return validateForm()">
			<fieldset>
			<legend>Crear nuevo activo</legend>
				<ul>
					<li>
						<label for="nombre_activo">Nombre activo:</label>
						<sf:input path="nombre" size="15" id="nombre_activo" />
						<span>Introducir el nombre del activo</span>
					</li>
					<li>
						<label for="categoria_activo">Categoria activo:</label>
						<sf:input path="categoria" size="20"
								id="categoria_activo" />
						<span>Introducir categoria del activo (ex:)</span>
					</li>
					<li>
						<label for="etiqueta_activo">Etiqueta:</label>
						<sf:select path="etiqueta" id="etiqueta_activo">
							<c:choose>
								<c:when test="${not empty etiquetas}">
								<option value="crear_etiqueta">Crear nueva etiqueta</option>
								<c:forEach var="etiqueta" items="${etiquetas}">
									<option value="${etiqueta.idEtiqueta}">${etiqueta.contenido}</option>
								</c:forEach>
								</c:when>
								<c:when test="${empty etiquetas}">
									<option value="no_etiquetas">No hay etiquetas libres</option>
								</c:when>
							</c:choose>
							</sf:select>
						<span>Escoger una de las etiquetas libres</span>

					</li>
					<li>
						<label for="fechaCaducidad">Fecha caducidad:</label>
						<sf:input path="fechaCaducidad" id="datepicker"/>
					</li>
					
					<li>
						
						<button id="activo_button" type="submit" value="Crear activo">Crear Activo</button>
						
					</li>
				</ul>
			</fieldset>
		</sf:form>
		</div>
	</div>
</body>
</html>