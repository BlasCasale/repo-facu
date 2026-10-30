package ar.edu.unlp.info.oo1.ejercicio22;

import java.time.LocalDate;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;

public class Reserva {
	private DateLapse fecha;
	private Propiedad propiedad;

	public Reserva(DateLapse unaFecha, Propiedad unaPropiedad) {
		fecha = unaFecha;
		propiedad = unaPropiedad;
	}

	public double calcularPrecio() {
		return propiedad.getPrecioParaAlquilar(fecha);
	}

	public boolean estaReservado(DateLapse otraFecha) {
		return fecha.overlaps(otraFecha);
	}

	private boolean sePuedeCancelar(LocalDate otraFecha) {
		return fecha.esAnteriorA(otraFecha);
	}

	/**
	 * 
	 * @param otraFecha -> fecha a cancelar la reserva
	 * @return el monto a devolver por la reserva, en caso de -1 quiere decir que no se puede cancelar
	 */
	public double cancelarReserva(LocalDate otraFecha) {
		boolean sePuedeCancelar = sePuedeCancelar(otraFecha);

		if (sePuedeCancelar) {
			propiedad.cancelarReserva(this);
			return propiedad.montoAReembolsar(fecha.cuantosDiasAntes(otraFecha), fecha);
		}

		return -1;
	}
}
