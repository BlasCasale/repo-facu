/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Teoria;

public class Producto {

    private double precio = 100; // default
    private String nombre = "Arroz";
    private String descripcion = "Sin descripcions";

    // con esto se puede hacer overloading
    public Producto(String nombre, double precio) {
        this.nombre = nombre;
        this.precio = precio;
        // se podria no asignar nada a desc
    }

    public Producto(String nombre) {
        this.nombre = nombre;
    }

    public Producto() {

    }

    public double getPrecioConIva() {
        return this.precio * 1.21;
    }

    public double getPrecioFinal() {
        return this.precio * this.getPrecioConIva();
    }

    public double getPrecio() {
        return precio;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public boolean esCaro(double valor) {
        return precio > valor;
    }

    public void setPrecio(double valor) {
        precio = valor;
    }

    public void setNombre(String nueNom) {
        nombre = nueNom;
    }

    public void sumar(double valor) {
        valor++;
    }

    public void setDescripcion(String nueDesc) {
        descripcion = nueDesc;
    }

}
