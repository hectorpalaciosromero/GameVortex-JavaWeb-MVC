package CapaEntidad;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Productos {
	private String IdProducto;
	private String IdCategoria;
	private String Descripcion;
	private double PrecioUnidad;
	private int Stock;
	private String Imagen;
	private char Estado;
}
