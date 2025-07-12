<%@page session="true" %>
<%
    // Recuperar la sesion actual
    HttpSession MiSesion = request.getSession();
    // Eliminar el valor de cesto de la sesion actual
    MiSesion.removeAttribute("cesto");
    MiSesion.setAttribute("numarticulos", 0);
    MiSesion.setAttribute("total", 0.0);
    // Redireccionar a la pagina principal
    response.sendRedirect("index.jsp");
%>    
