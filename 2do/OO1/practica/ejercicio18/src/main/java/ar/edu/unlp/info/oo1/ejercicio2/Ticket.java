package ar.edu.unlp.info.oo1.ejercicio2;

import java.time.LocalDate;
import java.util.Date;

public class Ticket {
	private int cantidadProds;
	private double pesoTotal;
	private double precioTotal;
	private LocalDate fecha;

	public Ticket(int cant, double peso, double precio) {
		this.cantidadProds = cant;
		this.pesoTotal = peso;
		this.precioTotal = precio;
		this.fecha = LocalDate.now();
	}
	
	
	
	public int getCantidadDeProductos() {
		return cantidadProds;
	}



	public double getPesoTotal() {
		return pesoTotal;
	}



	public double getPrecioTotal() {
		return precioTotal;
	}



	public LocalDate getFecha() {
		return fecha;
	}



	public double impuesto() {
		return this.precioTotal * 0.21;
	}
}
