package ar.edu.unlp.info.oo1.ejercicio12;

public abstract class Cuenta {
	private double saldo;

	public Cuenta() {
		saldo = 0;
	}

	public double getSaldo() {
		return saldo;
	}

	public void depositar(double deposito) {
		saldo += deposito;
	}

	protected void extraerSinControlar(double monto) {
		saldo -= monto;
	}
	
	public boolean extraer(double monto) {
		if (puedeExtraer(monto)) {
			extraerSinControlar(monto);
			return true;
		}
		return false;
	}
	
	protected abstract boolean puedeExtraer(double monto);
	
	public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
		if (puedeExtraer(monto)) {
			extraerSinControlar(monto);
			cuentaDestino.depositar(monto);
			return true;
		}
		return false;
	}
}
