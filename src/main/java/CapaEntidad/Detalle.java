package CapaEntidad;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class Detalle {
	// Campos o Atributos
	private String IdVenta;
	private String IdProducto;
	private int Cantidad;
	private double PrecioUnidad;
	private char Estado;

}
