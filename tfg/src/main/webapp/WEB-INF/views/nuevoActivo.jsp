<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
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
</script>

<title>Nuevo activo</title>
</head>
<body>
	<div>
		

		<sf:form method="POST" modelAttribute="activo" class="form-activo">
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
								<c:forEach var="etiqueta" items="${etiquetas}">
									<option value="${etiqueta.idEtiqueta}">${etiqueta.idEtiqueta}</option>
								</c:forEach>
							</sf:select>
						<span>Escoger una de las etiquetas libres</span>

					</li>
					<li>
						
						<input name="commit" type="submit" value="Crear activo" />
					</li>
				</ul>
			</fieldset>
		</sf:form>
	</div>
</body>
</html>