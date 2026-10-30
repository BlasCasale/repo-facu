package ar.edu.unlp.info.oo1.ejer16;

public class Esfera extends Figura {
	private double radio;

	public Esfera(String unMaterial, String unColor, double unRadio) {
		super(unMaterial, unColor);
		radio = unRadio;
	}

	@Override
	public double getSuperficie() {
		return 4 * Math.PI * Math.pow(radio, 2);
	}

	@Override
	public double getVolumen() {
		return (4 / 3) * Math.PI * Math.pow(radio, 3);
	}
}
