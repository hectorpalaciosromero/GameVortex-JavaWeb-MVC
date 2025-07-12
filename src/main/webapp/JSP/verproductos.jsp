<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="CapaEntidad.Productos, CapaNegocio.BSCarrito, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos por Categoría</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="../css/estilo1.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pjZ21WHhq8Xv4Hjt0MnelS0HTP9sStj7DQeM45sQMltYYBzyi0Um8PyBDyPiFMo/"
            crossorigin="anonymous"></script>
</head>
<body>
    <style>
		h1 {
	            margin-top: 30px;
	            text-align: center;
	            color: #FFF;
	        }
	
	
	  /* Efecto hover en las tarjetas */
	        .tarjeta-producto {
	            transition: transform 0.3s, box-shadow 0.3s;
	        }
	        .tarjeta-producto:hover {
	            transform: scale(1.05);
	            box-shadow: 0 0 15px rgba(0,0,0,0.2);
	        }
	</style>
    <%
        // Obtenemos el ID de la categoría desde el request
        String IdCat = request.getParameter("idcat");
        
        // Obtenemos la lista de productos a través de la capa de negocio
        ArrayList<Productos> miLista = new ArrayList<>();
        BSCarrito ObjBS = new BSCarrito();
        miLista = ObjBS.ListarProductos(IdCat);
    %>
    
     <header class="superior">
            <div class="logo-container">
                <div class="default-spacer"></div>
                <a class="Logo" href="../html/inicio.html">
                    <img src="../imagenHtml/Game Vortex.png" alt="Logo" />
                </a>
            </div>
            <nav>
                <ul class="menu-horizontal">
                    <li>
                        <a href="../JSP/index.jsp">Juegos</a>
                    </li>
                    <li>
                        <a href="#">Eventos</a>
                        <ul class="menu-vertical">
                            <li>
                                <a href="../html/Torneos.html">Torneos</a>
                            </li>
                            <li>
                                <a href="../html/Game-Awards.html"
                                    >Game Awards</a
                                >
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="../html/Desarrollador.html">Desarrollador</a>
                    </li>
                </ul>
            </nav>
            <div class="search">
            	<img alt="" src="../imagenHtml/mando.png">
                <input type="search" placeholder="Buscar..." />
            </div>
            <a class="car" href="../JSP/index.jsp"> <i class="fas fa-shopping-cart"></i>
            </a>
        </header>

    
    <h1 class="text-center mt-4">Carrito de Compras - Productos</h1>

    <!-- Contenedor principal de productos -->
    <div class="container mt-5">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
            <%
                // Recorremos la lista de productos para mostrar cada uno en una tarjeta
                for(Productos p : miLista) {
                    // Creamos el enlace al detalle del producto
                    String linkDetalle = "../JSP/verdetalle.jsp?idpro=" + p.getIdProducto();
            %>
            <div class="col">
                <div class="card tarjeta-producto h-100 text-center"
                style="width: 400px; background: transparent; border: 2px solid rgba(255, 255, 255, .2); backdrop-filter: blur(20px); 
                box-shadow: 0 0 10px rgba(255, 255, 255, .2); color: #fff; border-radius: 10px;">
                    <!-- Imagen del producto -->
                    <img src="../img/<%=p.getImagen()%>" class="card-img-top" alt="<%=p.getDescripcion()%>" 
                         style="width:100%; height:400px; ">
                    <div class="card-body">
                        <!-- Descripción del producto -->
                        <h5 class="card-title"><%=p.getDescripcion() %></h5>
                        <p class="card-text">
                            <b>ID:</b> <%=p.getIdProducto()%><br>
                            <b>Precio:</b> S/. <%=p.getPrecioUnidad()%><br>
                            <b>Stock:</b> <%=p.getStock()%>
                        </p>
                        <!-- Enlace al detalle -->
                        <a href="<%= linkDetalle %>" class="btn btn-primary mt-2" style="background:linear-gradient(to right, #9924ff, rgb(101, 32, 230), #18ee83); 
                        border: none; color: white;">Ver Detalle</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- Enlace para volver a seleccionar otra categoría -->
    <p class="text-center mt-4">
        <a href="../JSP/index.jsp" class="btn btn-success">Seleccionar Otra Categoría</a>
    </p>
    
    <footer>
        <div class="container">
            <div class="footer-content">
                <h3>Contáctame</h3>
                <p>Email: hectorpalaciosromero1@gmail.com</p>
                <p>Celular: +51 912207735</p>
                <p>Dirección: Calle Los Cisnes 501, San Isidro, Lima, Perú</p>
            </div>
            <div class="footer-content">
                <h3>Links Rápidos</h3>
                 <ul class="list">
                    <li><a href="">Inicio</a></li>
                    <li><a href="">About</a></li>
                    <li><a href="">Servicos</a></li>
                    <li><a href="">Productos</a></li>
                    <li><a href="">Contacto</a></li>
                 </ul>
            </div>
            <div class="footer-content">
                <h3>Sígueme</h3>
                <ul class="social-icons">
                 <li><a href=""><i class="fab fa-facebook"></i></a></li>
                 <li><a href=""><i class="fab fa-twitter"></i></a></li>
                 <li><a href=""><i class="fab fa-instagram"></i></a></li>
                </ul>
                </div>
        </div>
        <div class="bottom-bar">
            <p>&copy; 2024 Game Vortex . Hector Palacios Romero</p>
        </div>
    </footer>
</body>
</html>