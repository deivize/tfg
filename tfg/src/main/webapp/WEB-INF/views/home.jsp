<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
	<script src="http://threejs.org/build/three.min.js"></script>
<%-- 	<script src="../resources/js/raphael.js" type="text/javascript"></script> --%>
	
<%-- 	<script type="text/javascript" src="script_home.js"></script> --%>
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/css_home.css"> -->
<s:url value="/resources/css/cssMenu.css" var="menuCss" />
<s:url value="/resources/css/table.css" var="tableCss"/>
<s:url value="/resources/css/bootstrap.min.css" var="bootstrapMin"/>
<s:url value="/resources/css/navbar.css" var="navbar"/>
<s:url value="/resources/images/RFID-Tag.jpg" var="rfidTag"/>
<s:url value="/resources/images/menu_button.png" var="menu_button"/>
<s:url value="/resources/js/tipsy.js" var="tipsy"/>
<s:url value="/resources/js/menu.js" var="menuJs"/>
<s:url value="/resources/js/bootstrap.min.js" var="bootstrapJs"/>
<link rel="stylesheet" type="text/css" href="${menuCss}"/>
<link rel="stylesheet" type="text/css" href="${tableCss}"/>
<link rel="stylesheet" type="text/css" href="${bootstrapMin}"/>
<link rel="stylesheet" type="text/css" href="${navbar}"/>
<script src="${tipsy}" type="text/javascript"></script>
<script src="${menuJs}" type="text/javascript"></script>
<script src="${bootstrapJs}" type="text/javascript"></script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css"> 

body{
	background-color: white;	
/* 	background: grey; */
/*   	background: linear-gradient(grey, orange); */

}



#content{
	margin-left:20%;
}

#navbar{
	float: left;
	width:20%;
}

#container{
	width:100%;
	height:100%;
	margin-left:auto;
	margin-right:auto;
}


#footer{
	clear:both;
}

#header{
	text-align: center;
}

#notificaciones{
	width:40%;
}

.menu{
	position: relative;
}


.mapa{
	float:left
}

.tabla_notificaciones{
	float:left;
}

#cssmenu{
	display: none;
}

#menu_button{
	cursor: pointer;
}

.notificaciones{
	width: 40%;
/* 	overflow-x: hidden; */
}

</style> 

<title>Home Page</title>
<script type="text/javascript">
	
function addLabel(){
	
	for(k=1;k<=3;k++){
		var lector=document.getElementById("lector"+k);
		$(lector).tipsy({ 
	        gravity: 'w', 
	        html: true,
	        title: function() {
	          return '<span>' +this.getAttribute("name")+'</span>'; 
	        }
		});
		
	}
	
}
	

$(function() {
	  var menuVisible = false;
	  $('#menu_button').click(function() {
	    if (menuVisible) {
	      $('#cssmenu').css({'display':'none'});
	      menuVisible = false;
	      return;
	    }
	    $('#cssmenu').css({'display':'block'});
	    menuVisible = true;
	  });
	});
	
	
</script>
</head>

<body>
	<div id="container">
		<div id="header"></div>
<!-- 		<div id="navbar"> -->
			
<%-- 			<img id="menu_button" src="${menu_button}" width="40"> --%>
			
<!-- 			<div id="cssmenu" class="menu"> -->
<!-- 				<ul> -->
<%-- 					<li class='active has-sub'><a href='#'><span>Activos</span></a> --%>
<!-- 						<ul> -->
<%-- 							<li><a class="home_link" href="<s:url value="/activos/listactivos"/>">Ver lista de activos</a></li> --%>
<%-- 							<li><a class="home_link" href="<s:url value="/activos/nuevoactivo"/>">Crear nuevo activo</a></li> --%>
<%-- 							<li><a class="home_link" href="<s:url value="/activos/buscaractivos"/>">Buscar activos</a></li> --%>
<%-- 							<li class="last"><a class="home_link" href="<s:url value="/activos/borraractivo"/>">Borrar activos</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
<%-- 					<li class='has-sub'><a href='#'><span>Lectores</span></a> --%>
<!-- 						<ul> -->
<%-- 							<li><a class="home_link" href="<s:url value="/lectores/buscarlectores"/>">Buscar lectores</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
<%-- 					<li class='has-sub'><a href='#'><span>Localizaciones</span></a> --%>
<!-- 						<ul> -->
<%-- 							<li><a class="home_link" href="<s:url value="#"/>">Buscar localizaciones</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
<!-- 					<li><a class="home_link" -->
<%-- 						href="<s:url value="/mapa3d"/>">Ver mapa 3D</a></li> --%>
					
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="nav-side-menu">
			<div class="brand">Menu</div>
			<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
				data-target="#menu-content"></i>

			<div class="menu-list">

				<ul id="menu-content" class="menu-content collapse out">

					<li data-toggle="collapse" data-target="#activos"
						class="collapsed active"><a href="#"><i
							class="fa fa-lg"></i> Activos <span class="arrow"></span></a>
					</li>
					<ul class="sub-menu collapse" id="activos">
						<li class="active"><a href="<s:url value="/activos/listactivos"/>">Lista de activos</a></li>
						<li><a href="<s:url value="/activos/nuevoactivo"/>">Crear nuevo activo</a></li>
						<li><a href="<s:url value="/activos/buscaractivos"/>">Buscar activos</a></li>
						<li><a href="<s:url value="/activos/borraractivo"/>">Borrar activos</a></li>
					</ul>


					<li data-toggle="collapse" data-target="#lectores" class="collapsed">
						<a href="#"><i class="fa fa-lg"></i> Lectores <span
							class="arrow"></span></a>
					</li>
					<ul class="sub-menu collapse" id="lectores">
						<li class="active"><a href="<s:url value="/lectores/buscarlectores"/>">Buscar lectores</a></li>
					</ul>


					<li data-toggle="collapse" data-target="#localizaciones" class="collapsed">
						<a href="#"><i class="fa fa-lg"></i> Localizaciones <span
							class="arrow"></span></a>
					</li>
					<ul class="sub-menu collapse" id="localizaciones">
						<li class="active"><a href="<s:url value="#"/>">Buscar localizaciones</a></li>
					</ul>
					
					<li data-toggle="collapse" data-target="#mapa" class="collapsed">
						<a href="#"><i class="fa fa-lg"></i> Cargar nuevo mapa <span
							class="arrow"></span></a>
					</li>
					<ul class="sub-menu collapse" id="mapa">
						<sf:form method="POST" commandName="file"
							enctype="multipart/form-data">
									        Seleccione un archivo:
									        <input type="file" name="file" />
							<input type="submit" class="btn btn-primary btn-sm" value="Cargar" />
							<sf:errors path="file" cssStyle="color: #ff0000;" />
						</sf:form>
					</ul>
				</ul>
			</div>
		</div>

		<div id="content">
			<div id="tagRfid" class="tag">

				<img src="${rfidTag}" />

			</div>

			
			<div class="table-responsive notificaciones">
				<table class="table table-hover table-striped">
					<thead>
						<tr>
							<td>Nombre</td>
							<td>Categoria</td>
							<td>Fecha Caducidad</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="alerta" items="${alertas}" varStatus="status">
							<tr>
								<td>${alerta.nombre}</td>
								<td>${alerta.categoria}</td>
								<td>${alerta.fechaCaducidad}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
<%-- 			<sf:form method="POST" commandName="file"  enctype="multipart/form-data"> --%>
<!-- 			        Upload your file please: -->
<!-- 			        <input type="file" name="file" /> -->
<!-- 			        <input type="submit" value="upload" /> -->
<%-- 			        <sf:errors path="file" cssStyle="color: #ff0000;" /> --%>
<%-- 			</sf:form> --%>


		</div>

	</div>
	
	
	
	<div id="footer"></div>
</body>

</html>