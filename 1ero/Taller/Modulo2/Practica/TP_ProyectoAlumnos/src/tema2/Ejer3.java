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
        String cut = "ZZZ";
        Persona[][] interviews = new Persona[days][inter];
        String name;
        int age, dni;
        int dimL = 0;
        int i = 0;
        int j = 0;
        System.out.println("Ingrese el nombre del entrevistado: ");
        name = Lector.leerString();

        while ((dimL < (days * inter)) && (!name.equals(cut))) {
            System.out.println("Ingrese la edad del entrevistado: ");
            age = Lector.leerInt();
            System.out.println("Ingrese el DNI del entrevistado: ");
            dni = Lector.leerInt();
            interviews[i][j] = new Persona(name, dni, age);
            j++;
            dimL++;
            if (j == inter) {
                j = 0;
                if (i < days) {
                    i++;
                }
            }
        }
        
        if (dimL != 0) {
            i = 0;
            j = 0;
            int k = 0;

            while (k <= dimL) {
                System.out.println(interviews[i][j].toString());
                j++;
                k++;
                if (j == inter) {
                    j = 0;
                    if (i < days) {
                        i++;
                    }
                }
            }
        }
    }
}
