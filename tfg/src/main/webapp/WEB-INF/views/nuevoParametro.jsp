<%@ page language="java" contentType="text/html; UTF-8"
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


.form-parametro{
    max-width:400px;
    margin:50px auto;
    background:#fff;
    border-radius:2px;
    padding:20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-parametro h1{
    display: block;
    text-align: center;
    padding: 0;
    margin: 0px 0px 20px 0px;
    color: #5C5C5C;
    font-size:x-large;
}
.form-parametro ul{
    list-style:none;
    padding:0;
    margin:0;   
}
.form-parametro li{
    display: block;
    padding: 9px;
    border:1px solid #DDDDDD;
    margin-bottom: 30px;
    border-radius: 3px;
}
.form-parametro li:last-child{
    border:none;
    margin-bottom: 0px;
    text-align: center;
}
.form-parametro li > label{
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
.form-parametro input[type="text"],
.form-parametro input[type="date"],
.form-parametro input[type="datetime"],
.form-parametro input[type="email"],
.form-parametro input[type="number"],
.form-parametro input[type="search"],
.form-parametro input[type="time"],
.form-parametro input[type="url"],
.form-parametro input[type="password"],
.form-parametro textarea,
.form-parametro select 
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
.form-parametro input[type="text"]:focus,
.form-parametro input[type="date"]:focus,
.form-parametro input[type="datetime"]:focus,
.form-parametro input[type="email"]:focus,
.form-parametro input[type="number"]:focus,
.form-parametro input[type="search"]:focus,
.form-parametro input[type="time"]:focus,
.form-parametro input[type="url"]:focus,
.form-parametro input[type="password"]:focus,
.form-parametro textarea:focus,
.form-parametro select:focus 
{
}
.form-parametro li > span{
    background: #F3F3F3;
    display: block;
    padding: 3px;
    margin: 0 -9px -9px -9px;
    text-align: center;
    color: #C0C0C0;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
}
.form-parametro textarea{
    resize:none;
}
.form-parametro input[type="submit"],
.form-parametro input[type="button"]{
    background: #2471FF;
    border: none;
    padding: 10px 20px 10px 20px;
    border-bottom: 3px solid #5994FF;
    border-radius: 3px;
    color: #D2E2FF;
}
.form-parametro input[type="submit"]:hover,
.form-parametro input[type="button"]:hover{
    background: #6B9FFF;
    color:#fff;
}
</style>

<script type="text/javascript">

function validateForm() {
	var nombre= document.getElementById("nombre_parametro").value;
	var valor= document.getElementById("valor_parametro").value;
    
    if (nombre == null || nombre == "") {
        alert("Debe especificar un identificador para el parametro");
        return false;
    }
    if (valor == null || valor == "") {
        alert("Debe especificar un valor para el parametro");
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
						href="<s:url value="/etiquetas/nuevaetiqueta"/>">Volver</a>
					</li>
				</ul>
			</div>

</div>

<div id="container">
<div id="parametroForm">
		<sf:form id="crear_parametro_form" method="POST" modelAttribute="parametro" class="form-parametro" onsubmit="return validateForm()"> 
			<fieldset>
				<legend>Crear parametro</legend>
				<ul>
					<li>
						<label for="nombre_parametro">Nombre parametro:</label>
						<sf:input path="nombre" size="15" id="nombre_parametro" />
						<span>Introducir un identificador para el parametro</span>
					</li>
					<li>
						<label for="valor_parametro">Valor:</label>
						<sf:input path="valor" size="20"
								id="valor_parametro" />
						<span>Introducir un valor para el parametro</span>
					</li>
					<li>
						<button id="crear_parametro_button" type="submit" value="Crear parametro">Crear</button>
					</li>
				</ul>
			</fieldset>
		
		
		
		</sf:form>
	
	
	
	</div>
</div>


</div>
</body>
</html>