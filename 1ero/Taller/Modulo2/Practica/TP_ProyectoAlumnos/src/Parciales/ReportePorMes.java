/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Parciales;

/**
 *
 * @author ASUS
 */
public class ReportePorMes extends Carrera {

    public ReportePorMes(String nombre, String facultad, int anioComienzo, int anios) {
        super(nombre, facultad, anioComienzo, anios);
    }

    @Override
    public String toString() {
        int tri1 = 0;
        int tri2 = 0;
        int tri3 = 0;
        int tri4 = 0;

        for (int i = 0; i < this.getDimF(); i++) {
            for (int j = 0; j < 4; j++) {
                if (j / 3 == 0) {
                    tri4 += this.getEgresados(i, j);
                } else if (j / 2 == 0) {
                    tri3 += this.getEgresados(i, j);
                } else if (j / 1 == 0) {
                    tri2 += this.getEgresados(i, j);
                } else {
                    tri1 += this.getEgresados(i, j);
                }
            }
        }

        return super.toString() + "\n"
                + "Trimestre 1: " + tri1 + " Trimestre 2: " + tri2 + " Trimestre 3:" + tri3 + " Trimestre 4:" + tri4;
    }
}
