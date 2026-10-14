package ar.edu.unlp.info.oo1.ejercicio12;

public class CuentaCorriente extends Cuenta {
	private double limiteAlDescubierto = 0;
	
	public CuentaCorriente() {
	}
	
	public double getDescubierto() {
		return limiteAlDescubierto;
	}
	
	public void setDescubierto(double unLimiteAlDescubierto) {
		limiteAlDescubierto = unLimiteAlDescubierto;
	}
	
	@Override
	public boolean puedeExtraer(double monto) {
		double total = getSaldo() - monto;
		
		if (total < -limiteAlDescubierto) {
			return false;
		}
		
		return true;
	}
	
	@Override
	public boolean extraer(double monto) {
		if (puedeExtraer(monto)) {
			extraerSinControlar(monto);
			return true;
		}
		return false;
	}
}
