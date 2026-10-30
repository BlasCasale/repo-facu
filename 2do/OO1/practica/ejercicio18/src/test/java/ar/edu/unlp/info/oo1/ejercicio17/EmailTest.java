package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmailTest {
	private Email email;
	private Archivo arch1;
	private Archivo arch2;

	@BeforeEach
	void setUp() {
		email = new Email("Objetos 1", "Programacion orientada a objetos en Java");
		arch1 = new Archivo("Jnuit Testing");
		arch2 = new Archivo("Software design");
	}

	void agregarArchivos() {
		email.add(arch1);
		email.add(arch2);
	}

	@Test
	void testSize() {
		assertEquals(0, email.getSize());
		agregarArchivos();
		assertEquals(2, email.getSize());
	}

	@Test
	void testTamañoTitulo() {
		assertEquals(9, email.getTitulo().length());
		assertNotEquals(10, email.getTitulo().length());
	}

	@Test
	void testTamañoCuerpo() {
		assertNotEquals(39, email.getCuerpo().length());
		assertEquals(40, email.getCuerpo().length());
	}

	@Test
	void testTamañoAdjuntos() {
		assertEquals(0, email.calcularTamañoAdjuntos());
		agregarArchivos();
		assertEquals(28, email.calcularTamañoAdjuntos());
	}

	@Test
	void testTamañoTotal() {
		assertEquals(49, email.getTamaño());
		agregarArchivos();
		assertEquals(77, email.getTamaño());
		assertNotEquals(76, email.getTamaño());
	}
}
