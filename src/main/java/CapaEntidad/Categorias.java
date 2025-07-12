package CapaEntidad;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Categorias {
	private String IdCategoria;
	private String Descripcion;
	private String Imagen;
	private char Estado;
}
