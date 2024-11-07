/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author ASUS
 */

/*
2- Queremos representar a los empleados de un club: jugadores y entrenadores.
▪ Cualquier empleado se caracteriza por su nombre, sueldo básico y antigüedad.
▪ Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.
▪ Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos
ganados.
A- Implemente la jerarquía de clases declarando atributos, métodos para
obtener/modificar su valor y constructores que reciban los datos necesarios.
B- Cualquier empleado debe responder al mensaje calcularEfectividad. La efectividad
del entrenador es el promedio de campeonatos ganados por año de antigüedad, mientras
que la del jugador es el promedio de goles por partido.
C- Cualquier empleado debe responder al mensaje calcularSueldoACobrar. El sueldo a
cobrar es el sueldo básico más un 10% del básico por cada año de antigüedad y además:
▪ Para los jugadores: si el promedio de goles por partido es superior a 0,5 se adiciona un
plus de otro sueldo básico.
▪ Para los entrenadores: se adiciona un plus por campeonatos ganados (5000$ si ha
ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
50.000$ si ha ganado más de 10 campeonatos).
D- Cualquier empleado debe responder al mensaje toString, que devuelve un String que
lo representa, compuesto por nombre, sueldo a cobrar y efectividad.
F- Realizar un programa que instancie un jugador y un entrenador. Informe la
representación String de cada uno.
NOTA: para cada método a implementar piense en que clase/s debe definir el método.
 */
public class Ejer2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Ingrese el nombre del entrenador: ");
        String nombre = Lector.leerString();
        System.out.println("Ingrese el sueldo basico del entrenador: ");
        double sueldo = Lector.leerDouble();
        System.out.println("Ingrese la antiguedad del entrenador: ");
        int antiguedad = Lector.leerInt();
        System.out.println("Ingrese los años de antiguedad del entrenador: ");
        int campeonatos = Lector.leerInt();

        Entrenador entrenador = new Entrenador(nombre, sueldo, antiguedad, campeonatos);

        System.out.println("Ingrese el nombre del jugador: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese el sueldo basico del jugador: ");
        sueldo = Lector.leerDouble();
        System.out.println("Ingrese la antiguedad del jugador: ");
        antiguedad = Lector.leerInt();
        System.out.println("Ingrese los partidos jugados por el jugador: ");
        int partidos = Lector.leerInt();
        System.out.println("Ingrese los goles que hizo el jugador: ");
        int goles = Lector.leerInt();

        Jugador jugador = new Jugador(nombre, sueldo, antiguedad, goles, partidos);

        System.out.println(entrenador.toString());
        System.out.println(jugador.toString());
    }

}
