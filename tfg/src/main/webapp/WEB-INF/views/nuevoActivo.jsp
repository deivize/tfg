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

.form-activo{
    max-width:400px;
    margin:50px auto;
    background:#fff;
    border-radius:2px;
    padding:20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-activo h1{
    display: block;
    text-align: center;
    padding: 0;
    margin: 0px 0px 20px 0px;
    color: #5C5C5C;
    font-size:x-large;
}
.form-activo ul{
    list-style:none;
    padding:0;
    margin:0;   
}
.form-activo li{
    display: block;
    padding: 9px;
    border:1px solid #DDDDDD;
    margin-bottom: 30px;
    border-radius: 3px;
}
.form-activo li:last-child{
    border:none;
    margin-bottom: 0px;
    text-align: center;
}
.form-activo li > label{
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
.form-activo input[type="text"],
.form-activo input[type="date"],
.form-activo input[type="datetime"],
.form-activo input[type="email"],
.form-activo input[type="number"],
.form-activo input[type="search"],
.form-activo input[type="time"],
.form-activo input[type="url"],
.form-activo input[type="password"],
.form-activo textarea,
.form-activo select 
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
.form-activo input[type="text"]:focus,
.form-activo input[type="date"]:focus,
.form-activo input[type="datetime"]:focus,
.form-activo input[type="email"]:focus,
.form-activo input[type="number"]:focus,
.form-activo input[type="search"]:focus,
.form-activo input[type="time"]:focus,
.form-activo input[type="url"]:focus,
.form-activo input[type="password"]:focus,
.form-activo textarea:focus,
.form-activo select:focus 
{
}
.form-activo li > span{
    background: #F3F3F3;
    display: block;
    padding: 3px;
    margin: 0 -9px -9px -9px;
    text-align: center;
    color: #C0C0C0;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
}
.form-activo textarea{
    resize:none;
}
.form-activo input[type="submit"],
.form-activo input[type="button"]{
    background: #2471FF;
    border: none;
    padding: 10px 20px 10px 20px;
    border-bottom: 3px solid #5994FF;
    border-radius: 3px;
    color: #D2E2FF;
}
.form-activo input[type="submit"]:hover,
.form-activo input[type="button"]:hover{
    background: #6B9FFF;
    color:#fff;
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