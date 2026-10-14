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
		otraCuenta.setCostoAdicional(0.5);
	}

	@Test
	public void testDeposito() {
		double montoCorrecto = 10000 - 10000 * caja.getCostoAdicional();
		caja.depositar(10000);
		assertEquals(montoCorrecto, caja.getSaldo());
	}

	@Test
	public void testPuedeExtraer() {
		caja.depositar(10000);
		double montoAExtraer = 10000 + 10000 * caja.getCostoAdicional();
		assertEquals(false, caja.puedeExtraer(montoAExtraer));
	}
	
	@Test
	public void testTransferencia() {
		caja.depositar(3500);
		caja.transferirACuenta(3000, otraCuenta);
		assertEquals(370, caja.getSaldo());
		assertEquals(1500, otraCuenta.getSaldo());
	}
}
