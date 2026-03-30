package tp1.ejercicio7;

public class DoubleEndedQueue<T> extends Queue<T>{
	
	public void enqueueFirst(T dato) {
		this.data.add(0, dato);
	}

}
