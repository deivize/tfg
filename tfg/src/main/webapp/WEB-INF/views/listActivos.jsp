<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				
			</tr>

		</c:forEach>

	</table>

</body>
</html>