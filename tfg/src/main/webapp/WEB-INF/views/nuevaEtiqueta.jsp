<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
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

function validateForm() {
	var contenido= document.getElementById("contenido_etiqueta").value;
	var fabricante= document.getElementById("fabricante_etiqueta").value;
    var parametro =document.getElementById("parametro_etiqueta").value;
    var estandar =document.getElementById("estandar_etiqueta").value;
    var tecnologia =document.getElementById("tecnologia_etiqueta").value;
    if (contenido == null || contenido == "") {
        alert("Debe especificar un contenido para la etiqueta");
        return false;
    }
    if (fabricante == null || fabricante == "") {
        alert("Debe especificar un fabricante para la etiqueta");
        return false;
    }
    if (parametro == null || parametro == "") {
        alert("Debe seleccionar un parametro para la etiqueta");
        return false;
    }
    if (estandar == null || estandar == "") {
        alert("Debe seleccionar un estandar para la etiqueta");
        return false;
    }
    
    if (tecnologia == null || tecnologia == "") {
        alert("Debe seleccionar una tecnologia para la etiqueta");
        return false;
    }
    
    
}

</script>

<title>Nueva etiqueta</title>
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
					<li>
						<a id="nuevo_parametro_link" class="home_link" href="<s:url value="/etiquetas/nuevoparametro"/>">Crear Parametro</a>
					</li>
					<li>
						<a id="nuevo_estandar_link" class="home_link" href="<s:url value="/etiquetas/nuevoestandar"/>">Crear Estandar</a>
					</li>
					<li>
						<a id="nueva_tecnologia_link" class="home_link" href="<s:url value="/etiquetas/nuevatecnologia"/>">Crear Tecnologia</a>
					</li>
					<li><a class="home_link"
						href="<s:url value="/activos/nuevoactivo"/>">Volver</a>
					</li>
				</ul>
			</div>
	
	
</div>

	<div id="content">
	<div id="etiquetaForm">
		

		<sf:form id="crear_etiqueta_form" method="POST" modelAttribute="etiqueta" class="form-activo" onsubmit="return validateForm()">
			<fieldset>
			<legend>Crear nueva etiqueta</legend>
				<ul>
					<li>
						<label for="contenido_etiqueta">Contenido etiqueta:</label>
						<sf:input path="contenido" size="15" id="contenido_activo" />
						<span>Introducir informacion sobre la etiqueta</span>
					</li>
					<li>
						<label for="fabricante_etiqueta">Fabricante:</label>
						<sf:input path="fabricante" size="20"
								id="fabricante_etiqueta" />
						<span>Introducir el fabricante de la etiqueta</span>
					</li>
					<li>
						<label for="info_cifrada">Informacion cifrada;</label>
						<sf:select path="infoCifrada" id="info_cifrada_etiqueta">
							<option value="TRUE">Si</option>
							<option value="FALSE">No</option>
						</sf:select>
						<span>Escoger si la información de la etiqueta va cifrada o no</span>
					</li>
					<li>
						<label for="parametro_etiqueta">Parametro:</label>
						<sf:select path="parametro" id="parametro_etiqueta">
							<c:choose>
								<c:when test="${not empty parametros}">
								<option value=""></option>
								<c:forEach var="parametro" items="${parametros}">
									<option value="${parametro.idParametro}">${parametro.nombre}</option>
								</c:forEach>
								<sf:errors path="parametro"/>
								</c:when>
								<c:when test="${empty parametros}">
									<option value="no_parametros">No hay parametros</option>
								</c:when>
							</c:choose>
							</sf:select>
						<span>Escoger uno de los parametros</span>

					</li>
					<li>
						<label for="estandar_etiqueta">Estandar:</label>
						<sf:select path="estandar" id="estandar_etiqueta">
							<c:choose>
								<c:when test="${not empty estandares}">
								<option value=""></option>
								<c:forEach var="estandar" items="${estandares}">
									<option value="${estandar.idEstandar}">${estandar.nombre}</option>
								</c:forEach>
								<sf:errors path="estandar"/>
								</c:when>
								<c:when test="${empty estandares}">
									<option value="no_estandares">No hay estandares</option>
								</c:when>
							</c:choose>
							</sf:select>
						<span>Escoger uno de los estandares</span>

					</li>
					<li>
						<label for="tecnologia_etiqueta">Tecnologia:</label>
						<sf:select path="tecnologia" id="tecnologia_etiqueta">
							<c:choose>
								<c:when test="${not empty tecnologias}">
								<option value=""></option>
								<c:forEach var="tecnologia" items="${tecnologias}">
									<option value="${tecnologia.idTecnologia}">${tecnologia.tipo}</option>
								</c:forEach>
								<sf:errors path="tecnologia"/>
								</c:when>
								<c:when test="${empty tecnologias}">
									<option value="no_tecnologias">No hay tecnologias</option>
								</c:when>
							</c:choose>
							</sf:select>
						<span>Escoger una de las tecnologias</span>

					</li>
					<li>
						
						<button id="etiqueta_button" type="submit" value="Crear etiqueta">Crear Etiqueta</button>
						
					</li>
				</ul>
			</fieldset>
		</sf:form>
	</div>
	</div>
	
	</div>
</body>
</html>