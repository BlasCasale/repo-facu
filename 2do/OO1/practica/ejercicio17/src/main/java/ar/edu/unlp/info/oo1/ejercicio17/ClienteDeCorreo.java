package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.ArrayList;
import java.util.List;

public class ClienteDeCorreo {
	private Carpeta inbox;
	private List<Carpeta> carpetas;

	public ClienteDeCorreo() {
		inbox = new Carpeta("inbox");
		carpetas = new ArrayList<Carpeta>();
	}

	public void recibir(Email email) {
		inbox.addEmail(email);
	}

	public int getCantidadEmails() {
		int cantidad = inbox.getSize();

		for (Carpeta carpeta : carpetas) {
			cantidad += carpeta.getSize();
		}

		return cantidad;
	}

	public int espacioOcupado() {
		int tamañoTotal = 0;
		tamañoTotal += inbox.calcularTamañoTotal();

		for (Carpeta carpeta : carpetas) {
			tamañoTotal += carpeta.calcularTamañoTotal();
		}

		return tamañoTotal;
	}

	public Email buscar(String string) {
		Email email = inbox.buscarEmail(string);

		if (email != null) {
			return email;
		}

		for (Carpeta carpeta : carpetas) {
			email = carpeta.buscarEmail(string);
			if (email != null) {
				return email;
			}
		}
		return null;
	}
}
