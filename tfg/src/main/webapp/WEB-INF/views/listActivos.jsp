<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Lista de activos</title>
</head>

<body>
	<h3>Lista de activos</h3>

	<table border="1">

		<c:forEach var="activos" items="${activos}" varStatus="status">

			<tr>
				<td>${activos.nombre}</td>
			</tr>

		</c:forEach>

	</table>

</body>
</html>