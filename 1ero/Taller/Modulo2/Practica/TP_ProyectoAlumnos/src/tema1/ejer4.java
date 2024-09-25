/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author ASUS
 */
public class ejer4 {

  /*
  Un edificio de oficinas está conformado por 8 pisos(1..8) y 4 oficinas por piso (1..4). 
  Realice un programa que permita informar la cantidad de personas que
  concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
  edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
  oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
  de piso 9. Al finalizar la llegada de personas, informe lo pedido.
   */
  public static void main(String[] args) {
    int cut = 9;
    int floors = 8;
    int offices = 4;
    int floor, office;
    int[][] building = new int[floors][offices];
    int i, j;

    System.out.println("Ingrese un piso: ");
    floor = Lector.leerInt();
    if (floor != cut) {
      System.out.println("Ingrese la oficina: ");
      office = Lector.leerInt();
      
      while (floor != cut) {
        building[floor - 1][office - 1] = building[floor - 1][office - 1] + 1;

        System.out.println("Ingrese un piso: ");
        floor = Lector.leerInt();
        
        if (floor != cut) {
          System.out.println("Ingrese la oficina: ");
          office = Lector.leerInt();
        }
      }
    }
    
    for (i = 0; i < floors; i++) {
      for (j= 0; j < offices; j++) System.out.println("Piso " + (i + 1) + " y oficina " + (j + 1) + " fueron " + building[i][j] + " personas.");
    }
  }
}
