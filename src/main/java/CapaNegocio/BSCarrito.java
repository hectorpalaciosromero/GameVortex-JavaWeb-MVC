package CapaNegocio;

import CapaEntidad.*;
import CapaDatos.BDCarrito;
import java.util.ArrayList;

public class BSCarrito {
	BDCarrito ObjBD;

	public BSCarrito() {
		ObjBD = new BDCarrito();
	}

	public ArrayList<Categorias> ListarCategorias() {
		return ObjBD.ListarCategorias();
	}

	public ArrayList<Productos> ListarProductos(String IdCat) {
		return ObjBD.ListarProductos(IdCat);
	}

	public Productos BuscarProducto(String IdPro) {
		return ObjBD.BuscarProducto(IdPro);
	}

	public boolean VerificaUsuario(String IdCliente, String Password) {
		return ObjBD.VerificaUsuario(IdCliente, Password);
	}

	public Clientes InfoUsuario(String IdUsuario) {
		return ObjBD.InfoUsuario(IdUsuario);
	}

	public void InsertarVenta(Ventas ObjV) {
		ObjBD.InsertarVenta(ObjV);
	}

	public void InsertarDetalle(Detalle ObjD) {
		ObjBD.InsertarDetalle(ObjD);
	}

	public int NumeroFilas(String NombreTabla) {
		return ObjBD.NumeroFilas(NombreTabla);
	}
}
