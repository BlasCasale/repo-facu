package ar.edu.unlp.oo1.ejercicio22;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaEstricta;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaFlexible;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaModerada;
import ar.edu.unlp.info.oo1.ejercicio22.Propiedad;
import ar.edu.unlp.info.oo1.ejercicio22.Reserva;

public class PropiedadTest {
	private Propiedad propiedad;
	private PoliticaEstricta estricta;
	private PoliticaFlexible flexible;
	private PoliticaModerada moderada;
	private DateLapse lapsoFecha;
	private DateLapse unDia;

	void inicializarPoliticas() {
		estricta = new PoliticaEstricta();
		flexible = new PoliticaFlexible();
		moderada = new PoliticaModerada();
	}

	Reserva agregarReserva() {
		return propiedad.addReserva(lapsoFecha);
	}

	@BeforeEach
	void setUp() {
		inicializarPoliticas();
		lapsoFecha = new DateLapse(2026, 1, 1, 2026, 1, 15);
		unDia = new DateLapse(2026, 1, 1, 2026, 1, 1);
		propiedad = new Propiedad("calle false 123", "objetosa", 247.4, estricta);
	}

	@Test
	void testGetPrecioAlquiler() {
		assertEquals(3463.6, propiedad.getPrecioParaAlquilar(lapsoFecha));
		assertEquals(247.4, propiedad.getPrecioParaAlquilar(unDia));
	}

	@Test
	void testEstaOcupada() {
		assertFalse(propiedad.estaOcupada(lapsoFecha));
		agregarReserva();
		assertTrue(propiedad.estaOcupada(lapsoFecha));
	}

	@Test
	void testMontoAReembolsar() {
		LocalDate otraFecha = LocalDate.of(2025, 10, 10);
		// politica estricta
		assertEquals(0, propiedad.montoAReembolsar(lapsoFecha.cuantosDiasAntes(otraFecha), lapsoFecha));
		// politica flexible
		propiedad.setPolitica(flexible);
		assertEquals(3463.6, propiedad.montoAReembolsar(lapsoFecha.cuantosDiasAntes(otraFecha), lapsoFecha));
		// politica moderada
		propiedad.setPolitica(moderada);
		// alquiler * 1 por >= a 7 dias
		assertEquals(3463.6, propiedad.montoAReembolsar(lapsoFecha.cuantosDiasAntes(otraFecha), lapsoFecha));
		otraFecha = LocalDate.of(2025, 12, 27);
		// alquiler * 0.5 >= a 2 dias
		assertEquals(1731.8, propiedad.montoAReembolsar(lapsoFecha.cuantosDiasAntes(otraFecha), lapsoFecha));
		// alquiler * 0 < 2 dias
		assertEquals(0, propiedad.montoAReembolsar(1, lapsoFecha));
	}

}
