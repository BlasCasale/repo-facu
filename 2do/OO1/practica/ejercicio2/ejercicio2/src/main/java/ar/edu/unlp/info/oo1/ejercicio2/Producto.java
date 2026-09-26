package ar.edu.unlp.info.oo1.ejercicio2;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descripcion;

	public Producto(String unaDescripcion, double unPeso, double unPrecioPorKilo) {
		this.peso = unPeso;
		this.precioPorKilo = unPrecioPorKilo;
		this.descripcion = unaDescripcion;
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public double getPrecioPorKilo() {
		return precioPorKilo;
	}

	public void setPrecioPorKilo(double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public double getPrecio () {
		return this.precioPorKilo * this.peso;
	}

}
