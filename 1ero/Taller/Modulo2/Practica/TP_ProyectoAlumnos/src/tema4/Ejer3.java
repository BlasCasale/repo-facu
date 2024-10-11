package tema4;

import PaqueteLectura.Lector;
import tema2.Persona;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author ASUS
 */
public class Ejer3 {

    /**
     * @param args the command line arguments
     */
    /*
    3-A- Implemente las clases para el siguiente problema. Una garita de seguridad quiere
identificar los distintos tipos de personas que entran a un barrio cerrado. Al barrio pueden
entrar: personas, que se caracterizan por nombre, DNI y edad; y trabajadores, estos son
personas que se caracterizan además por la tarea realizada en el predio.
Implemente constructores, getters y setters para las clases. Además tanto las personas
como los trabajadores deben responder al mensaje toString siguiendo el formato:
▪ Personas “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
▪ Trabajadores “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años. Soy
jardinero.”
B- Realice un programa que instancie una persona y un trabajador y muestre la
representación de cada uno en consola.
NOTA: Reutilice la clase Persona (carpeta tema2).
     */
    public static void main(String[] args) {
        System.out.println("Ingrese el nombre de la persona: ");
        String nombre = Lector.leerString();
        System.out.println("Ingrese la edad de la persona: ");
        int edad = Lector.leerInt();
        System.out.println("Ingresar el DNI de la persona: ");
        int dni = Lector.leerInt();
        Persona vecino = new Persona(nombre, dni, edad);

        System.out.println("Ingrese el nombre del empleado: ");
        nombre = Lector.leerString();
        System.out.println("Ingrese la edad de la persona: ");
        edad = Lector.leerInt();
        System.out.println("Ingrese el DNI de la persona: ");
        dni = Lector.leerInt();
        System.out.println("Ingrese el puesto del trabajador: ");
        Trabajador empleado = new Trabajador(nombre, dni, edad, nombre);

        System.out.println(vecino.toString());
        System.out.println(empleado.toString());
    }

}
