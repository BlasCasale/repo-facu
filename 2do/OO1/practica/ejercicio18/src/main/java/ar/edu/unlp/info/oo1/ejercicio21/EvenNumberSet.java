package ar.edu.unlp.info.oo1.ejercicio21;

import java.util.Collection;
import java.util.HashSet;

public class EvenNumberSet extends HashSet<Integer> {

	@Override
	public boolean add(Integer num) {
		if (num != null && num % 2 == 0) {
			super.add(num);
			return true;
		}
		return false;
	}

	@Override
	public boolean addAll(Collection<? extends Integer> c) {
		if (c == null) {
			return false;
		}

		int tamañoInicial = size();

		c.stream().filter(num -> num != null && num % 2 == 0).forEach(this::add);

		return size() > tamañoInicial;
	}

}
