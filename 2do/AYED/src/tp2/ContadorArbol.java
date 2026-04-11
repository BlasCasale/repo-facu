package tp2;

import java.util.LinkedList;
import java.util.List;

public class ContadorArbol {
	private BinaryTree<Integer> arbol;

	public ContadorArbol() {
		this.arbol = new BinaryTree<Integer>();
	}

	public ContadorArbol(int num) {
		this.arbol = new BinaryTree<Integer>(num);
	}

	public static boolean esPar(int n) {
		return n % 2 == 0;
	}

	public void recorridoInorden(BinaryTree<Integer> nodo, LinkedList<Integer> lista) {
		if (nodo == null || nodo.isEmpty()) {
			return;
		}

		if (nodo.hasLeftChild()) {
			recorridoInorden(nodo.getLeftChild(), lista);
		}

		if (esPar(nodo.getData())) {
			lista.add(nodo.getData());
		}

		if (nodo.hasRightChild()) {
			recorridoInorden(nodo.getRightChild(), lista);
		}
	}

	public void recorridoPostorden(BinaryTree<Integer> nodo, LinkedList<Integer> lista) {
		if (nodo == null || nodo.isEmpty()) {
			return;
		}

		if (nodo.hasLeftChild()) {
			recorridoInorden(nodo.getLeftChild(), lista);
		}

		if (nodo.hasRightChild()) {
			recorridoInorden(nodo.getRightChild(), lista);
		}

		if (esPar(nodo.getData())) {
			lista.add(nodo.getData());
		}

	}

	public LinkedList<Integer> numerosPares() {
		LinkedList<Integer> lista = new LinkedList<Integer>();

		this.recorridoInorden(this.arbol, lista);
		return lista;
	}
}
