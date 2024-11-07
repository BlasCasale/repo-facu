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
public class Room {

    private Persona client;
    private int cost = (int) (Math.random() * 10000);
    private boolean busy = false;

    public Room() {

    }

    public Room(String name, int dni, int age) {
        this.client = new Persona(name, dni, age);
        this.busy = true;
    }

    public String getClient() {
        return client.toString();
    }

    public int getCost() {
        return cost;
    }

    public boolean getBusy() {
        return busy;
    }

    public void setClient(Persona client) {
        this.client = client;
    }

    public void setAddCost(int cost) {
        this.cost += cost;
    }

}
