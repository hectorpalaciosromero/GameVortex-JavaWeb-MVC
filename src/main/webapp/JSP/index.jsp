<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"
	import="CapaEntidad.Categorias, CapaNegocio.BSCarrito, java.util.ArrayList"%>
<jsp:include page="header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="../css/estilo1.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pjZ21WHhq8Xv4Hjt0MnelS0HTP9sStj7DQeM45sQMltYYBzyi0Um8PyBDyPiFMo/"
	crossorigin="anonymous"></script>
</head>
<body>
	<style>
h1, h3 {
	color: white;
	text-align: center;
	margin-top: 20px;
}

/* Estilo para las tarjetas */
.tarjeta-categoria {
	background: rgba(255, 255, 255, 0.1);
	border: none;
	border-radius: 10px;
	overflow: hidden;
	transition: transform 0.3s, box-shadow 0.3s;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	color: white;
}

.tarjeta-categoria:hover {
	transform: scale(1.05);
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
}

/* Imagen de la categoría */
.tarjeta-categoria img {
	width: 100%;
	object-fit: cover;
}

/* Contenido de la tarjeta */
.tarjeta-categoria .card-body {
	position: relative;
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.tarjeta-categoria h5 {
	margin: 10px 0;
}

.tarjeta-categoria p {
	margin: 0;
	color: #CCE;
}

/* Botón */
.btn-personalizado {
	background: linear-gradient(to right, #9924ff, rgb(101, 32, 230),
		#18ee83);
	border: none;
	color: #FFF;
	transition: background 0.3s;
}

.btn-personalizado:hover {
	background: #66FFE1;
	color: #000;
}

/* Contenedor de las tarjetas */
.contenedor-tarjetas {
	margin-top: 40px;
}
</style>
	<%
	ArrayList<Categorias> miLista = new ArrayList<>();
	BSCarrito ObjBS = new BSCarrito();
	miLista = ObjBS.ListarCategorias();
	int col = 0;
	//Recuperando los valores de "numarticulos" y "total"
	HttpSession MiSesion = request.getSession();
	int numart;
	double total;
	if (MiSesion.getAttribute("numarticulos") == null) {
		numart = 0;
		total = 0.0;

	} else {
		numart = (int) MiSesion.getAttribute("numarticulos");
		total = (double) MiSesion.getAttribute("total");

	}
	%>

	<section class="seccion1">
		<h1>Carrito de Compras</h1>
		<h3>
			Has adquirido
			<%=numart%>
			artículos por un total de S/.
			<%=total%></h3>

		<div class="container contenedor-tarjetas">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
				<%
				for (Categorias c : miLista) {
					String link = "verproductos.jsp?idcat=" + c.getIdCategoria();
				%>
				<div class="col">
					<div class="card tarjeta-categoria">
						<img src="../img/<%=c.getImagen()%>"
							alt="<%=c.getDescripcion()%>" />
						<div class="card-body text-center">
							<h5 class="card-title"><%=c.getDescripcion()%></h5>
							<p>
								ID:
								<%=c.getIdCategoria()%></p>
							<a href="<%=link%>" class="btn btn-personalizado mt-3">Ver
								Productos</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>


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