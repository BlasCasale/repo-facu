package tp1.ejercicio7;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Scanner;

import tp1.Estudiante;

public class TestArrayList {

	public static void iterarRecursivo(ArrayList<Integer> arr, int pos) {
		if (pos >= arr.size())
			return;

		System.out.println(pos + " " + arr.get(pos));

		iterarRecursivo(arr, pos + 1);
	}

	public static void todologo() {
		ArrayList<Estudiante> listaEstudiantes = new ArrayList<>();

		listaEstudiantes.add(new Estudiante("Blas", "Casale", "mail@mail", "calle falsa", 1));
		listaEstudiantes.add(new Estudiante("Blas", "Casale", "mail@mail", "calle falsa", 2));
		listaEstudiantes.add(new Estudiante("Blas", "Casale", "mail@mail", "calle falsa", 3));

		ArrayList<Estudiante> listaCopia = new ArrayList<Estudiante>();

		for (Estudiante estu : listaEstudiantes) {
			listaCopia.add(estu);
		}

		for (int i = 0; i < listaEstudiantes.size(); i++) {
			System.out.println("Lista original en indice " + i);
			System.out.println(listaEstudiantes.get(i).tusDatos());
			System.out.println("Lista copia en indice " + i);
			System.out.println(listaCopia.get(i).tusDatos());
		}

		listaEstudiantes.get(0).setNombre("Joaquin");

		System.out.println("--------------------------------------------------------------------");

		for (int i = 0; i < listaEstudiantes.size(); i++) {
			System.out.println("Lista original en indice " + i);
			System.out.println(listaEstudiantes.get(i).tusDatos());
			System.out.println("Lista copia en indice " + i);
			System.out.println(listaCopia.get(i).tusDatos());
		}

		Estudiante estudiante = new Estudiante("Juan", "Perez", "mail@mail", "calle falsa 2", 5);
		boolean esta = false;

		for (Estudiante estu : listaEstudiantes) {
			if (estu.equals(estudiante)) {
				esta = true;
				break;
			}
		}

		if (!esta)
			listaEstudiantes.add(estudiante);

	}

	public static boolean esCapicua(ArrayList<Integer> lista) {

		ArrayList<Integer> listaCopia = new ArrayList<Integer>();

		for (Integer n : lista) {
			listaCopia.add(n);
		}

		boolean resultado = lista.equals(listaCopia);

		return resultado;
	}

	public static void main(String args[]) {
//		ArrayList<Integer> listaNumeros = new ArrayList<>();
//		LinkedList<Integer> listaNumeros2 = new LinkedList<>();
//
//		Scanner scanner = new Scanner(System.in);
//
//		while (scanner.hasNextInt()) {
//			int num = scanner.nextInt();
//
//			if (num < 0)
//				break;
//
//			listaNumeros.add(num);
//			listaNumeros2.add(num);
//		}
//
//		iterarRecursivo(listaNumeros, 0);
//
//		scanner.close();

		todologo();
	}

}
