package ar.edu.unlp.info.oo1.ejercicio2;

public class Balanza {
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;

	public int getCantidadDeProductos() {
		return cantidadDeProductos;
	}

	public double getPrecioTotal() {
		return precioTotal;
	}

	public double getPesoTotal() {
		return pesoTotal;
	}

	public Balanza() {
		cantidadDeProductos = 0;
		precioTotal = 0;
		pesoTotal = 0;
	}

	public void ponerEnCero() {
		this.cantidadDeProductos = 0;
		this.pesoTotal = 0;
		this.precioTotal = 0;
	}

	public void agregarProducto(Producto prod) {
		this.pesoTotal += prod.getPeso();
		this.precioTotal += prod.getPeso() * prod.getPrecioPorKilo();
		this.cantidadDeProductos++;
	}

	public Ticket emitirTicket() {
		Ticket ticket = new Ticket(cantidadDeProductos, pesoTotal, precioTotal);
		this.cantidadDeProductos = 0;
		this.pesoTotal = 0;
		this.precioTotal = 0;

		return ticket;
	}
}
