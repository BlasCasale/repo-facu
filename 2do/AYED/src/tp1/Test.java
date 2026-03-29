package tp1;

public class Test {

	public static void main(String[] args) {
		Estudiante[] estudiantes = new Estudiante[2];
		Profesor[] profesores = new Profesor[3];

		for (int i = 0; i < estudiantes.length; i++) {
			estudiantes[i] = new Estudiante();
		}

		for (int i = 0; i < profesores.length; i++) {
			profesores[i] = new Profesor();
		}

		estudiantes[0].setApellido("casale");
		estudiantes[0].setNombre("Blas");
		estudiantes[0].setComision(1);
		estudiantes[0].setEmail("mail@mail");
		estudiantes[0].setDireccion("calle falsa");

		estudiantes[1].setApellido("casale");
		estudiantes[1].setNombre("Blas");
		estudiantes[1].setComision(1);
		estudiantes[1].setEmail("mail@mail");
		estudiantes[1].setDireccion("calle falsa");

		profesores[0].setApellido("Casale");
		profesores[0].setNombre("Blas");
		profesores[0].setCatedra("AYED");
		profesores[0].setFacultad("Informática");
		profesores[0].setEmail("mail@mail");

		profesores[1].setApellido("Casale");
		profesores[1].setNombre("Blas");
		profesores[1].setCatedra("AYED");
		profesores[1].setFacultad("Informática");
		profesores[1].setEmail("mail@mail");

		profesores[2].setApellido("Casale");
		profesores[2].setNombre("Blas");
		profesores[2].setCatedra("AYED");
		profesores[2].setFacultad("Informática");
		profesores[2].setEmail("mail@mail");
		
		for (Profesor profesor : profesores) {
			System.out.println(profesor.tusDatos());
		}
		
		for (Estudiante estudiante : estudiantes) {
			System.out.println(estudiante.tusDatos());
		}
	}
}
