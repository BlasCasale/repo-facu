package ar.edu.unlp.info.oo1.ejercicio8;

public class Circulo implements CaraBasal {
	private double diametro;
	private double radio;

	public Circulo(double unDiametro) {
		diametro = unDiametro;
		radio = diametro / 2;
	}

	public Circulo() {

	}

	public double getDiametro() {
		return diametro;
	}

	public void setDiametro(double diametro) {
		this.diametro = diametro;
	}

	public double getRadio() {
		return radio;
	}

	public void setRadio(double radio) {
		this.radio = radio;
		diametro = 2 * radio;
	}

	public double getPerimetro() {
		return diametro * Math.PI;
	}

	public double getArea() {
		return Math.pow(radio, 2) * Math.PI;
	}
}
