package ar.edu.unlp.info.oo1.ejercicio17;

public class Archivo {
	private String nombre;

	public Archivo(String unNombre) {
		nombre = unNombre;
	}

	public int tamaño() {
		return nombre.length();
	}
}
