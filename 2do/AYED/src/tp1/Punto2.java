package tp1;

public class Punto2 {
	public static int[] primerosMultiplos(int n) {
		int[] resultado = new int[n];

		for (int i = 0; i < n; i++) {
			int num = n * (i + 1);
			if (num > 1) {
				resultado[i] = num;
			}
		}

		return resultado;
	}
}
