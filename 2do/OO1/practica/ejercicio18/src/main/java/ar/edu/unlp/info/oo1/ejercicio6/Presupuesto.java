package ar.edu.unlp.info.oo1.ejercicio6;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

public class Presupuesto {
	private LocalDate fecha;
	private String cliente;
	private ArrayList<Item> items;

	public Presupuesto(String unCliente) {
		fecha = LocalDate.now();
		cliente = unCliente;
		items = new ArrayList<Item>();
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public String getCliente() {
		return cliente;
	}

	public void agregarItem(Item item) {
		items.add(item);
	}

	public double calcularTotal() {
		double total = 0;

		for (Item item : items) {
			total += item.costo();
		}
		return total;
	}
}
