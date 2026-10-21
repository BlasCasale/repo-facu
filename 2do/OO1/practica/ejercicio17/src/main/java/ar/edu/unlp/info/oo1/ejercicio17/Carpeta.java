package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.ArrayList;
import java.util.List;

public class Carpeta {
	private String nombre;
	private List<Email> emails;

	public Carpeta(String unNombre) {
		nombre = unNombre;
		emails = new ArrayList<Email>();
	}

	public List<Email> getEmails() {
		return emails;
	}

	public String getNombre() {
		return nombre;
	}

	public void addEmail(Email email) {
		emails.add(email);
	}

	public void remove(Email email) {
		emails.remove(email);
	}

	public int getSize() {
		return emails.size();
	}

	public void mover(Email email, Carpeta destino) {
		remove(email);
		destino.addEmail(email);
	}

	public int calcularTamañoTotal() {
		int tamañoTotal = 0;

		for (Email email : emails) {
			tamañoTotal += email.getTamaño();
		}

		return tamañoTotal;
	}

	public Email buscarEmail(String string) {
		for (Email email : emails) {
			if (email.getTitulo().toLowerCase().equals(string.toLowerCase())
					|| email.getCuerpo().toLowerCase().equals(string.toLowerCase()))
				return email;
		}
		return null;
	}
}
