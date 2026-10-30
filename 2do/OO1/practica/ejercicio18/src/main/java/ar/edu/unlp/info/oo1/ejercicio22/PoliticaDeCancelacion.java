package ar.edu.unlp.info.oo1.ejercicio22;

public interface PoliticaDeCancelacion {
	
	/**
	 * 
	 * @param diasRestantes
	 * @return un numero real entre 0 y 1, esto permite calcular el valor total del reembolso de la reserva
	 */
	public double montoAReembolsar(int diasRestantes);
}
