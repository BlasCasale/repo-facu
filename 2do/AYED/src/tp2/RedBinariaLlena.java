package tp2;

public class RedBinariaLlena {
	private BinaryTree<Integer> arbol;

	public RedBinariaLlena() {
		this.arbol = new BinaryTree<Integer>();
	}

	public RedBinariaLlena(int num) {
		this.arbol = new BinaryTree<Integer>(num);
	}

	public int recorridoArbol(BinaryTree<Integer> arbol) {
		if (arbol == null || arbol.isEmpty()) {
			return 0;
		}
		int izq = 0;
		int der = 0;
		if (arbol.hasLeftChild()) {
			izq = recorridoArbol(arbol.getLeftChild());
		}

		int raiz = arbol.getData();

		if (arbol.hasRightChild()) {
			der = recorridoArbol(arbol.getRightChild());
		}

		return raiz += Math.max(izq, der);
	}

	public int retardoReenvio() {
		int retorno = recorridoArbol(this.arbol);
		return retorno;
	}

}
