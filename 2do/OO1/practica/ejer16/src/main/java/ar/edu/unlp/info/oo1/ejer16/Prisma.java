package ar.edu.unlp.info.oo1.ejer16;

public class Prisma extends Figura {
	private double ladoMayor;
	private double ladoMenor;
	private double altura;

	public Prisma(String unMaterial, String unColor, double unLadoMayor, double unLadoMenor, double unaAltura) {
		super(unMaterial, unColor);
		ladoMayor = unLadoMayor;
		ladoMenor = unLadoMenor;
		altura = unaAltura;
	}

	@Override
	public double getSuperficie() {
		return 2 * (ladoMayor * ladoMenor + ladoMayor * altura + ladoMenor * altura);
	}

	@Override
	public double getVolumen() {
		return ladoMayor * ladoMenor * altura;
	}
}
