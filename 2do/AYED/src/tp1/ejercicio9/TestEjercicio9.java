package tp1.ejercicio9;

import java.util.Stack;

public class TestEjercicio9 {

	public static boolean verificarCierre(char pri, char seg) {

		if (pri == '(' && seg == ')') {
			return true;
		}

		if (pri == '{' && seg == '}') {
			return true;
		}

		if (pri == '[' && seg == ']') {
			return true;
		}

		return false;
	}

	public static boolean estaBalanceado(String cadena) {
		if (cadena.length() % 2 != 0) {
			return false;
		}

		Stack<Character> chars = new Stack<Character>();

		for (int i = 0; i < cadena.length(); i++) {
			char c = cadena.charAt(i);

			if (c == '(' || c == '[' || c == '{') {
				chars.push(c);
			} else {
				if (chars.isEmpty()) {
					return false;
				}

				char top = chars.pop();

				if (!verificarCierre(top, c)) {
					return false;
				}
			}
		}

		return chars.isEmpty();
	}

	public static void main(String args[]) {
		String[] casos = { "()", // Simple
				"{()[]}", // Anidado
				"{[()]()}", // Mixto
				"(((())))", // Profundo
				"([", // Incompleto (Par)
				"([)]", // Mal ordenado
				"{{}}]", // Sobra cierre
				")(", // Sentido opuesto
				"())(()" // Engañoso (Par y misma cant. de c/u)
		};

		System.out.println("--- PRUEBA DE BALANCEO ---");
		for (String s : casos) {
			boolean resultado = estaBalanceado(s);
			System.out.println(
					"Cadena: " + String.format("%-12s", s) + " | ¿Balanceado?: " + String.format("%-6s", resultado));
		}
	}
}
