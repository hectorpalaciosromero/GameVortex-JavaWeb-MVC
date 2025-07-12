<%@page import="CapaEntidad.*"%>
<%@page import="CapaNegocio.BSCarrito"%>
<%@page import="CapaDatos.BDCarrito"%>
<%@page session="true" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // ================================
    // Lógica de Autenticación y Cesto
    // ================================
    BSCarrito ObjBD = new BSCarrito();	
    Clientes ObjC = new Clientes();
    String cadenaFecha = "";
    HttpSession MiSesion = request.getSession();
    ArrayList<carrito> Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");

    boolean accesoValido = false;

    try {
        // Recuperar valores del formulario (txtid y txtpwd)
        String IdUsuario = request.getParameter("txtid");
        String Password = request.getParameter("txtpwd");

        if(IdUsuario != null && Password != null && ObjBD.VerificaUsuario(IdUsuario, Password)) {
            // Usuario válido
            ObjC = ObjBD.InfoUsuario(IdUsuario);

            // Si no existe la lista del cesto, crearla
            if (Lista == null) {
                Lista = new ArrayList<carrito>();
            }
            
            // Obtener fecha actual
            Date fechaActual = new Date();
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            cadenaFecha = formato.format(fechaActual);

            // Guardar datos del cliente en sesión
            MiSesion.setAttribute("IdCliente", IdUsuario);
            MiSesion.setAttribute("Fecha", cadenaFecha);
            MiSesion.setAttribute("cesto", Lista);

            accesoValido = true;
        } if(IdUsuario != null && Password != null && ObjBD.VerificaUsuario(IdUsuario, Password)) {
            accesoValido = true;
        } else {            
            response.sendRedirect("../JSP/identificar.jsp?error=true");
        }
    } catch(Exception ex) {
        response.sendRedirect("../JSP/identificar.jsp?error=exception");
    }
%>

<% if (accesoValido) { %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cesto después de Identificar</title>
    <link href="../css/cesto.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
	
    <style>

        h3 {
            margin-top: 20px;
            font-weight: 700;
            text-align: center;
            color: #FFF;
        }

        hr {
            border: 1px solid #FFF;
        }

        .contenedor-carrito {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            animation: fadeIn 0.8s ease-in-out;
        }

        .item-carrito {
            background: #1E1E1E;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
            display: grid;
            grid-template-columns: 100px 1fr auto;
            grid-gap: 20px;
            align-items: center;
        }

        .item-carrito:hover {
            transform: scale(1.01);
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
        }

        .item-imagen img {
            width: 100%;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
            transition: transform 0.3s ease, rotate 0.3s ease;
        }

        .item-imagen img:hover {
            transform: scale(1.1) rotate(2deg);
        }

        .item-info {
            display: grid;
            grid-template-rows: auto auto auto auto;
            grid-template-columns: 1fr 1fr;
            gap: 5px;
        }

        .item-campo {
            font-size: 0.9rem;
            color: #AAAAAA;
        }

        .item-valor {
            font-size: 0.9rem;
            font-weight: 700;
            color: #FFFFFF;
        }

        .item-precio-cantidad {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .item-precio-cantidad .item-campo {
            color: #AAAAAA;
        }

        .btn-suprimir {
            background: none;
            border: none;
            color: #FF4C4C;
            font-weight: 700;
            cursor: pointer;
            transition: color 0.3s;
            font-size: 1rem;
            margin-top: 10px;
        }

        .btn-suprimir:hover {
            color: #FF7E7E;
        }

        .barra-totales {
            margin-top: 20px;
            width: 100%;
            background: #1E1E1E;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.5);
            border-radius: 8px;
        }

        .barra-totales h4 {
            margin: 0;
            font-weight: 700;
            color: white;
        }

        .btn-accion {
            background: #2B2B2B;
            border: none;
            padding: 10px 20px;
            color: #FFF;
            font-weight: 700;
            margin-left: 10px;
            transition: background 0.3s, transform 0.3s;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn-accion:hover {
            background: #9C6CFF;
            color: #000;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

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
     	
    <div class="container mt-4">
        <h3>DATOS DEL USUARIO: <%=ObjC.getApellidos()%>, <%=ObjC.getNombres()%> | <%=ObjC.getIdCliente()%> | <%=cadenaFecha%></h3>
        <hr />
    </div>

    <div class="contenedor-carrito">
    <%
        BDCarrito ObjDB = new BDCarrito();
        double Total = 0;
        int i;

        for(i = 0; i < Lista.size(); i++){
            Productos ObjP = ObjDB.BuscarProducto(Lista.get(i).getIdProducto());
            double Precio = ObjP.getPrecioUnidad();
            int Cantidad = Lista.get(i).getCantidad();
            double SubTotal = Precio * Cantidad;
            Total += SubTotal;

            String enlaceSuprimir = "suprimi.jsp?id="+ObjP.getIdProducto();

    %>
        <div class="item-carrito">
            <div class="item-imagen">
                <img src="../img/<%=ObjP.getImagen()%>" alt="<%=ObjP.getDescripcion()%>">
            </div>
            <div class="item-info">
                <div class="item-campo">Item</div><div class="item-valor"><%=(i+1)%></div>
                <div class="item-campo">ID Producto</div><div class="item-valor"><%=ObjP.getIdProducto()%></div>
                <div class="item-campo">Descripción</div><div class="item-valor"><%=ObjP.getDescripcion()%></div>
                <div class="item-campo">Precio</div><div class="item-valor">S/. <%=Precio%></div>
                <div class="item-campo">Cantidad</div><div class="item-valor"><%=Cantidad%></div>
                <div class="item-campo">Sub-Total</div><div class="item-valor">S/. <%=SubTotal%></div>
            </div>
            <div class="item-precio-cantidad">
                <div class="item-campo">Opciones</div>
                <form action="<%=enlaceSuprimir%>" method="post">
                    <button type="submit" class="btn-suprimir">X</button>
                </form>
            </div>
        </div>
    <%
        }

        MiSesion.setAttribute("Total", Total);
        MiSesion.setAttribute("numarticulos", i);
    %>

    </div>

    <div class="barra-totales">
        <h4>Total a Pagar: S/. <%=Total%></h4>
        <div>
            <a href="index.jsp" class="btn-accion">Seguir Comprando</a>
            <a href="pagarCompra.jsp" class="btn-accion">Pagar</a>
            <a href="cancelar.jsp" class="btn-accion">Cancelar Compra</a>
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
                    <li><a href="#">About</a></li>
                    <li><a href="#">Servicios</a></li>
                    <li><a href="#">Productos</a></li>
                    <li><a href="#">Contacto</a></li>
                </ul>
            </div>
            <div class="footer-content">
                <h3>Sígueme</h3>
                <ul class="social-icons">
                    <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="bottom-bar">
            <p>&copy; 2024 Game Vortex. Hector Fernando Palacios Romero</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
<% } %>