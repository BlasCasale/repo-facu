/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author ASUS
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
public class Shelf {

    private int max = 20;
    private Libro[] shelf = new Libro[max];
    private int length = 0;

    public Shelf() {

    }

    public int getLength() {
        int i = 0;

        while (shelf[i] != null) {
            i++;
        }

        return this.length = i;
    }

    public boolean getItsFull() {
        return (getLength() == max);
    }

    public void setBook(Libro book) {
        int i = getLength();
        if (i < max) {
            shelf[i] = book;
            length++;
        }
    }

    public Libro getBook(int i) {
        return shelf[i];
    }

    public int getMaxLength() {
        return max;
    }

    public Libro searchBook(String title) {
        Libro founded = new Libro();

        int i = 0;
        boolean ok = false;
        while ((shelf[i] != null) && (!ok)) {
            if (shelf[i].getTitulo().equals(title)) {
                ok = !ok;
                founded = shelf[i];
            }
            i++;
        }
        return founded;
    }
}
