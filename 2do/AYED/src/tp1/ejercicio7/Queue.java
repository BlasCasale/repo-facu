package tp1.ejercicio7;

import java.util.LinkedList;
import java.util.List;

public class Queue<T> {
	protected List<T> data;
	
	public Queue() {
		this.data = new LinkedList<T>();
	}
	
	public void enqueue(T dato) {
		this.data.add(dato);
	}
	
	public T dequeue() {
		if (this.data.isEmpty()) {
			throw new RuntimeException("La cola esta vacia");
		}
		
		return this.data.remove(0);
	}
	
	public boolean isEmpty() {
		return this.data.isEmpty();
	}
	
	public int size() {
		return this.data.size();
	}
	
	public String toString() {
		return this.data.toString();
	}
}
