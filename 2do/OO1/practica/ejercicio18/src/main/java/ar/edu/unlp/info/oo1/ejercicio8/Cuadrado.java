package ar.edu.unlp.info.oo1.ejercicio8;

public class Cuadrado implements CaraBasal {
	private double lado;

	public Cuadrado(double unLado) {
		lado = unLado;
	}

	public Cuadrado() {

	}

	public double getLado() {
		return lado;
	}

	public void setLado(double lado) {
		this.lado = lado;
	}

	public double getArea() {
		return lado * lado;
	}

	public double getPerimetro() {
		return lado * 4;
	}

}
