package ar.edu.unlp.info.oo1.ejercicio22;

public class PoliticaModerada implements PoliticaDeCancelacion {

	@Override
	public double montoAReembolsar(int diasRestantes) {
		return diasRestantes >= 7 ? 1 : diasRestantes >= 2 ? 0.5 : 0;
	}
}
