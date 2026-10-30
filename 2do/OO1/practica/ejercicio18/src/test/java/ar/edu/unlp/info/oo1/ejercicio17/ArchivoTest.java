package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArchivoTest {
	private Archivo archivo;

	@BeforeEach
	void setUp() {
		archivo = new Archivo("orientacion a objetos");
	}

	@Test
	void testTamaño() {
		assertEquals(21, archivo.tamaño());
		assertNotEquals(22, archivo.tamaño());
	}
}
