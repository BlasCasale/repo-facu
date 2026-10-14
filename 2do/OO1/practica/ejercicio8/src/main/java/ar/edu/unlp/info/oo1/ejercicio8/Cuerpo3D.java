package ar.edu.unlp.info.oo1.ejercicio8;

public class Cuerpo3D {
	private double altura;
	private CaraBasal caraBasal;

	public Cuerpo3D(double unaAltura, CaraBasal unaCaraBasal) {
		altura = unaAltura;
		caraBasal = unaCaraBasal;
	}

	public Cuerpo3D() {

	}

	public double getAltura() {
		return altura;
	}

	public void setAltura(double altura) {
		this.altura = altura;
	}

	public CaraBasal getCaraBasal() {
		return caraBasal;
	}

	public void setCaraBasal(CaraBasal caraBasal) {
		this.caraBasal = caraBasal;
	}

	public double getVolumen() {
		return caraBasal.getArea() * altura;
	}

	public double getSuperficieExterior() {
		return 2 * caraBasal.getArea() + caraBasal.getPerimetro() * altura;
	}
}
