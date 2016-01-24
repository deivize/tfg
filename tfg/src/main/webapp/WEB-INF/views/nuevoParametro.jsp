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
		<sf:form id="crear_parametro_form" method="POST" modelAttribute="parametro" class="form-activo" onsubmit="return validateForm()"> 
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