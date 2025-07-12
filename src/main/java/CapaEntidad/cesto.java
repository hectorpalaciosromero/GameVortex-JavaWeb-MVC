package CapaEntidad;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import CapaDatos.BDCarrito;
import CapaEntidad.Productos;
import CapaEntidad.carrito;

public class cesto extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// Datos de entrada
		String IdPro = request.getParameter("txtid");
		String txtcan = request.getParameter("txtcan");
		int Cant = (txtcan != null && !txtcan.isEmpty()) ? Integer.parseInt(txtcan) : 0;
		boolean productoAgregado = (Cant > 0 && IdPro != null);

		out.println("<jsp:include page=\"header.jsp\" />");
		out.println("<!DOCTYPE html>");
		out.println("<html lang='es'>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<meta name='viewport' content='width=device-width, initial-scale=1'>");
		out.println("<title>Carrito de Compras</title>");

		// CSS de Bootstrap
		out.println(
				"<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet' crossorigin='anonymous'>");
		// Fuente tipo Epic Games style (Montserrat)
		out.println(
				"<link href='https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap' rel='stylesheet'>");
		out.println("<link href='css/cesto.css' rel='stylesheet'>");
		out.println(
				"<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css\">");

		// Estilos personalizados
		out.println("<style>");
		out.println("h1 { text-align: center; margin: 20px 0; font-weight: 700; color: white; }");

		// Contenedor principal
		out.println(".contenedor-carrito {");
		out.println("  max-width: 1200px;");
		out.println("  margin: 0 auto;");
		out.println("  padding: 20px;");
		out.println("  animation: fadeIn 0.8s ease-in-out;");
		out.println("}");

		// Item del carrito
		out.println(".item-carrito {");
		out.println("  background: #1E1E1E;");
		out.println("  border-radius: 8px;");
		out.println("  padding: 20px;");
		out.println("  margin-bottom: 15px;");
		out.println("  transition: transform 0.3s, box-shadow 0.3s;");
		out.println("  position: relative;");
		out.println("  display: grid;");
		out.println("  grid-template-columns: 100px 1fr auto;");
		out.println("  grid-gap: 20px;");
		out.println("  align-items: center;");
		out.println("}");

		out.println(".item-carrito:hover {");
		out.println("  transform: scale(1.01);");
		out.println("  box-shadow: 0 0 15px rgba(0,0,0,0.5);");
		out.println("}");

		// Imagen del producto
		out.println(".item-imagen img {");
		out.println("  width: 200px;");
		out.println("  height: 180px;");
		out.println("  border-radius: 5px;");
		out.println("  transition: transform 0.3s ease, rotate 0.3s ease;");
		out.println("  margin-left: 10px;");
		out.println("}");
		out.println(".item-imagen img:hover {");
		out.println("  transform: scale(1.1) rotate(2deg);");
		out.println("}");

		// Información del producto
		out.println(".item-info {");
		out.println("  display: grid;");
		out.println("  grid-template-rows: auto auto auto auto;");
		out.println("  grid-template-columns: 1fr 1fr;");
		out.println("  gap: 5px;");
		out.println("}");

		out.println(".item-campo {");
		out.println("  font-size: 0.9rem;");
		out.println("  color: #FFFF;");
		out.println("  position: relative;");
		out.println("  left: 150px;");
		out.println("}");

		out.println(".item-valor {");
		out.println("  font-size: 0.9rem;");
		out.println("  font-weight: 700;");
		out.println("  color: #FFFFFF;");
		out.println("}");

		// Opciones y precio
		out.println(".item-precio-cantidad {");
		out.println("  display: flex;");
		out.println("  flex-direction: column;");
		out.println("  align-items: flex-end;");
		out.println("}");

		out.println(".item-precio-cantidad .item-campo {");
		out.println("  color: #ffff;");
		out.println("  position: relative;");
		out.println("  left: 10px;");
		out.println("}");

		out.println(".item-precio {");
		out.println("  font-weight: 700;");
		out.println("  font-size: 1rem;");
		out.println("  color: #FFFFFF;");
		out.println("  margin-top: 5px;");
		out.println("}");

		out.println(".item-subtotal {");
		out.println("  font-size: 0.9rem;");
		out.println("  color: #BBBBBB;");
		out.println("  margin: 5px 0;");
		out.println("}");

		// Botón suprimir
		out.println(".btn-suprimir {");
		out.println("  background: none;");
		out.println("  border: none;");
		out.println("  color: #FF4C4C;");
		out.println("  font-weight: 700;");
		out.println("  cursor: pointer;");
		out.println("  transition: color 0.3s;");
		out.println("  font-size: 1rem;");
		out.println("  margin-top: 10px;");
		out.println("}");
		out.println(".btn-suprimir:hover {");
		out.println("  color: #FF7E7E;");
		out.println("}");

		// Barra inferior de totales
		out.println(".barra-totales {");
		out.println("  margin-top: 159px;");
		out.println("  width: 100%;");
		out.println("  background: #1E1E1E;");
		out.println("  padding: 20px;");
		out.println("  display: flex;");
		out.println("  justify-content: space-between;");
		out.println("  align-items: center;");
		out.println("  box-shadow: 0 -2px 10px rgba(0,0,0,0.5);");
		out.println("}");

		out.println(".barra-totales h4 {");
		out.println("  margin: 0;");
		out.println("  font-weight: 700;");
		out.println("  color: white;");
		out.println("}");

		out.println(".btn-accion {");
		out.println("  background: #2B2B2B;");
		out.println("  border: none;");
		out.println("  padding: 10px 20px;");
		out.println("  color: #FFF;");
		out.println("  font-weight: 700;");
		out.println("  margin-left: 10px;");
		out.println("  transition: background 0.3s, transform 0.3s;");
		out.println("  border-radius: 5px;");
		out.println("  text-decoration: none;");
		out.println("}");

		out.println(".btn-accion:hover {");
		out.println("  background: #9C6CFF;");
		out.println("  color: #000;");
		out.println("  transform: scale(1.05);");
		out.println("}");

		// Toast (mensaje flotante)
		out.println(".toast-container {");
		out.println("  top: 20px;");
		out.println("  right: 20px;");
		out.println("  z-index: 9999;");
		out.println("}");

		out.println(".toast-mensaje {");
		out.println("  background: #333;");
		out.println("  color: #FFF;");
		out.println("  padding: 15px 20px;");
		out.println("  border-radius: 5px;");
		out.println("  box-shadow: 0 0 10px rgba(0,0,0,0.5);");
		out.println("  animation: slideIn 0.5s forwards;");
		out.println("  font-weight: 700;");
		out.println("}");

		// Animaciones
		out.println("@keyframes fadeIn {");
		out.println("  0% {opacity: 0; transform: translateY(-10px);}");
		out.println("  100% {opacity: 1; transform: translateY(0);}");
		out.println("}");
		out.println("@keyframes slideIn {");
		out.println("  0% {opacity: 0; transform: translateX(50px);}");
		out.println("  100% {opacity: 1; transform: translateX(0);}");
		out.println("}");

		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		out.println("<header class='superior'>");
		out.println("    <div class='logo-container'>");
		out.println("        <div class='default-spacer'></div>");
		String contextPath = request.getContextPath();
		out.println("        <a class='Logo' href='" + contextPath + "/html/inicio.html'>");
		out.println("            <img src='imagenHtml/Game Vortex.png' alt='Logo' />");
		out.println("        </a>");
		out.println("    </div>");
		out.println("    <nav>");
		out.println("        <ul class='menu-horizontal'>");
		out.println("            <li>");
		out.println("                <a href='JSP/index.jsp'>Juegos</a>");
		out.println("            </li>");
		out.println("            <li>");
		out.println("                <a href='#'>Eventos</a>");
		out.println("                <ul class='menu-vertical'>");
		out.println("                    <li>");
		out.println("                        <a href='html/Torneos.html'>Torneos</a>");
		out.println("                    </li>");
		out.println("                    <li>");
		out.println("                        <a href='html/Game-Awards.html'>Game Awards</a>");
		out.println("                    </li>");
		out.println("                </ul>");
		out.println("            </li>");
		out.println("            <li>");
		out.println("                <a href='html/Desarrollador.html'>Desarrollador</a>");
		out.println("            </li>");
		out.println("        </ul>");
		out.println("    </nav>");
		out.println("    <div class='search'>");
		out.println("        <img alt='' src='imagenHtml/mando.png'>");
		out.println("        <input type='search' placeholder='Buscar...' />");
		out.println("    </div>");
		out.println("    <a class='car' href=''>");
		out.println("        <i class='fas fa-shopping-cart'></i>");
		out.println("    </a>");
		out.println("</header>");
		out.println("<h1>Tu Carrito</h1>");
		out.println("<div class='contenedor-carrito'>");

		try {
			BDCarrito ObjBD = new BDCarrito();
			HttpSession MiSesion = request.getSession();
			ArrayList<carrito> Lista = (ArrayList<carrito>) MiSesion.getAttribute("cesto");

			if (Lista == null) {
				Lista = new ArrayList<carrito>();
				if (Cant != 0 && IdPro != null) {
					Lista.add(new carrito(IdPro, Cant));
				}
			} else {
				if (Cant != 0 && IdPro != null) {
					boolean encontrado = false;
					for (int i = 0; i < Lista.size(); i++) {
						carrito Obj = Lista.get(i);
						if (Obj.getIdProducto().equalsIgnoreCase(IdPro)) {
							encontrado = true;
							Obj.setCantidad(Obj.getCantidad() + Cant);
							Lista.set(i, Obj);
							break;
						}
					}
					if (!encontrado) {
						Lista.add(new carrito(IdPro, Cant));
					}
				}
			}

			if (Cant != 0 && IdPro != null)
				MiSesion.setAttribute("cesto", Lista);

			double Total = 0;
			int i;

			for (i = 0; i < Lista.size(); i++) {
				Productos Obj = ObjBD.BuscarProducto(Lista.get(i).getIdProducto());
				double Precio = Obj.getPrecioUnidad();
				int Cantidad = Lista.get(i).getCantidad();
				double SubTotal = Precio * Cantidad;
				Total += SubTotal;

				String enlaceSuprimir = "suprimi.jsp?id=" + Obj.getIdProducto();

				// Mostrar item
				out.println("<div class='item-carrito'>");
				out.println("  <div class='item-imagen'>");
				out.println("    <img src='img/" + Obj.getImagen() + "' alt='" + Obj.getDescripcion() + "'>");
				out.println("  </div>");
				out.println("  <div class='item-info'>");
				out.println("    <div class='item-campo'>Item</div><div class='item-valor'>" + (i + 1) + "</div>");
				out.println("    <div class='item-campo'>ID Producto</div><div class='item-valor'>"
						+ Obj.getIdProducto() + "</div>");
				out.println("    <div class='item-campo'>Descripción</div><div class='item-valor'>"
						+ Obj.getDescripcion() + "</div>");
				out.println("    <div class='item-campo'>Precio</div><div class='item-valor'>S/. " + Precio + "</div>");
				out.println("    <div class='item-campo'>Cantidad</div><div class='item-valor'>" + Cantidad + "</div>");
				out.println("    <div class='item-campo'>Sub-Total</div><div class='item-valor'>S/. " + SubTotal
						+ "</div>");
				out.println("  </div>");
				out.println("  <div class='item-precio-cantidad'>");
				out.println("    <div class='item-campo'>Opciones</div>");
				out.println("    <form action='" + enlaceSuprimir + "' method='post'>");
				out.println("      <button type='submit' class='btn-suprimir'>X</button>");
				out.println("    </form>");
				out.println("  </div>");
				out.println("</div>");
			}

			MiSesion.setAttribute("numarticulos", i);
			MiSesion.setAttribute("total", Total);

			out.println("</div>"); // Fin contenedor-carrito

			// Barra inferior de totales y acciones
			String enlace1 = "<a href='JSP/index.jsp' class='btn-accion'>Seguir Comprando</a>";
			String enlace2 = "<a href='JSP/identificar.jsp' class='btn-accion'>Pagar</a>";
			String enlace3 = "<a href='JSP/cancelar.jsp' class='btn-accion'>Cancelar Compra</a>";

			out.println("<div class='barra-totales'>");
			out.println("  <h4>Total: S/. " + Total + "</h4>");
			out.println("  <div>");
			out.println(enlace1);
			out.println(enlace2);
			out.println(enlace3);
			out.println("  </div>");
			out.println("</div>");
			// Footer
			out.println("<footer>");
			out.println("    <div class=\"container\">");
			out.println("        <div class=\"footer-content\">");
			out.println("            <h3>Contáctame</h3>");
			out.println("            <p>Email: hectorpalaciosromero1@gmail.com</p>");
			out.println("            <p>Celular: +51 912207735</p>");
			out.println("            <p>Dirección: Calle Los Cisnes 501, San Isidro, Lima, Perú</p>");
			out.println("        </div>");
			out.println("        <div class=\"footer-content\">");
			out.println("            <h3>Links Rápidos</h3>");
			out.println("            <ul class=\"list\">");
			out.println("                <li><a href=\"\">Inicio</a></li>");
			out.println("                <li><a href=\"\">About</a></li>");
			out.println("                <li><a href=\"\">Servicios</a></li>");
			out.println("                <li><a href=\"\">Productos</a></li>");
			out.println("                <li><a href=\"\">Contacto</a></li>");
			out.println("            </ul>");
			out.println("        </div>");
			out.println("        <div class=\"footer-content\">");
			out.println("            <h3>Contactame</h3>");
			out.println("            <ul class=\"social-icons\">");
			out.println("                <li><a href=\"\"><i class=\"fab fa-facebook\"></i></a></li>");
			out.println("                <li><a href=\"\"><i class=\"fab fa-twitter\"></i></a></li>");
			out.println("                <li><a href=\"\"><i class=\"fab fa-instagram\"></i></a></li>");
			out.println("            </ul>");
			out.println("        </div>");
			out.println("    </div>");
			out.println("    <div class=\"bottom-bar\">");
			out.println("        <p>&copy; 2024 Game Vortex . Hector Fernando Palacios Romero</p>");
			out.println("    </div>");

			// Toast si se agregó producto
			if (productoAgregado) {
				out.println("<div class='toast-container'>");
				out.println("<div class='toast-mensaje'>Producto agregado al carrito</div>");
				out.println("</div>");
			}

		} catch (Exception e) {
			System.out.println("* ERROR:" + e.getMessage());
		} finally {
			out.println(
					"<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js' crossorigin='anonymous'></script>");
			out.println("<script>");
			out.println("document.addEventListener('DOMContentLoaded', function() {");
			out.println("  const toast = document.querySelector('.toast-mensaje');");
			out.println("  if (toast) {");
			out.println("    setTimeout(() => {");
			out.println("      toast.style.transition = 'opacity 0.5s';");
			out.println("      toast.style.opacity = '0';");
			out.println("      setTimeout(() => toast.remove(), 600);");
			out.println("    }, 3000);");
			out.println("  }");
			out.println("});");
			out.println("</script>");

			out.println("</body>");
			out.println("</html>");
			out.close();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Carrito con campos Item, ID Producto, Descripción, Imagen, Precio, Cantidad, Sub-Total, Opciones.";
	}
}