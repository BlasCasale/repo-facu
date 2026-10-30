package ar.edu.unlp.info.oo1.ejercicio17;

import java.util.ArrayList;
import java.util.List;

public class ClienteDeCorreo {
	private Carpeta inbox;
	private List<Carpeta> carpetas;

	public ClienteDeCorreo() {
		inbox = new Carpeta("inbox");
		carpetas = new ArrayList<Carpeta>();
		carpetas.add(inbox);
	}

	public void recibir(Email email) {
		inbox.addEmail(email);
	}

	public int getCantidadEmails() {
		int cantidad = 0;

		for (Carpeta carpeta : carpetas) {
			cantidad += carpeta.getSize();
		}

		return cantidad;
	}

	public int espacioOcupado() {
		int tamañoTotal = 0;

		for (Carpeta carpeta : carpetas) {
			tamañoTotal += carpeta.calcularTamañoTotal();
		}

		return tamañoTotal;
	}

	public Email buscar(String string) {
		return carpetas.stream().map(carpeta -> carpeta.buscarEmail(string)).filter(email -> email != null).findFirst()
				.orElse(null);
	}
}
