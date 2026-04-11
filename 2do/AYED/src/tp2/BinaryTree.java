package tp2;

import tp1.ejercicio7.Queue;

public class BinaryTree<T> {

	private T data;
	private BinaryTree<T> leftChild;
	private BinaryTree<T> rightChild;

	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * 
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}

	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * 
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty() {
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());
	}

	public boolean hasLeftChild() {
		return this.leftChild != null;
	}

	public boolean hasRightChild() {
		return this.rightChild != null;
	}

	@Override
	public String toString() {
		return this.getData().toString();
	}

	public int contarHojas() {
		if (this.isEmpty()) {
			return 0;
		}

		if (this.isLeaf()) {
			return 1;
		}

		int cant = 0;

		if (this.hasLeftChild()) {
			cant += this.getLeftChild().contarHojas();
		}

		if (this.hasRightChild()) {
			cant += this.getRightChild().contarHojas();
		}

		return cant;
	}

	public BinaryTree<T> espejo() {

		if (this.isEmpty()) {
			return new BinaryTree<T>();
		}

		BinaryTree<T> nuevoNodo = new BinaryTree<T>(this.getData());

		if (this.hasLeftChild()) {
			nuevoNodo.addRightChild(this.leftChild.espejo());
		}

		if (this.hasRightChild()) {
			nuevoNodo.addLeftChild(this.rightChild.espejo());
		}

		return nuevoNodo;
	}

	// 0<=n<=m
	public void entreNiveles(int n, int m) {
		int nivel = 0;
		Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
		cola.enqueue(this);
		cola.enqueue(null);
		while (!cola.isEmpty() && nivel <= m) {
			BinaryTree<T> aux = cola.dequeue();

			if (aux != null) {
				if (n <= nivel && nivel <= m) {
					System.out.println("imprimiendo el dato: " + aux.toString());
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
	}

}
