package ar.edu.unlp.info.oo1.ejercicio7;

import java.util.ArrayList;
import java.util.List;

public class Balanza {
	private ArrayList<Producto> productos;

	public Balanza() {
		productos = new ArrayList<Producto>();
	}

	public List<Producto> getProductos() {
		return productos;
	}

	public int getCantidadDeProductos() {
		return productos.size();
	}

	public double getPrecioTotal() {
		double total = 0;

		for (Producto prod : productos) {
			total += prod.getPrecio();
		}

		return total;
	}

	public double getPesoTotal() {
		double peso = 0;

		for (Producto prod : productos) {
			peso += prod.getPeso();
		}

		return peso;
	}

	public void ponerEnCero() {
		productos.removeAll(productos);
	}

	public void agregarProducto(Producto prod) {
		productos.add(prod);
	}

	public Ticket emitirTicket() {
		Ticket ticket = new Ticket(new ArrayList<Producto>(getProductos()));

		return ticket;
	}
}
