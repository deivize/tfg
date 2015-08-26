<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>


<style type="text/css">
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



</head>
<body>


<div id="container">

<div id="header"></div>

<div id="navbar"></div>

<div id="container">
<div id="parametroForm">
		<sf:form id="crear_parametro_form" method="POST" modelAttribute="parametro" class="form-parametro">
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
						<button id="crear_parametro_button" onClick="$('#crear_parametro_form').submit();" value="Crear parametro">Crear</button>
					</li>
				</ul>
			</fieldset>
		
		
		
		</sf:form>
	
	
	
	</div>
</div>


</div>
</body>
</html>