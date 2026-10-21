package ar.edu.unlp.info.oo1.ejercicio17;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ClienteDeCorreoTest {
	private ClienteDeCorreo cliente;
	private Email email = new Email("Objetos", "Papper de objetos");
	private Email email2 = new Email("Concurrencia", "Papper sobre concurrencia");

	@BeforeEach
	void setUp() {
		cliente = new ClienteDeCorreo();
	}

	void agregarEmails() {
		cliente.recibir(email);
		cliente.recibir(email2);
	}

	@Test
	void testRecibirEmail() {
		assertEquals(0, cliente.getCantidadEmails());
		agregarEmails();
		assertEquals(2, cliente.getCantidadEmails());
	}

	@Test
	void testEspacioOcupado() {
		assertEquals(0, cliente.espacioOcupado());
		agregarEmails();
		assertEquals(61, cliente.espacioOcupado());
	}

	@Test
	void testBuscar() {
		assertEquals(null, cliente.buscar("concurrencia"));
		agregarEmails();
		assertEquals(null, cliente.buscar("Filosofia"));
		assertEquals(email2, cliente.buscar("concurrencia"));
	}
}
