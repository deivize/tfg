<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>


<style type="text/css">
.form-estandar{
    max-width:400px;
    margin:50px auto;
    background:#fff;
    border-radius:2px;
    padding:20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-estandar h1{
    display: block;
    text-align: center;
    padding: 0;
    margin: 0px 0px 20px 0px;
    color: #5C5C5C;
    font-size:x-large;
}
.form-estandar ul{
    list-style:none;
    padding:0;
    margin:0;   
}
.form-estandar li{
    display: block;
    padding: 9px;
    border:1px solid #DDDDDD;
    margin-bottom: 30px;
    border-radius: 3px;
}
.form-estandar li:last-child{
    border:none;
    margin-bottom: 0px;
    text-align: center;
}
.form-estandar li > label{
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
.form-estandar input[type="text"],
.form-estandar input[type="date"],
.form-estandar input[type="datetime"],
.form-estandar input[type="email"],
.form-estandar input[type="number"],
.form-estandar input[type="search"],
.form-estandar input[type="time"],
.form-estandar input[type="url"],
.form-estandar input[type="password"],
.form-estandar textarea,
.form-estandar select 
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
.form-estandar input[type="text"]:focus,
.form-estandar input[type="date"]:focus,
.form-estandar input[type="datetime"]:focus,
.form-estandar input[type="email"]:focus,
.form-estandar input[type="number"]:focus,
.form-estandar input[type="search"]:focus,
.form-estandar input[type="time"]:focus,
.form-estandar input[type="url"]:focus,
.form-estandar input[type="password"]:focus,
.form-estandar textarea:focus,
.form-estandar select:focus 
{
}
.form-estandar li > span{
    background: #F3F3F3;
    display: block;
    padding: 3px;
    margin: 0 -9px -9px -9px;
    text-align: center;
    color: #C0C0C0;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
}
.form-estandar textarea{
    resize:none;
}
.form-estandar input[type="submit"],
.form-estandar input[type="button"]{
    background: #2471FF;
    border: none;
    padding: 10px 20px 10px 20px;
    border-bottom: 3px solid #5994FF;
    border-radius: 3px;
    color: #D2E2FF;
}
.form-estandar input[type="submit"]:hover,
.form-estandar input[type="button"]:hover{
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
<div id="estandarForm">
		<sf:form id="crear_estandar_form" method="POST" modelAttribute="estandar" class="form-estandar">
			<fieldset>
				<legend>Crear estandar</legend>
				<ul>
					<li>
						<label for="nombre_estandar">Nombre estandar:</label>
						<sf:input path="nombre" size="15" id="nombre_estandar" />
						<span>Introducir un identificador para el estandar</span>
					</li>
					
					<li>
						<button id="crear_estandar_button" onClick="$('#crear_estandar_form').submit();" value="Crear estandar">Crear</button>
					</li>
				</ul>
			</fieldset>
		
		
		
		</sf:form>
	
	
	
	</div>
</div>


</div>
</body>
</html>