/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public abstract class Estacion {

    private String nombre;
    private double latitud, longitud;

    public Estacion(String nombre, double longitud, double latitud) {
        this.nombre = nombre;
        this.longitud = longitud;
        this.latitud = latitud;
    }

    public String getNombre() {
        return this.nombre;
    }

    public double getLatitud() {
        return this.latitud;
    }

    public double getLongitud() {
        return this.longitud;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public abstract void registrarTempereratura(int anio, int mes, double temp);

    public abstract double obtenerTemperatura(int anio, int mes);

    public abstract String obtenerMaxTemp();

    @Override
    public String toString() {
        return this.nombre + ": (" + this.latitud + "S) - (" + this.longitud + " O);";
    }
}
