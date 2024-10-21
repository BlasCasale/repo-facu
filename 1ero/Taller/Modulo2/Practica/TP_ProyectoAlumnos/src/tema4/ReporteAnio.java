/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public class ReporteAnio extends Reporte {

    public ReporteAnio(String nombre, double longitud, double latitud, int anios) {
        super(nombre, longitud, latitud, anios);
    }

    public double promedioAño(int anio) {
        double promedio = 0;

        for (int i = 0; i < this.getMeses(); i++) {
            promedio += super.obtenerTemperatura(anio, i);
        }

        return (double) promedio / 12;
    }

    public void promedioDeTodosLosAños() {
        for (int i = 0; i < this.getAnios(); i++) {
            double promedio = this.promedioAño(i);
            System.out.println("En el año " + (this.getAnio() + i) + " el promedio fue de " + promedio);
        }
    }
}
