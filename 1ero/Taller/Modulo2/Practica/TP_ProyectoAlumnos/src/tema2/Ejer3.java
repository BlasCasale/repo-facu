/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author ASUS
 */
public class Ejer3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*
            3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
            cada día se entrevistarán a 8 personas en distinto turno.
            a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
            nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
            personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
            siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
            40 cupos de casting.
            Una vez finalizada la inscripción:
            b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
            NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
            Strings use el método equals.
         */
        int days = 5;
        int inter = 8;
        Persona[][] interviews = new Persona[days][inter];
        String name;
        int age, dni;
        int i = 0;
        int j = 0;
        System.out.println("Ingrese el nombre del entrevistado: ");
        name = Lector.leerString();
        
        System.out.println("");
    }

}
