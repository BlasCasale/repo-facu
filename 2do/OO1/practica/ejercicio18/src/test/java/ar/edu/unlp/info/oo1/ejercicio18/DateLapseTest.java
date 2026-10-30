package ar.edu.unlp.info.oo1.ejercicio18;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DateLapseTest {
	private ar.edu.unlp.info.oo1.ejercicio19.DateLapseI dateLapse;
	private ar.edu.unlp.info.oo1.ejercicio19.DateLapseI dateLapse2;

	@BeforeEach
	void setUp() {
		dateLapse = new DateLapse(1997, 10, 3, 2026, 10, 22);
		dateLapse2 = new ar.edu.unlp.info.oo1.ejercicio19.DateLapse(1997, 10, 3, 2026, 10, 22);
	}

	@Test
	void testSizeInDays() {
		assertEquals(10611, dateLapse.sizeInDays());
		assertNotEquals(10612, dateLapse.sizeInDays());
		assertEquals(10611, dateLapse2.sizeInDays());
		assertNotEquals(10612, dateLapse2.sizeInDays());
	}

	@Test
	void testIncludesDate() {
		assertEquals(false, dateLapse.includesDate(LocalDate.of(1997, 10, 2)));
		assertEquals(true, dateLapse.includesDate(LocalDate.of(1997, 10, 3)));
		assertEquals(false, dateLapse2.includesDate(LocalDate.of(1997, 10, 2)));
		assertEquals(true, dateLapse2.includesDate(LocalDate.of(1997, 10, 3)));
	}
}
