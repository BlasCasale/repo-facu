/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public class Entrenador extends Empleado {

    private int campeonatos;

    public Entrenador(String nombre, double sueldo, int antiguedad, int campeonatos) {
        super(nombre, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return this.campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    @Override
    public double calcularEfectividad() {
        return (double) campeonatos / this.getAntiguedad();
    }

    @Override
    public double calcularSueldoACobrar() {
        double sueldoBasico = this.getSueldo() + (this.getSueldo() * this.getAntiguedad() / 100);
        if (this.campeonatos >= 1 && this.campeonatos <= 4) {
            sueldoBasico += 5000;
        } else if (this.campeonatos >= 5 && this.campeonatos <= 10) {
            sueldoBasico += 30000;
        } else if (this.campeonatos > 10) {
            sueldoBasico += 50000;
        }
        return sueldoBasico;
    }
}
