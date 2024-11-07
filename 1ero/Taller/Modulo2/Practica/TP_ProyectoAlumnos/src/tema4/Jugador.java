/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public class Jugador extends Empleado {

    private int goles;
    private int partidos;

    public Jugador(String nombre, double sueldo, int antiguedad, int goles, int partidos) {
        super(nombre, sueldo, antiguedad);
        this.goles = goles;
        this.partidos = partidos;
    }

    public int getGoles() {
        return this.goles;
    }

    public int getPartidos() {
        return this.partidos;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    @Override
    public double calcularEfectividad() {
        return (double) goles / partidos;
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldoBasico = this.getSueldo() + (this.getSueldo() * this.getAntiguedad() / 100);
        if (this.calcularEfectividad() >= 0.5) {
            sueldoBasico += this.getSueldo();
        }
        return sueldoBasico;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux += "goles " + this.getGoles();
        aux += "partidos " + this.getPartidos();
        return aux;
    }
}
