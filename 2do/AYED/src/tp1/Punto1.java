package tp1;

public class Punto1 {

	public static void imprimirEnterosFor(int a, int b) {
		for (int i = a; i <= b; i++) {
			System.out.println(i);
		}
	}

	public static void imprimirEnterosWhile(int a, int b) {
		while (a <= b) {
			System.out.println(a);
			a++;
		}
	}

	public static void imprimirEnterosRecursivo(int a, int b) {
		if (a > b)
			return;

		System.out.println(a);
		imprimirEnterosRecursivo(a + 1, b);
	}
}
