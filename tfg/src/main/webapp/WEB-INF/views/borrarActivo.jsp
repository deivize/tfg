<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
#form {
	display: none;
}
	
</style>	

<html>
<head>
<title>Lista de activos</title>
</head>

<body>
	<h3>Lista de activos</h3>

	<table border="1">

		<c:forEach var="activos" items="${activos}" varStatus="status">
			<sf:form method="POST" modelAttribute="activo">
				<tr>
					<td>${activos.idActivo}</td>
					<td>${activos.nombre}</td>
					<td id="form">
						<sf:input path="idActivo" value="${activos.idActivo}"/>
						<sf:input path="nombre" value="${activos.nombre}"/>
						<sf:input path="categoria" value="${activos.categoria}"/>	
					</td>
					<td><input name="commit" type="submit" value="Borrar activo" /></td>	
				</tr>
				
			</sf:form>
		</c:forEach>
	</table>

</body>
</html>