package ar.edu.unlp.info.oo1.ejer16;

public abstract class Figura {
	private String material;
	private String color;

	public Figura(String unMaterial, String unColor) {
		material = unMaterial;
		color = unColor;
	}

	public String getColor() {
		return color;
	}

	public String getMaterial() {
		return material;
	}

	public abstract double getVolumen();

	public abstract double getSuperficie();

}
