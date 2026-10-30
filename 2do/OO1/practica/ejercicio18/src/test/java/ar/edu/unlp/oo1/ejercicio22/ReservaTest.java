package ar.edu.unlp.oo1.ejercicio22;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaEstricta;
import ar.edu.unlp.info.oo1.ejercicio22.Propiedad;
import ar.edu.unlp.info.oo1.ejercicio22.Reserva;

public class ReservaTest {
	private Reserva reserva;
	private Propiedad propiedad;
	private DateLapse lapso;
	private DateLapse overlaps;
	private DateLapse otroLapso;
	private LocalDate fecha = LocalDate.of(2025, 10, 10);

	@BeforeEach
	void setUp() {
		lapso = new DateLapse(2026, 1, 1, 2026, 1, 15);
		overlaps = new DateLapse(2025, 10, 10, 2026, 10, 20);
		otroLapso = new DateLapse(2025, 10, 10, 2025, 10, 20);
		propiedad = new Propiedad("calle falsa 123", "objetoso", 125, new PoliticaEstricta());
		reserva = new Reserva(lapso, propiedad);
	}

	@Test
	void testCalcularPrecio() {
		assertEquals(1750, reserva.calcularPrecio());
	}

	@Test
	void testEstaReservado() {
		assertTrue(reserva.estaReservado(overlaps));
		assertFalse(reserva.estaReservado(otroLapso));
	}
	
	@Test
	void testCancelarReserva() {
		assertEquals(0, reserva.cancelarReserva(fecha));
	}
}
