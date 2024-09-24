/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GeneradorAleatorio;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author ASUS
 */
public class Generador {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println(GeneradorAleatorio.generarBoolean());
        System.out.println(GeneradorAleatorio.generarDouble(20)); // de 0 a 19
        System.out.println(GeneradorAleatorio.generarInt(20)); // idem
        System.out.println(GeneradorAleatorio.generarString(25)); // la long del String
    }
}
