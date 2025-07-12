<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CapaEntidad.Productos, CapaNegocio.BSCarrito" %>
<%
    String IdPro = request.getParameter("idpro");
    Productos ObjP = new Productos();
    BSCarrito ObjBS = new BSCarrito();
    ObjP = ObjBS.BuscarProducto(IdPro);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle del Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
          crossorigin="anonymous">
     <link href="../css/estilo1.css" rel="stylesheet"/> 
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">    
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

        .contenedor-detalle {
            margin-top: 50px;
        }

        /* Tarjeta con efecto hover */
        .card-detalle {
            background: rgba(255,255,255,0.1);
            border: none;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            color: #FFF;
        }
        .card-detalle:hover {
            transform: scale(1.03);
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }

        .card-detalle img {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }

        .info-producto {
            margin-top: 20px;
        }

        .info-producto p {
            margin: 5px 0;
        }

        /* Estilo del botón */
        .btn-agregar {
            background: #2B2B2B;
            border: none;
            color: #FFF;
            transition: background 0.3s, transform 0.3s;
        }

        .btn-agregar:hover {
            background: #66FFE1;
            color: #000;
            transform: scale(1.05);
        }

        .btn-volver {
            background: #1F463E;
            border: none;
            color: #FFF;
            transition: background 0.3s, transform 0.3s;
        }

        .btn-volver:hover {
            background: #2DE5B3;
            color: #000;
            transform: scale(1.05);
        }
	</style>

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
    <h1>Carrito de Compras</h1>
    <div class="container contenedor-detalle">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-detalle p-3">
                    <div class="row g-4">
                        <div class="col-md-5">
                            <!-- Imagen del producto -->
                            <img src="../img/<%=ObjP.getImagen() %>" alt="<%=ObjP.getDescripcion() %>" class="img-fluid" />
                        </div>
                        <div class="col-md-7 d-flex flex-column justify-content-center">
                            <div class="info-producto">
                                <p><strong>ID Producto:</strong> <input name="txtid" value="<%=ObjP.getIdProducto() %>" readonly class="form-control-plaintext text-white" /></p>
                                <p><strong>Descripción:</strong> <%=ObjP.getDescripcion() %></p>
                                <p><strong>Precio Unidad:</strong> S/. <%=ObjP.getPrecioUnidad() %></p>
                                <p><strong>Stock Disponible:</strong> <%=ObjP.getStock() %></p>
                                <p><strong>Estado:</strong> <%= (ObjP.getEstado() == '1' ? "DISPONIBLE" : "NO DISPONIBLE") %></p>
                            </div>
                            <form action="../cesto" class="mt-3">
                                <div class="mb-3">
                                    <label for="txtcan" class="form-label">Cantidad a Comprar</label>
                                    <input type="number" name="txtcan" id="txtcan" min="1" class="form-control w-50 d-inline" placeholder="Ingrese cantidad" />
                                </div>
                                <input type="hidden" name="txtid" value="<%=ObjP.getIdProducto() %>">
                               <input type=submit value='Añadir al Carrito' class='btn btn-primary'
                               style="background: linear-gradient(to right, #9924ff, rgb(101, 32, 230), #18ee83);"/>
                            </form>
                            <div class="text-center mt-4">
                                <a href="javascript:history.back()" class="btn btn-volver">Seleccionar Otro Producto</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
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
            <p>&copy; 2024 Game Vortex . Hector Fernando Palacios Romero</p>
        </div>
    </footer>

   
</body>
</html>


