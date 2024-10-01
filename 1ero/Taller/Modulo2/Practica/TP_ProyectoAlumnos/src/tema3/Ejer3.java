/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author ASUS
 */
public class Ejer3 {

    /**
     * @param args the command line arguments
     */
    /*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
     */
    public static void main(String[] args) {
        Shelf shelf = new Shelf();

        while (shelf.getItsFull()) {
            System.out.println("Ingrese el titulo del libro: ");
            String title = Lector.leerString();
            System.out.println("Ingrese el nombre del autor: ");
            String name = Lector.leerString();
            System.out.println("Ingrese la biografia del autor: ");
            String biografia = Lector.leerString();
            System.out.println("Ingrese el origen del autor: ");
            String origen = Lector.leerString();
            System.out.println("Ingrese la editorial del libro: ");
            String editorial = Lector.leerString();
            System.out.println("Ingrese el ISBN del libro: ");
            String isbn = Lector.leerString();

            Libro book = new Libro(title, editorial, name, biografia, origen, isbn);
            
            shelf.setBook(book);
        }
        
        if (shelf.searchBook("Mujercitas") != null) {
            System.out.println("Se encontro el libro Mujercitas");
        } else {
            System.out.println("No se encontro el libro Mujercitas");
        }
    }

}
