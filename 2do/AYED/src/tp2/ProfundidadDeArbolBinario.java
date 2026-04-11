package tp2;

import tp1.ejercicio7.Queue;

public class ProfundidadDeArbolBinario {
	private BinaryTree<Integer> arbol;

	public ProfundidadDeArbolBinario() {
		this.arbol = new BinaryTree<Integer>();
	}

	public ProfundidadDeArbolBinario(int num) {
		this.arbol = new BinaryTree<Integer>(num);
	}

	public int sumaElementosProfundidad(int p) {
		int suma = 0;

		Queue<BinaryTree<Integer>> cola = new Queue<BinaryTree<Integer>>();

		if (this.arbol != null && !this.arbol.isEmpty()) {
			cola.enqueue(this.arbol);
			cola.enqueue(null);
		}

		int nivel = 0;

		while (!cola.isEmpty() && nivel <= p) {
			BinaryTree<Integer> aux = cola.dequeue();

			if (aux != null) {
				if (p == nivel) {
					suma += aux.getData();
				}

				if (aux.hasLeftChild()) {
					cola.enqueue(aux.getLeftChild());
				}

				if (aux.hasRightChild()) {
					cola.enqueue(aux.getRightChild());
				}
			} else {
				nivel++;
				if (!cola.isEmpty()) {
					cola.enqueue(null);
				}
			}
		}

		return suma;
	}
}
