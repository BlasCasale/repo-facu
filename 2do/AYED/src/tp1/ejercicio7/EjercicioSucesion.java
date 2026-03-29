package tp1.ejercicio7;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Arrays;

public class EjercicioSucesion {

	public static ArrayList<Integer> calculaSucesion(int n) {
		ArrayList<Integer> lista = new ArrayList<Integer>();
		lista.add(n);

		if (n == 1) {
			return lista;
		}

		int num = 0;
		if (n % 2 == 0) {
			num = n / 2;
		} else {
			num = n * 3 + 1;
		}

		ArrayList<Integer> listaIntegers = calculaSucesion(num);
		lista.addAll(listaIntegers);

		return lista;
	}

	public static void imprimir(ArrayList<Integer> lista) {
		for (Integer n : lista) {
			System.out.println(n);
		}
	}

	public static void main(String args[]) {
		imprimir(calculaSucesion(15));
		ArrayList<Integer> numeros = new ArrayList<>(Arrays.asList(
			    10, 25, 3, 48, 52, 14, 7, 91, 33, 5, 22, 18, 60, 41, 12
			));
		imprimir(numeros);
		System.out.println("Paso inversion-------------------------");
		invertirArrayList(numeros);
		imprimir(numeros);
	}

	public static void invertirArrayList(ArrayList<Integer> lista) {

		if (lista == null || lista.get(0) == null || lista.size() == 0)
			return;

		int num = lista.getFirst();

		lista.remove(0);

		invertirArrayList(lista);

		lista.add(num);
	}
}
