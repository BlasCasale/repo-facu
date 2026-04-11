package tp2;

public class Transformacion {
	private BinaryTree<Integer> arbol;

	public Transformacion() {
		this.arbol = new BinaryTree<Integer>();
	}

	public Transformacion(int num) {
		this.arbol = new BinaryTree<Integer>(num);
	}

	public BinaryTree<Integer> postorden(BinaryTree<Integer> arbol) {
		if (arbol.isLeaf() && arbol != null) {
			BinaryTree<Integer> aux = new BinaryTree<Integer>(arbol.getData());
			arbol.setData(0);
			return aux;
		}
		
		BinaryTree<Integer> izq = new BinaryTree<Integer>();
		BinaryTree<Integer> der = new BinaryTree<Integer>();
		
		if (arbol.hasLeftChild()) {
			izq = postorden(arbol.getLeftChild());
		}
		
		if (arbol.hasRightChild()) {
			der = postorden(arbol.getRightChild());
		}
		
		int sum = 0;
		int original = arbol.getData();
		
		if (izq != null && !izq.isEmpty()) {
			sum += izq.getData();
		}
		
		if (der != null && !der.isEmpty()) {
			sum += der.getData();
		}
		
		arbol.setData(sum);
		
		return new BinaryTree<Integer>(original+sum);
	}

	public BinaryTree<Integer> suma() {
		return postorden(this.arbol);
	}
}
