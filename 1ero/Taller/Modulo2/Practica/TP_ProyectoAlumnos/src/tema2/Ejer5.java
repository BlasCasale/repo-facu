/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;

import PaqueteLectura.Lector;

public class Ejer5 {

    public static void main(String[] args) {
        /*
        5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
        encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
        valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
        nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
        partido sabe responder a los siguientes mensajes:
        
        Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
        el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
        nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
        - Para cada partido, armar e informar una representación String del estilo:
        {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
        - Calcular e informar la cantidad de partidos que ganó River.
        - Calcular e informar el total de goles que realizó Boca jugando de local
         */
        int dimF = 20;
        Partido[] games = new Partido[dimF];
        int dimL = 0;
        System.out.println("Ingrese el nombre del visitante: ");
        String nameV = Lector.leerString();

        while ((!nameV.equals("ZZZ")) && (dimL < dimF)) {
            System.out.println("Ingrese los goles que hizo el visitante: ");
            int goalsV = Lector.leerInt();
            System.out.println("Ingrese el nombre del local: ");
            String nameL = Lector.leerString();
            System.out.println("Ingrese los goles que hizo el local: ");
            int goalsL = Lector.leerInt();
            games[dimL] = new Partido(nameL, nameV, goalsL, goalsV);
            dimL++;
            System.out.println("Ingrese el nombre del visitante: ");
            nameV = Lector.leerString();
        }

        int riverWons = 0;
        int goalsBoca = 0;

        for (int i = 0; i < dimL; i++) {
            String msg = games[i].getLocal() + " " + games[i].getGolesLocal() + " - ";
            msg += games[i].getGolesVisitante() + " " + games[i].getVisitante();

            System.out.println(msg);

            String winner = games[i].getGanador();

            if (winner.equals("River")) {
                riverWons++;
            }

            if (games[i].getLocal().equals("Boca")) {
                goalsBoca++;
            } else if (games[i].getVisitante().equals("Boca")) {
                goalsBoca++;
            }
        }

        System.out.println("River gano " + riverWons + " partidos");
        System.out.println("Boca hizo " + goalsBoca + " goles");
    }

}
