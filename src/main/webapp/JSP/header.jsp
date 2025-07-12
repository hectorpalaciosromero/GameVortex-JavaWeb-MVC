<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <!-- Meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Enlace al CSS del header -->
    <link href="../css/estilo1.css" rel="stylesheet">

    <!-- Font Awesome para íconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <!-- Otros estilos globales (opcional) -->
    <link href="../css/global.css" rel="stylesheet">
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

</body>
</html>
