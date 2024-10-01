/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import tema2.Persona;

/**
 *
 * @author ASUS
 */
public class Hotel {

    /*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 2000
y 8000.
(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está
en el rango 1..N) y que la habitación está libre.
- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato:
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada}
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones,
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe
delegar la responsabilidad de la operación.
     */
    private int rooms = 30;
    private Room[] hotel = new Room[rooms];

    public Hotel() {

    }

    public Room getRoom(int i) {
        return hotel[i];
    }

    public void setRoom(Room room, int i) {
        hotel[i] = room;
    }

    public void increaseCost(int cost) {
        for (int i = 0; i < rooms; i++) {
            hotel[i].setAddCost(cost);
        }
    }

    public void printHotel() {
        for (int i = 0; i < rooms; i++) {
            if (hotel[i].getBusy()) {
                String aux = "Habitacion " + i + ": su costo es de " + hotel[i].getCost();
                aux += " " + hotel[i].getClient();
                System.out.println(aux);
            } else {
                String aux = "Habitacion " + i + ": su costo es de " + hotel[i].getCost();
                System.out.println(aux);
            }
        }
    }
}
