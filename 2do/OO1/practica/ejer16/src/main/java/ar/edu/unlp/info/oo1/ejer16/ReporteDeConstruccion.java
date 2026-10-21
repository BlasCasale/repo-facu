package ar.edu.unlp.info.oo1.ejer16;

import java.util.ArrayList;
import java.util.List;

public class ReporteDeConstruccion {

	private List<Figura> piezas;

	public ReporteDeConstruccion() {
		piezas = new ArrayList<Figura>();
	}

	public boolean addPieza(Figura figura) {
		return piezas.add(figura);
	}

	public boolean isEmpty() {
		return piezas.isEmpty();
	}

	public int size() {
		return piezas.size();
	}

	public boolean remove(Figura figura) {
		return piezas.remove(figura);
	}

	public double volumenDelMaterial(String material) {
		return piezas.stream().filter(pieza -> pieza.getMaterial().toLowerCase().equals(material.toLowerCase()))
				.mapToDouble(Figura::getVolumen).sum();
	}

	public double superficieDeColor(String color) {
		return piezas.stream().filter(pieza -> pieza.getColor().toLowerCase().equals(color.toLowerCase()))
				.mapToDouble(Figura::getSuperficie).sum();
	}
}
