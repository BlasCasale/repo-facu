/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y 𝑠 = 𝑎+𝑏+𝑐 . La función raíz cuadrada es Math.sqrt(#)
 */
public class Triangle {

    private double side1, side2, side3;
    private String fill, border;

    public Triangle(double side1, double side2, double side3, String fill, String border) {
        this.side1 = side1;
        this.side2 = side2;
        this.side3 = side3;
        this.fill = fill;
        this.border = border;
    }

    public Triangle() {

    }

    public double getSide1() {
        return side1;
    }

    public double getSide2() {
        return side2;
    }

    public double getSide3() {
        return side3;
    }

    public String getFill() {
        return fill;
    }

    public String getBorder() {
        return border;
    }

    public void setSide1(double side1) {
        this.side1 = side1;
    }

    public void setSide2(double side2) {
        this.side2 = side2;
    }

    public void setSide3(double side3) {
        this.side3 = side3;
    }

    public void setFill(String fill) {
        this.fill = fill;
    }

    public void setBorder(String border) {
        this.border = border;
    }

    public double calculatePerimeter() {
        return side1 + side2 + side3;
    }

    public double calculateArea() {
        return Math.sqrt((side1 + side2 + side3) / 2);
    }
}
