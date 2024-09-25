/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author casal
 */

/*

El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto

 */
public class ejer5 {

  public static void main(String[] args) {
    int clients = 5;
    int categories = 4;
    int[][] qualifications = new int[clients][categories];

    int i, j, point;

    for (i = 0; i < clients; i++) {
      for (j = 0; j < categories; j++) {
        System.out.println("Ingrese el puntaje de la categoria " + j + ":");
        point = Lector.leerInt();
        qualifications[i][j] = point;
      }
    }

    double average = 0;

    for (j = 0; j < categories; j++) {
      for (i = 0; i < clients; i++) {
        average = qualifications[i][j] + average;
      }
      average = (double) average / 5;
      System.out.println("El promedio de puntaje de la categoría " + j + " es de " + average);
    }
  }
}
