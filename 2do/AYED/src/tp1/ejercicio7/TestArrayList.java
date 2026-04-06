package tp1.ejercicio7;

import java.util.ArrayList;
import java.util.Arrays;
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
	
	public static int sumarLinkedList (LinkedList<Integer> lista) {
		if (lista.isEmpty()) {
			return 0;
		}
		
		int num = lista.get(0);
		lista.remove(0);
		int sig = sumarLinkedList(lista);
		
		return num + sig;
	}
	
	public static ArrayList<Integer> combinarOrdenado (ArrayList<Integer> lista1, ArrayList<Integer> lista2) {
		ArrayList<Integer> nuevaLista = new ArrayList<Integer>();
		ArrayList<Integer> llamado = new ArrayList<Integer>();
		if (!lista1.isEmpty() && !lista2.isEmpty()) {
			int n1 = lista1.get(0);
			int n2 = lista2.get(0);
			if (n1 < n2) {
				nuevaLista.add(n1);
				lista1.remove(0);
			} else {
				nuevaLista.add(n2);
				lista2.remove(0);
			}
			llamado = combinarOrdenado(lista1, lista2);
		} else if (lista1.isEmpty() && !lista2.isEmpty()) {
			int n = lista2.get(0);
			nuevaLista.add(n);
			lista2.remove(0);
			llamado = combinarOrdenado(lista1, lista2);
		} else if (!lista1.isEmpty() && lista2.isEmpty()) {
			int n = lista1.get(0);
			nuevaLista.add(n);
			lista1.remove(0);
			llamado = combinarOrdenado(lista1, lista2);
		}
		
		nuevaLista.addAll(llamado);
		
		return nuevaLista;
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
		
		LinkedList<Integer> listaParaSumar = new LinkedList<>(Arrays.asList(
			    10, 20, 30, 40, 50, 60, 70, 80, 90, 100
			));

		System.out.println(sumarLinkedList(listaParaSumar));
		
		ArrayList<Integer> lista1 = new ArrayList<>(Arrays.asList(1, 2, 5, 500, 501));

		// Lista B: Tiene números que caen justo en el "hueco" de la Lista A
		ArrayList<Integer> lista2 = new ArrayList<>(Arrays.asList(3, 4, 10, 20, 30, 40, 50));
		
		System.out.println((combinarOrdenado(lista1, lista2)));
	}

}
