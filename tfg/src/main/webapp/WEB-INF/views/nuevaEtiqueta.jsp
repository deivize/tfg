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
<link rel="stylesheet" type="text/css" href="${menuCss}"/>

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


.form-etiqueta{
    max-width:400px;
    margin:50px auto;
    background:#fff;
    border-radius:2px;
    padding:20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-etiqueta h1{
    display: block;
    text-align: center;
    padding: 0;
    margin: 0px 0px 20px 0px;
    color: #5C5C5C;
    font-size:x-large;
}
.form-etiqueta ul{
    list-style:none;
    padding:0;
    margin:0;   
}
.form-etiqueta li{
    display: block;
    padding: 9px;
    border:1px solid #DDDDDD;
    margin-bottom: 30px;
    border-radius: 3px;
}
.form-etiqueta li:last-child{
    border:none;
    margin-bottom: 0px;
    text-align: center;
}
.form-etiqueta li > label{
    display: block;
    float: left;
    margin-top: -19px;
    background: #FFFFFF;
    height: 14px;
    padding: 2px 5px 2px 5px;
    color: #B9B9B9;
    font-size: 14px;
    overflow: hidden;
    font-family: Arial, Helvetica, sans-serif;
}
.form-etiqueta input[type="text"],
.form-etiqueta input[type="date"],
.form-etiqueta input[type="datetime"],
.form-etiqueta input[type="email"],
.form-etiqueta input[type="number"],
.form-etiqueta input[type="search"],
.form-etiqueta input[type="time"],
.form-etiqueta input[type="url"],
.form-etiqueta input[type="password"],
.form-etiqueta textarea,
.form-etiqueta select 
{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    display: block;
    outline: none;
    border: none;
    height: 25px;
    line-height: 25px;
    font-size: 16px;
    padding: 0;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-etiqueta input[type="text"]:focus,
.form-etiqueta input[type="date"]:focus,
.form-etiqueta input[type="datetime"]:focus,
.form-etiqueta input[type="email"]:focus,
.form-etiqueta input[type="number"]:focus,
.form-etiqueta input[type="search"]:focus,
.form-etiqueta input[type="time"]:focus,
.form-etiqueta input[type="url"]:focus,
.form-etiqueta input[type="password"]:focus,
.form-etiqueta textarea:focus,
.form-etiqueta select:focus 
{
}
.form-etiqueta li > span{
    background: #F3F3F3;
    display: block;
    padding: 3px;
    margin: 0 -9px -9px -9px;
    text-align: center;
    color: #C0C0C0;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
}
.form-etiqueta textarea{
    resize:none;
}
.form-etiqueta input[type="submit"],
.form-etiqueta input[type="button"]{
    background: #2471FF;
    border: none;
    padding: 10px 20px 10px 20px;
    border-bottom: 3px solid #5994FF;
    border-radius: 3px;
    color: #D2E2FF;
}
.form-etiqueta input[type="submit"]:hover,
.form-etiqueta input[type="button"]:hover{
    background: #6B9FFF;
    color:#fff;
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
		

		<sf:form id="crear_etiqueta_form" method="POST" modelAttribute="etiqueta" class="form-etiqueta" onsubmit="return validateForm()">
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