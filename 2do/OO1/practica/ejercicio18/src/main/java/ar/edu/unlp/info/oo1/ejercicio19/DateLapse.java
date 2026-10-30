package ar.edu.unlp.info.oo1.ejercicio19;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapse implements DateLapseI {
	private LocalDate from;
	private int sizeInDays;

	public DateLapse(int anioInicio, int mesInicio, int diaInicio, int anioFin, int mesFin, int diaFin) {
		from = LocalDate.of(anioInicio, mesInicio, diaInicio);
		sizeInDays = (int) from.until(LocalDate.of(anioFin, mesFin, diaFin), ChronoUnit.DAYS);
	}

	@Override
	public LocalDate getFrom() {
		return from;
	}

	@Override
	public int sizeInDays() {
		return sizeInDays;
	}

	@Override
	public LocalDate getTo() {
		return from.plusDays(sizeInDays);
	}

	@Override
	public boolean includesDate(LocalDate other) {
		return !other.isBefore(from) && !other.isAfter(getTo());
	}
}
