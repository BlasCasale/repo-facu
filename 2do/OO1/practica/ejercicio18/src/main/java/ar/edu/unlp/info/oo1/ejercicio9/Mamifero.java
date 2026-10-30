package ar.edu.unlp.info.oo1.ejercicio9;

import java.time.LocalDate;

public class Mamifero {
	private String identificador;
	private String especie;
	private LocalDate fechaNacimiento;
	private Mamifero padre;
	private Mamifero madre;

	public Mamifero(String unIdentificador) {
		identificador = unIdentificador;
	}

	public String getIdentificador() {
		return identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getEspecie() {
		return especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Mamifero getPadre() {
		return padre;
	}

	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}

	public Mamifero getMadre() {
		return madre;
	}

	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}

	public Mamifero getAbueloPaterno() {
		if (padre != null && padre.getPadre() != null) {
			return padre.getPadre();
		}
		return null;
	}

	public Mamifero getAbuelaPaterna() {
		if (padre != null && padre.getMadre() != null) {
			return padre.getMadre();
		}
		return null;
	}

	public Mamifero getAbueloMaterno() {
		if (madre != null && madre.getPadre() != null) {
			return madre.getPadre();
		}
		return null;
	}

	public Mamifero getAbuelaMaterna() {
		if (madre != null && madre.getMadre() != null) {
			return madre.getMadre();
		}
		return null;
	}

	public boolean tieneComoAncestroA(Mamifero unMamifero) {
		if (padre != null && padre.getIdentificador().equals(unMamifero.getIdentificador())) {
			return true;
		}

		if (madre != null && madre.getIdentificador().equals(unMamifero.getIdentificador())) {
			return true;
		}

		boolean esDelPadre = false;
		boolean esDeLaMadre = false;

		if (padre != null) {
			esDelPadre = padre.tieneComoAncestroA(unMamifero);
		}

		if (madre != null) {
			esDeLaMadre = madre.tieneComoAncestroA(unMamifero);
		}

		if (esDeLaMadre || esDelPadre) {
			return true;
		}

		return false;
	}
}
