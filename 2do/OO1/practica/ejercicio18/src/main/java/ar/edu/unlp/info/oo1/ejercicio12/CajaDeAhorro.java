package ar.edu.unlp.info.oo1.ejercicio12;

public class CajaDeAhorro extends Cuenta {
	private double costoAdicional;

	public CajaDeAhorro() {

	}
	
	public double getCostoAdicional() {
		return costoAdicional;
	}

	public void setCostoAdicional(double unCostoAdicional) {
		costoAdicional = unCostoAdicional;
	}
	
	@Override
	protected boolean puedeExtraer(double monto) {
		double total = monto * costoAdicional + monto;

		return total <= getSaldo();
	}

	@Override
	protected void extraerSinControlar(double monto) {
		super.extraerSinControlar(monto + (monto * costoAdicional));
	}

	@Override
	public void depositar(double monto) {
		super.depositar(monto - monto * costoAdicional);
	}
}
