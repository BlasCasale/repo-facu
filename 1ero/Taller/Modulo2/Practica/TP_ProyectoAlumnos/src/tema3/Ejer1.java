/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector;

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
public class Ejer1 {

    public static void main(String[] args) {
        System.out.println("Ingrese el largo del lado 1 del triangulo: ");
        double side1 = Lector.leerDouble();
        System.out.println("Ingrese el largo del lado 2 del triangulo: ");
        double side2 = Lector.leerDouble();
        System.out.println("Ingrese el largo del lado 3 del triangulo: ");
        double side3 = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno del triangulo: ");
        String fill = Lector.leerString();
        System.out.println("Ingrese el color de los bordes del triangulo: ");
        String border = Lector.leerString();
        Triangle triangle = new Triangle(side1, side2, side3, fill, border);
        
        System.out.println("El perimetro del triangulo es de " + triangle.getBorder());
        System.out.println("El area del triangulo es de " + triangle.calculateArea());
    }

}
