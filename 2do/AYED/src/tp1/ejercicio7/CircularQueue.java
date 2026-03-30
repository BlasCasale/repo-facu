package tp1.ejercicio7;

public class CircularQueue<T> extends Queue<T> {
	public T shift() {
		if (this.isEmpty()) {
			return null;
		}
		
		T dato = this.dequeue();
		
		this.enqueue(dato);
		
		return dato;
	}
}
