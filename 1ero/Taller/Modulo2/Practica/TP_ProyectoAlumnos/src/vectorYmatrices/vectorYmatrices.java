/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vectorYmatrices;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author ASUS
 */
public class vectorYmatrices {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        // los arreglos guardan elementos del mismo tipo
        // son estructuras de datos homogeneas
        // tambien tienen dimF (se declara al crearlo)y dimL
        // se determina en tiempo de ejecucion
        // puede determinarse con lectura de teclado
        // index entero y siempre de 0
        int[] nums; // esta variable va a tener un arreglo de int
        int[] num = new int[9]; //asi se crea con dimF tambien
        nums = new int[10];
        System.out.println(nums[1]);
        System.out.println(num[3]);

        for (int i = 0; i < num.length; num[i++] = 1 + GeneradorAleatorio.generarInt(30));
        
        for (int i = 0; i < num.length; System.out.println(num[i++]));

        String[][] aula1 = new String[5][9];

        //  aula1[0][0] = "Pepe";
        //  aula1[3][8] = "Pedrito";
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 8; j++) {
                aula1[i][j] = GeneradorAleatorio.generarString(6);
            }
        }

        for (int i = 0; i < 5; i++) {
            System.out.println("----");
            for (int j = 0; j < 8; j++) {
                System.out.print(aula1[i][j] + " | ");
            }
            System.out.println("----");
        }
    }
}
