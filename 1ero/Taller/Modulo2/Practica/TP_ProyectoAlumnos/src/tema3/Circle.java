/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author ASUS
 */

/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI
 */
public class Circle {

    private double radius;
    private String colorStuffed, colorLine;

    public Circle() {

    }

    public Circle(String colorStuffed, String colorLine, double radius) {
        setColorStuffed(colorStuffed);
        setColorLine(colorLine);
        setRadius(radius);
    }

    public String getColorStuffed() {
        return this.colorStuffed;
    }

    public String getColorLine() {
        return this.colorLine;
    }

    public double getRadius() {
        return this.radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public void setColorStuffed(String colorStuffed) {
        this.colorStuffed = colorStuffed;
    }

    public void setColorLine(String colorLine) {
        this.colorLine = colorLine;
    }
}
