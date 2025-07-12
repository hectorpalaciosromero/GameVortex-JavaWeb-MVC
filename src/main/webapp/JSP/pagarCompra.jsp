<%@page session="true" %>
<%@page import="CapaEntidad.*, CapaNegocio.BSCarrito" %>
<%@page import="java.util.ArrayList" %>
<%
    // Recuperar valores de la sesión actual
    HttpSession MiSesion = request.getSession();
    String IdCliente = (String)MiSesion.getAttribute("IdCliente");
    String FechaVenta = (String)MiSesion.getAttribute("Fecha");
    double MontoTotal = (Double)MiSesion.getAttribute("Total");
    ArrayList<carrito> Lista = new ArrayList<carrito>();
    Lista = (ArrayList<carrito>)MiSesion.getAttribute("cesto");
    
    BSCarrito ObjBD = new BSCarrito();
    int filas = ObjBD.NumeroFilas("ventas");
    String IdVenta;

    if(filas == 0){
        IdVenta = "VTA0000001";
    }else{
        IdVenta = "VTA"+String.format("%07d",filas+1);
    }
    
    Ventas ObjV = new Ventas(IdVenta, IdCliente, FechaVenta, MontoTotal, '1');
    ObjBD.InsertarVenta(ObjV);

    for(carrito item : Lista){
        String IdPro = item.getIdProducto();
        Productos ObjP = new Productos();
        ObjP = ObjBD.BuscarProducto(IdPro);
        Detalle ObjD = new Detalle(IdVenta,IdPro,item.getCantidad(),ObjP.getPrecioUnidad(),'1');
        ObjBD.InsertarDetalle(ObjD);        
    }
    
    MiSesion.removeAttribute("cesto");
    MiSesion.setAttribute("numarticulos", 0);
    MiSesion.setAttribute("total", 0.0);
%>  

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gracias por su Compra</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            height: 100vh;
            background: url('../imagenHtml/videojuegos_1920x1080.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Contenedor con movimiento */
        .container-custom {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            padding: 40px;
            text-align: center;
            animation: fadeIn 1.5s ease-in-out, floating 6s ease-in-out infinite;
        }

        h1 {
            font-size: 3rem;
            font-weight: 700;
            color: #4C4C4C;
            margin-bottom: 20px;
            animation: pulse 2s infinite ease-in-out;
        }

        p {
            color: #6C63FF;
            font-size: 1.3rem;
            margin-bottom: 20px;
            animation: slideIn 1.5s ease-out;
        }

        .img-fluid {
            max-width: 350px;
            margin: 20px 0;
            border-radius: 12px;
            transition: transform 0.5s ease-in-out;
            animation: glow 2s infinite alternate;
        }

        .img-fluid:hover {
            transform: scale(1.1) rotate(5deg);
        }

        a.btn-custom {
            display: inline-block;
            text-decoration: none;
            background: linear-gradient(90deg, #6C63FF, #8E85FF);
            color: #FFFFFF;
            font-weight: 700;
            padding: 12px 30px;
            border-radius: 8px;
            transition: all 0.4s ease-in-out;
            box-shadow: 0 4px 8px rgba(108, 99, 255, 0.5);
            animation: glow 3s infinite alternate;
        }

        a.btn-custom:hover {
            background: linear-gradient(90deg, #5146C8, #6C63FF);
            transform: scale(1.1);
            box-shadow: 0 6px 15px rgba(108, 99, 255, 0.8);
        }

        /* Animaciones */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes floating {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 0.9;
            }
            50% {
                transform: scale(1.05);
                opacity: 1;
            }
            100% {
                transform: scale(1);
                opacity: 0.9;
            }
        }

        @keyframes glow {
            0% {
                box-shadow: 0 0 10px rgba(108, 99, 255, 0.5);
            }
            100% {
                box-shadow: 0 0 20px rgba(108, 99, 255, 0.9);
            }
        }

        @keyframes slideIn {
            0% {
                transform: translateY(30px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="container-custom">
        <h1>¡Gracias por tu compra!</h1>
        <p>Tu pedido se ha registrado correctamente.</p>
        <img src="../imagenHtml/gracias.jpeg" alt="Gracias" class="img-fluid">
        <p>Haga clic en el botón de abajo para regresar a la página principal.</p>
        <a href="../html/inicio.html" class="btn-custom">Volver a la Página Principal</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>