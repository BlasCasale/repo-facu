package ar.edu.unlp.info.oo1.ejercicio21;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EvenNumberSetTest {
	EvenNumberSet setPar;

	@BeforeEach
	void setUp() {
		setPar = new EvenNumberSet();
	}

	List<Integer> agregarNums() {
		List<Integer> nums = new ArrayList<Integer>();
		nums.addAll(List.of(2, 3, 4, 5, 6, 7, 8, 9, 10));
		return nums;
	}

	@Test
	void testAdd() {
		assertTrue(setPar.add(2));
		assertFalse(setPar.add(3));
	}

	@Test
	void testAddAll() {
		assertTrue(setPar.addAll(agregarNums()));
	}
}
