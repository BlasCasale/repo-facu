package ar.edu.unlp.info.oo1.ejercicio6;

public class Item {
	private String detalle;
	private int cantidad;
	private double costoUnitario;

	public Item(String unDetalle, int unaCantidad, double unCostoUnitario) {
		detalle = unDetalle;
		cantidad = unaCantidad;
		costoUnitario = unCostoUnitario;
	}
	
	public double costo() {
		return cantidad * costoUnitario;
	}
	
	public double getCostoUnitario() {
		return costoUnitario;
	}
	
}
