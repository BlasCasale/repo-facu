/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PruebaLector;

import PaqueteLectura.Lector;

/**
 *
 * @author ASUS
 */
public class PruebaLector {

    public static void main(String[] args) {
        System.out.println("Nombre: ");
        String name = Lector.leerString();
        System.out.println("Boolean: ");
        boolean ok = Lector.leerBoolean();
        System.out.println("Integer: ");
        int num = Lector.leerInt();
        System.out.println("Real: ");
        double real = Lector.leerDouble();
    }
}
