package ar.edu.unlp.info.oo1.ejer16;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReporteDeConstruccionTest {
	private Cilindro cilindroMetalRojo;
	private Esfera esferaHormigonVerde;
	private Prisma prismaMetalVerde;
	private Cilindro cilindroHormigonRojo;
	private Esfera esferaMetalRojo;
	private Prisma prismaHormigonVerde;
	private ReporteDeConstruccion reporteDeConstruccion;

	@BeforeEach
	void setUp() {
		cilindroMetalRojo = new Cilindro("metal", "rojo", 2.5, 4);
		cilindroHormigonRojo = new Cilindro("hormigon", "verde", 5.4, 2.1);
		esferaHormigonVerde = new Esfera("hormigon", "verde", 7.4);
		esferaMetalRojo = new Esfera("metal", "rojo", 6.1);
		prismaMetalVerde = new Prisma("metal", "verde", 8, 6.3, 12.5);
		prismaHormigonVerde = new Prisma("hormigon", "verde", 12.2, 8.9, 5.6);
		reporteDeConstruccion = new ReporteDeConstruccion();
	}

	private void agregarFiguras() {
		reporteDeConstruccion.addPieza(cilindroHormigonRojo);
		reporteDeConstruccion.addPieza(cilindroMetalRojo);
		reporteDeConstruccion.addPieza(esferaHormigonVerde);
		reporteDeConstruccion.addPieza(esferaMetalRojo);
		reporteDeConstruccion.addPieza(prismaHormigonVerde);
		reporteDeConstruccion.addPieza(prismaMetalVerde);
	}

	@Test
	void testSize() {
		assertEquals(0, reporteDeConstruccion.size());
		agregarFiguras();
		assertEquals(6, reporteDeConstruccion.size());
	}

	@Test
	void testAddFigura() {
		boolean seAgrego = reporteDeConstruccion.addPieza(cilindroHormigonRojo);
		assertEquals(true, seAgrego);
	}

	@Test
	void testIsEmpty() {
		assertEquals(true, reporteDeConstruccion.isEmpty());
		agregarFiguras();
		assertEquals(false, reporteDeConstruccion.isEmpty());
	}

	@Test
	void testVolumenDelMaterial() {
		assertEquals(0, reporteDeConstruccion.volumenDelMaterial("hormigon"));
		agregarFiguras();
		assertEquals(2073.4753091934954, reporteDeConstruccion.volumenDelMaterial("hormigon"));
	}

	@Test
	void testSuperficieDeColor() {
		assertEquals(0, reporteDeConstruccion.superficieDeColor("verde"));
		agregarFiguras();
		assertEquals(1854.3834597830817, reporteDeConstruccion.superficieDeColor("verde"));
	}
}
