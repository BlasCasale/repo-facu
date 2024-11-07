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
public class Ejer4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        /*
            4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
            a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
            y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
            siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
            La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
            casting.
            Una vez finalizada la inscripción:
            b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
            persona a entrevistar en cada turno asignado.
         */
        int days = 5;
        int inter = 8;
        String cut = "ZZZ";
        Persona[][] interviews = new Persona[days][inter];
        String name;
        int age, dni;
        int dimL = 0;
        System.out.println("Ingrese el nombre del entrevistado: ");
        name = Lector.leerString();
        int j;

        while ((dimL < (days * inter)) && (!name.equals(cut))) {
            j = 0;
            System.out.println("Ingrese el dia que quiere inscribir a la persona: ");
            int day = Lector.leerInt();

            while ((j < inter) && (interviews[day][j] != null)) {
                j++;
            }

            if ((j <= (inter - 1)) && (interviews[day][j] == null)) {
                System.out.println("Ingrese la edad del entrevistado: ");
                age = Lector.leerInt();
                System.out.println("Ingrese el DNI del entrevistado: ");
                dni = Lector.leerInt();
                interviews[day][j] = new Persona(name, dni, age);
                j++;
                dimL++;
                if (j == inter) {
                    j = 0;
                }
            } else {
                System.out.println("No se puede inscribir un participante ese dia");
            }

        }

        if (dimL != 0) {
            int i = 0;
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
