/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author ASUS
 */
public class Triangulo extends Figura {

    private double lado1, lado2, lado3;

    public Triangulo(String relleno, String borde, double lado1, double lado2, double lado3) {
        super(relleno, borde);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public void setLados(double lado1, double lado2, double lado3) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public String getLados() {
        return "lado 1: " + lado1 + ", lado 2: " + lado2 + ", lado 3: " + lado3;
    }

    @Override
    public double calcularArea() {
        return lado1 * lado2 * lado3;
    }

    @Override
    public double calcularPerimetro() {
        return lado1 + lado2 + lado3;
    }

    @Override
    public String toString() {
        String aux = super.toString();
        aux += this.getLados();
        return aux;
    }
}
