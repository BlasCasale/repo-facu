package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CarpetaTest {
	private Carpeta carpeta1;
	private Carpeta carpeta2;
	private Email email;

	@BeforeEach
	void setUp() {
		carpeta1 = new Carpeta("inbox");
		carpeta2 = new Carpeta("junk");
		email = new Email("Aprobado", "Usted aprobó la asignatura");
	}

	void agregarEmail() {
		carpeta1.addEmail(email);
	}

	@Test
	void testAgregarEmail() {
		assertEquals(0, carpeta1.getSize());
		agregarEmail();
		assertEquals(1, carpeta1.getSize());
	}

	@Test
	void testRemoverMail() {
		agregarEmail();
		carpeta1.remove(email);
		assertEquals(0, email.getSize());
	}

	@Test
	void testMoverEmail() {
		agregarEmail();
		carpeta1.mover(email, carpeta2);
		assertEquals(0, carpeta1.getSize());
		assertEquals(1, carpeta2.getSize());
	}

	@Test
	void testBuscarEmail() {
		agregarEmail();
		assertEquals(null, carpeta1.buscarEmail("Desaprobado"));
		assertEquals(email, carpeta1.buscarEmail("Aprobado"));
	}

	@Test
	void testCalcularTamañoTotal() {
		assertEquals(0, carpeta1.calcularTamañoTotal());
		agregarEmail();
		assertEquals(34, carpeta1.calcularTamañoTotal());
	}
}
