/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public abstract class Reporte extends Estacion {

    private int meses = 12;
    private int anios;
    private int anio;
    private double[][] temperaturas = new double[anios][meses];

    public Reporte(String nombre, double longitud, double latitud, int anios) {
        super(nombre, longitud, latitud);
        this.anios = anios;
    }

    public int getAnios() {
        return this.anios;
    }

    public void setAnios(int anios) {
        this.anios = anios;
    }

    public int getAnio() {
        return this.anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getMeses() {
        return this.meses;
    }

    @Override
    public void registrarTempereratura(int anio, int mes, double temp) {
        temperaturas[anio][mes] = temp;
    }

    @Override
    public double obtenerTemperatura(int anio, int mes) {
        return temperaturas[anio][mes];
    }

    @Override
    public String obtenerMaxTemp() {
        int i, j;
        int anioMax = 0;
        int mesMax = 0;
        double max = -1000;
        for (i = 0; i < anios; i++) {
            for (j = 0; j < meses; j++) {
                if (obtenerTemperatura(i, j) > max) {
                    max = obtenerTemperatura(i, j);
                    anioMax = i;
                    mesMax = i;
                }
            }
        }
        anioMax += anio;
        mesMax += 1;
        return anioMax + " " + mesMax + " y su maxima temperatura fue de " + max;
    }
}
