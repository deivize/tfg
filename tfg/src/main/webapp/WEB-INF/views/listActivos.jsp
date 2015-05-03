<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<html>
<head>
<title>Lista de activos</title>



</head>

<body>
	<h3>Lista de activos</h3>

	<table border="1">

		<c:forEach var="activo" items="${activos}" varStatus="status">

			<tr>
				<td>${activo.idActivo}</td>
				<td>${activo.nombre}</td>
				<c:url var="verRecorrido" value="verRecorrido">
					<c:param name="id" value="${activo.idActivo}"/>
				</c:url>
				<td><a href="<c:out value="${verRecorrido}"/>">Ver Recorrido</a></td>
			</tr>

		</c:forEach>

	</table>
	
	
	
	

</body>
</html>