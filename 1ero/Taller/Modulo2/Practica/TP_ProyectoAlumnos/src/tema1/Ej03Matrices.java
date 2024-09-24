/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimF = 5;
        int[][] matriz = new int[dimF][dimF];
        int i, j;
        int[] vec = new int[dimF];
        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimF; matriz[i][j++] = GeneradorAleatorio.generarInt(30));
        }

        for (i = 0; i < dimF; i++) {
            for (j = 0; j < dimF; System.out.println(matriz[i][j++]));
        }

        int acc = 0;
        for (j = 0; j < dimF; j++) {
            acc = acc + matriz[0][j];
        }
        System.out.println("Sumatoria: " + acc);

        for (i = 0; i < dimF; i++) {
            int accR = 0;
            for (j = 0; j < dimF; j++) {
                accR = accR + matriz[i][j];
            }
            vec[i] = accR;
        }

        for (i = 0; i < dimF; System.out.println(vec[i++]));

        System.out.println("Ingrese un num a buscar: ");
        int readed = Lector.leerInt();
        i = 0;
        boolean ok = false;
        while ((i < dimF) && (!ok)) {
            j = 0;
            while ((j < dimF) && (!ok)) {
                if (readed == matriz[i][j]) {
                    ok = !ok;
                }
                j++;
            }
            if (!ok) i++;
        }
        
        if (ok) System.out.println("Se encontro en la fila " + i + " y la columna " + j);
        else System.out.println("No se encontro");
        //Paso 2. iniciar el generador aleatorio     
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        //Paso 4. mostrar el contenido de la matriz en consola
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
    }
}
