package ar.edu.unlp.oo1.ejercicio22;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import ar.edu.unlp.info.oo1.ejercicio18.DateLapse;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaEstricta;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaFlexible;
import ar.edu.unlp.info.oo1.ejercicio22.PoliticaModerada;
import ar.edu.unlp.info.oo1.ejercicio22.Propiedad;
import ar.edu.unlp.info.oo1.ejercicio22.Reserva;
import ar.edu.unlp.info.oo1.ejercicio22.Usuario;

public class UsuarioTest {
	private Usuario usuario;
	private Propiedad prop1;
	private Propiedad prop2;
	private Propiedad prop3;
	private Propiedad prop4;
	private DateLapse fecha1;
	private DateLapse fecha2;
	private DateLapse intervalo;

	void cargarReservasEnProps() {
		prop1.addReserva(fecha1);
		prop1.addReserva(fecha2);
		prop2.addReserva(fecha1);
		prop3.addReserva(fecha1);
		prop3.addReserva(fecha2);
		prop4.addReserva(fecha1);
	}

	void agregarPropiedades() {
		usuario.addPropParaAlquilar(prop1);
		usuario.addPropParaAlquilar(prop2);
		usuario.addPropParaAlquilar(prop3);
		usuario.addPropParaAlquilar(prop4);
	}

	@BeforeEach
	void setUp() {
		usuario = new Usuario("Blas", "calle no falsa 123", 12345);
		prop1 = new Propiedad("calle 5", "depto", 150, new PoliticaFlexible());
		prop2 = new Propiedad("calle 15", "depto chico", 20, new PoliticaFlexible());
		prop3 = new Propiedad("calle 525", "depto blanco", 57, new PoliticaModerada());
		prop4 = new Propiedad("calle 11 bis", "casa quinta", 570, new PoliticaEstricta());
		fecha1 = new DateLapse(2025, 10, 10, 2025, 10, 20);
		fecha2 = new DateLapse(2026, 1, 1, 2026, 1, 10);
		intervalo = new DateLapse(2025, 1, 1, 2027, 1, 10);
	}

	@Test
	void testCrearReserva() {
		assertNotNull(usuario.crearReserva(prop1, fecha1));
		assertNull(usuario.crearReserva(prop1, fecha1));
	}

	@Test
	void testCancelarReserva() {
		Reserva reserva = usuario.crearReserva(prop1, fecha1);
		assertEquals(-1, usuario.cancelarReserva(reserva, fecha1.getFrom()));
		assertEquals(1500, usuario.cancelarReserva(reserva, intervalo.getFrom()));
	}

	@Test
	void testCalcularIngresos() {
		agregarPropiedades();
		assertEquals(0, usuario.calcularIngresos(intervalo));
		cargarReservasEnProps();
		assertEquals(7374.75, usuario.calcularIngresos(intervalo));
	}

}
