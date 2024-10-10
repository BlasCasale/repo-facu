/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public abstract class Empleado {

    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        setNombre(nombre);
        setSueldo(sueldo);
        setAntiguedad(antiguedad);
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    private void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return this.nombre;
    }

    public double getSueldo() {
        return this.sueldo;
    }

    public int getAntiguedad() {
        return this.antiguedad;
    }

    public abstract double calcularEfectividad();

    public abstract double calcularSueldoACobrar();

    @Override
    public String toString() {
        String aux = "nombre: " + this.getNombre()
                + " sueldo: " + this.calcularSueldoACobrar()
                + " antiguedad: " + this.getAntiguedad()
                + " efectividad: " + this.calcularEfectividad();
        return aux;
    }
}
