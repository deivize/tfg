<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Nuevo activo</title>
</head>
<body>
	<div>
	<h2>Crear nuevo activo</h2>
	
	<sf:form method="POST" modelAttribute="activo">
		<fieldset>
			<table cellspacing="0">
				<tr>
					<th><label for="nombre_activo">Nombre activo:</label></th>
					<td><sf:input path="nombre" size="15" id="nombre_activo"/></td>
				</tr>
				<tr>
					<th><label for="categoria_activo">Categoria activo:</label></th>
					<td><sf:input path="categoria" size="20" id="categoria_activo"/></td>
				</tr>
				<tr>
					<th><label for="etiqueta_activo">Etiqueta:</label></th>
					<td>
					</td>
					
				</tr>
				<tr>
					<th></th>
					<td><input name="commit" type="submit" value="Crear activo"/></td>
					</tr>
			</table>
		</fieldset>
	</sf:form>	
	</div>
</body>
</html>