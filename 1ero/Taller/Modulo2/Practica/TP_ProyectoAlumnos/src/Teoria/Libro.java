/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Teoria;

/**
 *
 * @author ASUS
 */
public class Libro {

    int anio;
    String descripcion;
    Autor autor = new Autor("Galeano", "Escritor latino");

    public Libro(int anio, Autor autor, String descripcion) {
        this.anio = anio;
        this.autor = autor;
        this.descripcion = descripcion;
    }
}
