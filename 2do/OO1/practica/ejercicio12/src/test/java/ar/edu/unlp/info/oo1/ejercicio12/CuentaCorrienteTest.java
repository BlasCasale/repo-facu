package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CuentaCorrienteTest {
	private CuentaCorriente cuentaCorriente;
	private CuentaCorriente otraCuenta;

	@BeforeEach
	void setUp() throws Exception {
		cuentaCorriente = new CuentaCorriente();
		otraCuenta = new CuentaCorriente();
	}

	@Test
	public void testDepositar() {
		cuentaCorriente.depositar(100);
		assertEquals(100, cuentaCorriente.getSaldo());
	}

	@Test
	public void testExtraer() {
		cuentaCorriente.setDescubierto(500);
		boolean pudoExtraer = cuentaCorriente.extraer(300);
		assertEquals(true, pudoExtraer);
		assertEquals(-300, cuentaCorriente.getSaldo());
	}

	@Test
	public void testTransferirACuenta() {
		cuentaCorriente.setDescubierto(200);
		boolean transferenciaErronea = cuentaCorriente.transferirACuenta(300, otraCuenta);
		assertEquals(false, transferenciaErronea);
		boolean transferenciaCorrecta = cuentaCorriente.transferirACuenta(100, otraCuenta);
		assertEquals(true, transferenciaCorrecta);
	}
}
