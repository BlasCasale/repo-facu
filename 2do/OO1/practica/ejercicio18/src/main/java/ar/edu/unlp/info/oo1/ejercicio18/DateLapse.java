package ar.edu.unlp.info.oo1.ejercicio18;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import ar.edu.unlp.info.oo1.ejercicio19.DateLapseI;

public class DateLapse implements DateLapseI {
	private LocalDate from;
	private LocalDate to;

	public DateLapse(int anioInicio, int mesInicio, int diaInicio, int anioFin, int mesFin, int diaFin) {
		from = LocalDate.of(anioInicio, mesInicio, diaInicio);
		to = LocalDate.of(anioFin, mesFin, diaFin);
	}

	public LocalDate getFrom() {
		return from;
	}

	public LocalDate getTo() {
		return to;
	}

	public int sizeInDays() {
		return from.equals(to) ? 1 : (int) from.until(to, ChronoUnit.DAYS);
	}

	public boolean includesDate(LocalDate otherDate) {
		return !otherDate.isBefore(from) && !otherDate.isAfter(getTo());
	}

	public boolean esAnteriorA(LocalDate otraFecha) {
		return otraFecha.isBefore(from);
	}

	public boolean overlaps(DateLapse otherDate) {
		boolean estaAntes = getTo().isBefore(otherDate.getFrom());
		boolean estaDespues = getFrom().isAfter(otherDate.getTo());

		return !(estaAntes || estaDespues);
	}

	public int cuantosDiasAntes(LocalDate otherDate) {
		if (!esAnteriorA(otherDate)) {
			return -1;
		}

		return (int) otherDate.until(getFrom(), ChronoUnit.DAYS);
	}

}
