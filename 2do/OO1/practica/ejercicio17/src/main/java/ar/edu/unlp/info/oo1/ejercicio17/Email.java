package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.ArrayList;
import java.util.List;

public class Email {
	private String titulo;
	private String cuerpo;
	private List<Archivo> adjuntos;

	public Email(String unTitulo, String unCuerpo) {
		titulo = unTitulo;
		cuerpo = unCuerpo;
		adjuntos = new ArrayList<Archivo>();
	}

	public String getTitulo() {
		return titulo;
	}

	public String getCuerpo() {
		return cuerpo;
	}

	public List<Archivo> getArchivos() {
		return adjuntos;
	}

	public void add(Archivo arch) {
		adjuntos.add(arch);
	}

	public int getSize() {
		return adjuntos.size();
	}

	private int getLengthCuerpo() {
		return cuerpo.length();
	}

	private int getLengthTitulo() {
		return titulo.length();
	}

	public int calcularTamañoAdjuntos() {
		int tamañoTotal = 0;

		for (Archivo arch : adjuntos) {
			tamañoTotal += arch.tamaño();
		}

		return tamañoTotal;
	}

	public int getTamaño() {
		return calcularTamañoAdjuntos() + getLengthCuerpo() + getLengthTitulo();
	}

	public boolean contieneTituloOCuerpo(String string) {
		return titulo.toLowerCase().contains(string.toLowerCase())
				|| cuerpo.toLowerCase().contains(string.toLowerCase());
	}
}
