package CapaEntidad;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class Clientes {
	// Campos o Atributos
	private String IdCliente;
	private String Apellidos;
	private String Nombres;
	private String Direccion;
	private String FechaNacimiento;
	private char Sexo;
	private String Correo;
	private String Password;
	private char Estado;

	public void setEmail(String email) {
		// TODO Auto-generated method stub

	}

	public String getIdUsuario() {
		return IdCliente;
	}

}