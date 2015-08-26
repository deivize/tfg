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
.form-tecnologia{
    max-width:400px;
    margin:50px auto;
    background:#fff;
    border-radius:2px;
    padding:20px;
    font-family: Georgia, "Times New Roman", Times, serif;
}
.form-tecnologia h1{
    display: block;
    text-align: center;
    padding: 0;
    margin: 0px 0px 20px 0px;
    color: #5C5C5C;
    font-size:x-large;
}
.form-tecnologia ul{
    list-style:none;
    padding:0;
    margin:0;   
}
.form-tecnologia li{
    display: block;
    padding: 9px;
    border:1px solid #DDDDDD;
    margin-bottom: 30px;
    border-radius: 3px;
}
.form-tecnologia li:last-child{
    border:none;
    margin-bottom: 0px;
    text-align: center;
}
.form-tecnologia li > label{
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
.form-tecnologia input[type="text"],
.form-tecnologia input[type="date"],
.form-tecnologia input[type="datetime"],
.form-tecnologia input[type="email"],
.form-tecnologia input[type="number"],
.form-tecnologia input[type="search"],
.form-tecnologia input[type="time"],
.form-tecnologia input[type="url"],
.form-tecnologia input[type="password"],
.form-tecnologia textarea,
.form-tecnologia select 
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
.form-tecnologia input[type="text"]:focus,
.form-tecnologia input[type="date"]:focus,
.form-tecnologia input[type="datetime"]:focus,
.form-tecnologia input[type="email"]:focus,
.form-tecnologia input[type="number"]:focus,
.form-tecnologia input[type="search"]:focus,
.form-tecnologia input[type="time"]:focus,
.form-tecnologia input[type="url"]:focus,
.form-tecnologia input[type="password"]:focus,
.form-tecnologia textarea:focus,
.form-tecnologia select:focus 
{
}
.form-tecnologia li > span{
    background: #F3F3F3;
    display: block;
    padding: 3px;
    margin: 0 -9px -9px -9px;
    text-align: center;
    color: #C0C0C0;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 11px;
}
.form-tecnologia textarea{
    resize:none;
}
.form-tecnologia input[type="submit"],
.form-tecnologia input[type="button"]{
    background: #2471FF;
    border: none;
    padding: 10px 20px 10px 20px;
    border-bottom: 3px solid #5994FF;
    border-radius: 3px;
    color: #D2E2FF;
}
.form-tecnologia input[type="submit"]:hover,
.form-tecnologia input[type="button"]:hover{
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
<div id="tecnologiaForm">
		<sf:form id="crear_tecnologia_form" method="POST" modelAttribute="tecnologia" class="form-tecnologia">
			<fieldset>
				<legend>Crear Tecnologia</legend>
				<ul>
					<li>
						<label for="tipo_tecnologia">Tipo tecnologia:</label>
						<sf:input path="tipo" size="15" id="tipo_tecnologia" />
						<span>Introducir el nombre del tipo de tecnologia</span>
					</li>
					<li>
						<label for="subtipo_tecnologia">Subtipo tecnologia:</label>
						<sf:input path="subtipo" size="15" id="subtipo_tecnologia" />
						<span>Introducir el nombre del subtipo de tecnologia</span>
					</li>
					
					<li>
						<button id="crear_tecnologia_button" onClick="$('#crear_tecnologia_form').submit();" value="Crear tecnolgia">Crear</button>
					</li>
				</ul>
			</fieldset>
		
		
		
		</sf:form>
	
	
	
	</div>
</div>


</div>
</body>
</html>