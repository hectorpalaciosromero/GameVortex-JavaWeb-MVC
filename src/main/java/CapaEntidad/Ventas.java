package CapaEntidad;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Ventas {
	// Campos o Atributos
	private String IdVenta;
	private String IdCliente;
	private String FechaVenta;
	private double MontoTotal;
	private char Estado;
}
