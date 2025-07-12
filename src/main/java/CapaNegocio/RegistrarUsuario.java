package CapaNegocio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CapaDatos.BDCarrito;

@WebServlet("/RegistrarUsuario")
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String idUsuario = request.getParameter("idUsuario");
		String nombreUsuario = request.getParameter("nombreUsuario");
		String contrasena = request.getParameter("contrasena");
		String apellidos = request.getParameter("apellidos");
		String direccion = request.getParameter("direccion");
		String fechaNacimiento = request.getParameter("fechaNacimiento");
		String correo = request.getParameter("correo");

		CapaEntidad.Clientes nuevoCliente = new CapaEntidad.Clientes(idUsuario, apellidos, nombreUsuario, direccion,
				fechaNacimiento, 'M', correo, contrasena, '1');

		// Registrar usuario en la base de datos
		BDCarrito BDCarrito = new BDCarrito();
		boolean registrado = BDCarrito.RegistrarUsuario(nuevoCliente);

		// Responder al usuario
		response.setContentType("text/html");
		if (registrado) {
			response.sendRedirect("html/identificar.html");
		} else {
			response.getWriter().println("<h1>Error al registrar el usuario.</h1>");
		}
	}
}