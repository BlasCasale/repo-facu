package tp1;

public class EnterosRetorno {

	public static int maximo, minimo, promedio;
	public static int[] arreglo;

	public static MaxMinProm maxMinProm1(int[] arr) {
		MaxMinProm retorno = new MaxMinProm();

		if (arr == null || arr.length == 0)
			return retorno;

		int min = arr[0];
		int max = arr[0];
		int prom = 0;
		for (int el : arr) {
			if (el < min)
				min = el;
			if (el > max)
				max = el;
			prom += el;
		}

		prom = prom / arr.length;

		retorno.setMaximo(max);
		retorno.setMinimo(min);
		retorno.setPromedio(prom);
		return retorno;
	}

	public static void maxMinProm2(MaxMinProm retorno, int[] arr) {
		if (arr == null || arr.length == 0)
			return;

		int min = arr[0];
		int max = arr[0];
		int prom = 0;

		for (int el : arr) {
			if (el < min)
				min = el;
			if (el > max)
				max = el;
			prom += el;
		}

		prom = prom / arr.length;

		retorno.setMaximo(max);
		retorno.setMinimo(min);
		retorno.setPromedio(prom);
	}
	
	public static void maxMinProm3() {
        if (arreglo == null || arreglo.length == 0) return;

        int max = arreglo[0];
        int min = arreglo[0];
        int suma = 0;

        for (int el : arreglo) {
            if (el > max) max = el;
            if (el < min) min = el;
            suma += el;
        }

        
        maximo = max;
        minimo = min;
        promedio = suma / arreglo.length;
    }
}
