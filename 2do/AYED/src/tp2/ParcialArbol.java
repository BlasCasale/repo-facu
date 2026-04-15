package tp2;

import tp1.ejercicio7.Queue;

public class ParcialArbol {
	private BinaryTree<Integer> arbol;

	public ParcialArbol() {
		this.arbol = new BinaryTree<Integer>();
	}

	public ParcialArbol(int num) {
		this.arbol = new BinaryTree<Integer>(num);
	}

	public BinaryTree<Integer> buscarNodo(BinaryTree<Integer> a, int num) {
		if (a == null || a.isEmpty())
			return null;

		if (a.getData() == num)
			return a;

		BinaryTree<Integer> res = buscarNodo(a.getLeftChild(), num);
		if (res == null) {
			res = buscarNodo(a.getRightChild(), num);
		}
		return res;
	}

	public int conteoHijo(BinaryTree<Integer> arbol, int num) {
		if (arbol == null || arbol.isEmpty()) {
			return 0;
		}

		if (!arbol.hasLeftChild() && !arbol.hasRightChild()) {
			return 0;
		}

		int cont = 0;

		if (arbol.hasLeftChild()) {
			// este hijo se que existe entonces pregunto si el NO tiene el otro
			cont += conteoHijo(arbol.getLeftChild(), num);
			if (!arbol.hasRightChild()) {
				cont++;
			}
		}

		if (arbol.hasRightChild()) {
			// este hijo se que existe entonces pregunto si el NO tiene el otro
			cont += conteoHijo(arbol.getRightChild(), num);
			if (!arbol.hasLeftChild()) {
				cont++;
			}
		}

		return cont;
	}

	public boolean isLeftTree(int num) {
		BinaryTree<Integer> nuevoArbol = buscarNodo(arbol, num);

		if (nuevoArbol == null) {
			return false;
		}

		int hijosIzq = 0;
		int hijosDer = 0;

		if (nuevoArbol.hasLeftChild()) {
			hijosIzq = conteoHijo(nuevoArbol.getLeftChild(), num);
		}

		if (nuevoArbol.hasRightChild()) {
			hijosDer = conteoHijo(nuevoArbol.getRightChild(), num);
		}

		return hijosIzq > hijosDer;
	}

	public boolean esPrefijo(BinaryTree<Integer> arbol1, BinaryTree<Integer> arbol2) {
		Queue<BinaryTree<Integer>> colaArbol1 = new Queue<BinaryTree<Integer>>();
		Queue<BinaryTree<Integer>> colaArbol2 = new Queue<BinaryTree<Integer>>();

		colaArbol1.enqueue(arbol1);
		colaArbol2.enqueue(arbol2);

		while (!colaArbol1.isEmpty() && !colaArbol2.isEmpty()) {
			arbol1 = colaArbol1.dequeue();
			arbol2 = colaArbol2.dequeue();

			if (arbol1 != null && arbol2 != null) {

				if (!arbol1.getData().equals(arbol2.getData())) {
					return false;
				}

				if (arbol1.hasLeftChild()) {
					if (arbol2.hasLeftChild()) {
						colaArbol1.enqueue(arbol1.getLeftChild());
						colaArbol2.enqueue(arbol2.getLeftChild());
					} else {
						return false;
					}
				}

				if (arbol1.hasRightChild()) {
					if (arbol2.hasRightChild()) {
						colaArbol1.enqueue(arbol1.getRightChild());
						colaArbol2.enqueue(arbol2.getRightChild());
					} else {
						return false;
					}
				}

			}
		}

		return true;
	}
	
	public BinaryTree<SumDif> sumAndDif(BinaryTree<Integer> arbol) {
		BinaryTree<SumDif> nuevoArbol = new BinaryTree<SumDif>();
		
		this.auxiliar(arbol, nuevoArbol, 0);
		
		return nuevoArbol;
	}
	
	public void auxiliar(BinaryTree<Integer> arbol, BinaryTree<SumDif> nuevoArbol, int valorPadre) {
		if (arbol == null || arbol.isEmpty()) {
			return;
		}
		
		int actual = arbol.getData();
		int suma = actual + valorPadre;
		int diferencia = actual - valorPadre;
		
		nuevoArbol.setData(new SumDif(suma, diferencia));
		
		if (arbol.hasLeftChild()) {
			nuevoArbol.addLeftChild(new BinaryTree<SumDif>());
			auxiliar(arbol.getLeftChild(), nuevoArbol.getLeftChild(), actual);
		}
		
		if (arbol.hasRightChild()) {
			nuevoArbol.addRightChild(new BinaryTree<SumDif>());
			auxiliar(arbol.getRightChild(), nuevoArbol.getRightChild(), actual);
		}
	}

}
