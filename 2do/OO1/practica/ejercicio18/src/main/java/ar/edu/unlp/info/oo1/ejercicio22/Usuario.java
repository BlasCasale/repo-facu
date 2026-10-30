package ar.edu.unlp.info.oo1.ejercicio22;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;

public class Usuario {
	private String nombre;
	private String direccion;
	private int dni;
	private List<Propiedad> propiedades;
	private List<Reserva> reservas;

	public Usuario(String unNombre, String unaDireccion, int unDni) {
		nombre = unNombre;
		direccion = unaDireccion;
		dni = unDni;
		propiedades = new ArrayList<Propiedad>();
		reservas = new ArrayList<Reserva>();
	}

	public void addPropParaAlquilar(Propiedad prop) {
		propiedades.add(prop);
	}

	public Reserva crearReserva(Propiedad prop, DateLapse fecha) {
		Reserva nuevaReserva = prop.addReserva(fecha);
		if (nuevaReserva != null) {
			reservas.add(nuevaReserva);
		}
		return nuevaReserva;
	}

	public double cancelarReserva(Reserva reserva, LocalDate fecha) {
		double montoAReembolsar = reserva.cancelarReserva(fecha);

		if (montoAReembolsar != -1) {
			reservas.remove(reserva);
		}

		return montoAReembolsar;
	}

	public double calcularIngresos(DateLapse fecha) {
		return 0.75 * propiedades.stream().mapToDouble(propiedad -> propiedad.calcularIngresos(fecha)).sum();
	}
}
