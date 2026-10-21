package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CajaDeAhorroTest {
	private CajaDeAhorro caja;
	private CajaDeAhorro otraCuenta;

	@BeforeEach
	void setUp() throws Exception {
		caja = new CajaDeAhorro();
		caja.setCostoAdicional(0.02);
		otraCuenta = new CajaDeAhorro();
		otraCuenta.setCostoAdicional(0.02);
	}

	@Test
	public void testDeposito() {
		double montoCorrecto = 100 - 100 * caja.getCostoAdicional();
		caja.depositar(100);
		assertEquals(montoCorrecto, caja.getSaldo());
	}

	@Test
	public void testExtraer() {
		caja.depositar(100);
		boolean pudoExtraerMal = caja.extraer(100);
		assertEquals(false, pudoExtraerMal);
		boolean pudoExtraer = caja.extraer(50);
		assertEquals(true, pudoExtraer);
		assertEquals(47, caja.getSaldo());
	}

	@Test
	public void testTransferencia() {
		caja.depositar(100);
		boolean pudoTransferir = caja.transferirACuenta(98, otraCuenta);
		assertEquals(false, pudoTransferir);

		boolean pudoTransferirBien = caja.transferirACuenta(50, otraCuenta);
		assertEquals(true, pudoTransferirBien);
		assertEquals(47, caja.getSaldo());
		assertEquals(49, otraCuenta.getSaldo());
	}
}
