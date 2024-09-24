package tema1;

import PaqueteLectura.Lector;
//Paso 1: Importar la funcionalidad para lectura de datos

public class Ej02Jugadores {

    public static void main(String[] args) {
        int dimF = 15;
        double[] vec;
        vec = new double[dimF];
        
        int i;
        double average = 0;
        int total = 0;
        
        for (i = 0; i < dimF; i++) {
            double height;
            System.out.println("Ingrese una altura: ");
            height = Lector.leerDouble();
            vec[i] = height;
            average = average + height;
        }
        
        average = (double) average / dimF;
        
        for (i = 0; i < dimF; i++) {
            if (vec[i] > average) total = total + 1;
        }
        System.out.println(average);
        System.out.println("Cant de mayores del prom " + total);
        //Paso 2: Declarar la variable vector de double 

        //Paso 3: Crear el vector para 15 double 
        //Paso 4: Declarar indice y variables auxiliares a usar
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        //Paso 7: Calcular el promedio de alturas, informarlo
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        //Paso 9: Informar la cantidad.
    }

}
