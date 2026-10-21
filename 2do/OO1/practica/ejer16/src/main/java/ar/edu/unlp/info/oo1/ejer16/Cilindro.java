package ar.edu.unlp.info.oo1.ejer16;

public class Cilindro extends Figura {
	private double radio;
	private double altura;

	public Cilindro(String unMaterial, String unColor, double unRadio, double unaAltura) {
		super(unMaterial, unColor);
		radio = unRadio;
		altura = unaAltura;
	}

	@Override
	public double getSuperficie() {
		return 2 * Math.PI * radio * altura + 2 * Math.PI * Math.pow(radio, 2);
	}

	@Override
	public double getVolumen() {
		return Math.PI * Math.pow(radio, 2) * altura;
	}
}
