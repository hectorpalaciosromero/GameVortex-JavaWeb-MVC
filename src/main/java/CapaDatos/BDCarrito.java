package CapaDatos;

import java.sql.*;
import java.util.ArrayList;
import CapaEntidad.*;

public class BDCarrito {
	// Conexion con MySQL
	private String Driver = "com.mysql.cj.jdbc.Driver";
	private String URL = "jdbc:mysql://localhost:3306/GameVortex";
	private String Usuario = "root";
	private String Clave = "hectorpalacios";// hectorpalacios
	// Interacción con MySQL
	private Connection Cn;
	private Statement Cmd;
	private CallableStatement Stmt;
	private ResultSet Rs;
	private ArrayList<Categorias> miListaC;
	private ArrayList<Productos> miListaP;

	// Método Constructor
	public BDCarrito() {
		try {
			Class.forName(Driver);
			Cn = DriverManager.getConnection(URL, Usuario, Clave);
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("ERROR:" + e.getMessage());
		}
	}

	// Método para listar las categorias
	public ArrayList<Categorias> ListarCategorias() {
		String SQL = "CALL ListarCategorias()";
		miListaC = new ArrayList<>();
		try {
			Stmt = Cn.prepareCall(SQL);
			Rs = Stmt.executeQuery();
			while (Rs.next()) {
				miListaC.add(new Categorias(Rs.getString("IdCategoria"), Rs.getString("Descripcion"),
						Rs.getString("Imagen"), Rs.getString("Estado").charAt(0)));
			}
			Rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR:" + e.getMessage());
		}
		return miListaC;
	}

	// Método para listar los productos
	public ArrayList<Productos> ListarProductos(String IdCat) {
		String SQL = "CALL ListarProductosXCategoria(?)";
		miListaP = new ArrayList<>();
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, IdCat);
			Rs = Stmt.executeQuery();
			while (Rs.next()) {
				miListaP.add(new Productos(Rs.getString("IdProducto"), Rs.getString("IdCategoria"),
						Rs.getString("Descripcion"), Rs.getDouble("PrecioUnidad"), Rs.getInt("Stock"),
						Rs.getString("Imagen"), Rs.getString("Estado").charAt(0)));
			}
			Rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR:" + e.getMessage());
		}
		return miListaP;
	}

	// Método para registrar un nuevo usuario
	public boolean RegistrarUsuario(Clientes nuevoUsuario) {
		boolean registrado = false;
		String SQL = "CALL RegistrarUsuario(?,?,?,?,?,?,?,?)"; // Procedimiento almacenado
		try {
			this.Stmt = this.Cn.prepareCall(SQL);
			this.Stmt.setString(1, nuevoUsuario.getIdUsuario()); // Usamos getIdUsuario()
			this.Stmt.setString(2, nuevoUsuario.getApellidos()); // Apellidos
			this.Stmt.setString(3, nuevoUsuario.getNombres()); // Nombres
			this.Stmt.setString(4, nuevoUsuario.getDireccion()); // Dirección
			this.Stmt.setString(5, nuevoUsuario.getFechaNacimiento()); // Fecha de nacimiento
			this.Stmt.setString(6, String.valueOf(nuevoUsuario.getSexo())); // Sexo
			this.Stmt.setString(7, nuevoUsuario.getCorreo()); // Correo
			this.Stmt.setString(8, nuevoUsuario.getPassword()); // Contraseña
			this.Stmt.executeUpdate();
			registrado = true; // Registro exitoso
		} catch (SQLException e) {
			System.out.println("***ERROR AL REGISTRAR USUARIO: " + e.getMessage());
		}
		return registrado;
	}

	// Método para retornar la informacion de un producto
	public Productos BuscarProducto(String IdPro) {
		String SQL = "CALL InfoProducto(?)";
		Productos ObjP = null;
		try {
			Stmt = Cn.prepareCall(SQL);
			Stmt.setString(1, IdPro);
			Rs = Stmt.executeQuery();
			if (Rs.next()) {
				ObjP = new Productos(Rs.getString("IdProducto"), Rs.getString("IdCategoria"),
						Rs.getString("Descripcion"), Rs.getDouble("PrecioUnidad"), Rs.getInt("Stock"),
						Rs.getString("Imagen"), Rs.getString("Estado").charAt(0));
			}
			Rs.close();
		} catch (SQLException e) {
			System.out.println("ERROR:" + e.getMessage());
		}
		return ObjP;
	}

	// Validar IdUsuario y Password
	public boolean VerificaUsuario(String IdUsuario, String Password) {
		boolean estado = false;
		String SQL = "SELECT * FROM Usuarios WHERE IdUsuario='" + IdUsuario + "' AND Password='" + Password + "'";
		try {
			this.Cmd = this.Cn.createStatement();
			this.Rs = this.Cmd.executeQuery(SQL);
			if (this.Rs.next()) {
				estado = true;
			}
		} catch (Exception e) {
			System.out.println("***ERROR:" + e.getMessage());
		}
		return estado;
	}

	// Devolver Informacion de Cliente
	public Clientes InfoUsuario(String IdUsuario) {
		Clientes ObjP = null;
		try {
			// Establece el nombre del SP a invocar
			this.Stmt = this.Cn.prepareCall("CALL InfoUsuario(?)");
			// Asigna el valor del unico parametro del SP
			this.Stmt.setString(1, IdUsuario);
			// Ejecuta el SP y almacena los resultados
			this.Rs = this.Stmt.executeQuery();
			// Si recupero filas guardalo en un objeto de tipo Clientes
			if (this.Rs.next()) {
				ObjP = new Clientes(this.Rs.getString("IdUsuario"), this.Rs.getString("Apellidos"),
						this.Rs.getString("Nombres"), this.Rs.getString("Direccion"),
						this.Rs.getString("FechaNacimiento"), this.Rs.getString("Sexo").charAt(0),
						this.Rs.getString("Correo"), this.Rs.getString("Password"),
						this.Rs.getString("Estado").charAt(0));
			}
		} catch (Exception e) {
			System.out.println("***ERROR:" + e.getMessage());
		}
		return ObjP;
	}

	// Método para insertar filas en la tabla ventas
	public void InsertarVenta(Ventas ObjV) {
		try {
			this.Stmt = this.Cn.prepareCall("CALL InsertaVenta(?,?,?,?,?)");
			this.Stmt.setString(1, ObjV.getIdVenta());
			this.Stmt.setString(2, ObjV.getIdCliente());
			this.Stmt.setString(3, ObjV.getFechaVenta());
			this.Stmt.setDouble(4, ObjV.getMontoTotal());
			this.Stmt.setString(5, ObjV.getEstado() + "");
			this.Stmt.executeUpdate(); // INSERT, DELETE o UPDATE
		} catch (Exception e) {
			System.out.println("***ERROR:" + e.getMessage());
		}
	}

	// Método para insertar filas en la tabla detalle
	public void InsertarDetalle(Detalle ObjD) {
		try {
			this.Stmt = this.Cn.prepareCall("CALL InsertaDetalle(?,?,?,?,?)");
			this.Stmt.setString(1, ObjD.getIdVenta());
			this.Stmt.setString(2, ObjD.getIdProducto());
			this.Stmt.setInt(3, ObjD.getCantidad());
			this.Stmt.setDouble(4, ObjD.getPrecioUnidad());
			this.Stmt.setString(5, ObjD.getEstado() + "");
			this.Stmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("***ERROR:" + e.getMessage());
		}
	}

	// Método para devolver el numero de filas de un tabla
	public int NumeroFilas(String NombreTabla) {
		int filas = 0;
		String SQL = "SELECT Count(*) FROM " + NombreTabla;
		try {
			this.Cmd = this.Cn.createStatement();
			this.Rs = this.Cmd.executeQuery(SQL);
			if (this.Rs.next()) {
				filas = Rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("***ERROR:" + e.getMessage());
		}
		return filas;
	}
}
