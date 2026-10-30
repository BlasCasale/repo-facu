package ar.edu.unlp.info.oo1.ejercicio22;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;

public class Propiedad {
	private String direccion;
	private String nombre;
	private double precioPorNoche;
	private List<Reserva> reservas;
	private PoliticaDeCancelacion politica;

	public Propiedad(String unaDireccion, String unNombre, double unPrecioPorNoche, PoliticaDeCancelacion unaPolitica) {
		direccion = unaDireccion;
		nombre = unNombre;
		precioPorNoche = unPrecioPorNoche;
		reservas = new ArrayList<Reserva>();
		politica = unaPolitica;
	}

	public double getPrecioParaAlquilar(DateLapse fecha) {
		return precioPorNoche * fecha.sizeInDays();
	}

	public boolean estaOcupada(DateLapse fecha) {
		return reservas.stream().anyMatch(reserva -> reserva.estaReservado(fecha));
	}

	public Reserva addReserva(DateLapse fecha) {
		if (!estaOcupada(fecha)) {
			Reserva nuevaReserva = new Reserva(fecha, this);
			reservas.add(nuevaReserva);
			return nuevaReserva;
		}
		return null;
	}

	public void cancelarReserva(Reserva reserva) {
		reservas.remove(reserva);
	}

	public void setPolitica(PoliticaDeCancelacion unaPolitica) {
		politica = unaPolitica;
	}

	public double montoAReembolsar(int diasRestantes, DateLapse fecha) {
		return politica.montoAReembolsar(diasRestantes) * getPrecioParaAlquilar(fecha);
	}
	
	public double calcularIngresos(DateLapse fecha) {
		return reservas.stream().filter(reserva -> reserva.estaReservado(fecha)).mapToDouble(Reserva::calcularPrecio).sum();
	}

}
