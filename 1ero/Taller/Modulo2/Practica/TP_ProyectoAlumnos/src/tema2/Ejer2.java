/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author ASUS
 */
public class Ejer2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dimF = 15;
        int maxAge = 65;
        int moreThan65 = 0;
        Persona[] vec = new Persona[dimF];
        int i = 0;
        int j;
        int age, dni;
        String name;

        System.out.println("Ingrese su edad: ");
        age = Lector.leerInt();

        while ((age != 0) && (i < dimF)) {
            System.out.println("Ingrese el dni: ");
            dni = Lector.leerInt();
            System.out.println("Ingrese el nombre: ");
            name = Lector.leerString();
            vec[i] = new Persona(name, dni, age);
            i++;
            System.out.println("Ingrese su edad: ");
            age = Lector.leerInt();
        }
        Persona people = new Persona();
        int max = 99;
        for (j=0; j < i; j++){
            if (vec[j].getEdad() > maxAge) moreThan65 = moreThan65 + 1;
            if (vec[j].getEdad() < max) people = vec[j];
        }
        
        System.out.println("La cantidad de personas mayores de 65 son " + moreThan65);
        
        if (people != null) people.toString();
    }

}
