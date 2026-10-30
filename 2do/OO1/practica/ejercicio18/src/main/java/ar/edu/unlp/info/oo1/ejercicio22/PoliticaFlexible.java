package ar.edu.unlp.info.oo1.ejercicio22;

public class PoliticaFlexible implements PoliticaDeCancelacion {

	@Override
	public double montoAReembolsar(int diasRestantes) {
		return diasRestantes == 0 ? 0 : 1;
	}
}
