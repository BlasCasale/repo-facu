/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public class Circulo extends Figura {

    private double radio;

    public Circulo(double radio, String relleno, String borde) {
        super(relleno, borde);
        this.radio = radio;
    }

    public double getRadio() {
        return this.radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * (radio * radio);
    }

    @Override
    public double calcularPerimetro() {
        return Math.PI * (radio / 2);
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux += " " + this.getRadio();
        return aux;
    }
}
