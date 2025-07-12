<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" import="java.util.ArrayList, CapaEntidad.carrito"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Suprimir</title>
	</head>
<body>
	<% 
		String id = request.getParameter("id");
		ArrayList<carrito> Lista;
		HttpSession MiSesion = request.getSession();
		// Consultar si existe en "cesto" en la sesion del proyecto
		if(MiSesion.getAttribute("cesto") != null){
			 // Cargar la "Lista" con los elementos del "cesto"
			 Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
			 // Recorrer la lista para buscar y eliminar el producto
			 for(carrito item:Lista){
				 if(item.getIdProducto().equals(id)){
					 Lista.remove(item);	// Remover el producto buscado
					 break;
				 }
			 }
			// Actualizar el cesto en la sesion del proyecto
			 MiSesion.setAttribute("cesto", Lista);
		}
		response.sendRedirect("cesto?txtcan=0");
	%>
</body>
</html>