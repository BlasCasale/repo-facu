/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

import tema2.Persona;

/**
 *
 * @author ASUS
 */
public class Trabajador extends Persona {

    private String puesto;

    public Trabajador(String nombre, int dni, int edad, String puesto) {
        super(nombre, dni, edad);
        this.puesto = puesto;
    }

    public String getPuesto() {
        return this.puesto;
    }

    public void setPuesto(String puesto) {
        this.puesto = puesto;
    }

    @Override
    public String toString() {
        String aux = super.toString() + " su puesto es " + this.getPuesto();
        return aux;
    }
}
