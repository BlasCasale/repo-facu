package Parciales;

public class ReportePorAño extends Carrera {

    public ReportePorAño(String nombre, String facultad, int anioComienzo, int anios) {
        super(nombre, facultad, anioComienzo, anios);
    }

    @Override
    public String toString() {
        String aux = super.toString();

        for (int i = 0; i < this.getDimF(); i++) {
            int contador = 0;
            for (int j = 0; j < this.getDimF(); j++) {
                contador += this.getEgresados(i, j);
            }
            aux += "\n Año " + (this.getAnio() + i) + " - " + contador + " egresados";
        }
        return aux;
    }
}
