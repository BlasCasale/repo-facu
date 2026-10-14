package ar.edu.unlp.info.oo1.ejercicio7;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Ticket {
	private ArrayList<Producto> productos;
	private LocalDate fecha;
	private double pesoTotal;
	private double precioTotal;

	public Ticket(ArrayList<Producto> prods) {
		productos = new ArrayList<Producto>(prods);
		fecha = LocalDate.now();
		pesoTotal = calcularPesoTotal();
		precioTotal = calcularPrecioTotal();
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public int getCantidadDeProductos() {
		return productos.size();
	}

	private double calcularPesoTotal() {
		return productos.stream().mapToDouble(prod -> prod.getPeso()).sum();
	}

	private double calcularPrecioTotal() {
		return productos.stream().mapToDouble(prod -> prod.getPrecio()).sum();
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
		return calcularPrecioTotal() * 0.21;
	}
}
