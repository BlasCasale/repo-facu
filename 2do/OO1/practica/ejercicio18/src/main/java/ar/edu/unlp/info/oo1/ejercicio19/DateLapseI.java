package ar.edu.unlp.info.oo1.ejercicio19;

import java.time.LocalDate;

public interface DateLapseI {
	LocalDate getFrom();

	LocalDate getTo();

	int sizeInDays();

	boolean includesDate(LocalDate other);
}
