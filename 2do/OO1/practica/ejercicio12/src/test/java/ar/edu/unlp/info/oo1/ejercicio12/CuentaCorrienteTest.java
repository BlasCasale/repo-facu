package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CuentaCorrienteTest {
	private CuentaCorriente cuentaCorriente;

	@BeforeEach
	void setUp() throws Exception {
		cuentaCorriente = new CuentaCorriente();
		cuentaCorriente.depositar(15000);
		cuentaCorriente.setDescubierto(3000);
	}

	@Test
	public void testPuedeExtraer() {
		boolean pudoExtraer = cuentaCorriente.puedeExtraer(18000);
		assertEquals(true, pudoExtraer);
	}
}
