/*
Clase Libro a la cual se agregaron constructores. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Libro {

    private String titulo;
    private Author autor;
    private String editorial;
    private int añoEdicion;
    private String ISBN;
    private double precio;

    public Libro(String unTitulo, String unaEditorial,
            int unAñoEdicion, String nombreAutor, String biografiaAutor, String origen, String unISBN, double unPrecio) {
        titulo = unTitulo;
        editorial = unaEditorial;
        añoEdicion = unAñoEdicion;
        autor = new Author(nombreAutor, biografiaAutor, origen);
        ISBN = unISBN;
        precio = unPrecio;
    }

    public Libro(String unTitulo, String unaEditorial, String nombreAutor, String biografiaAutor, String origen, String unISBN) {
        titulo = unTitulo;
        editorial = unaEditorial;
        añoEdicion = 2015;
        autor = new Author(nombreAutor, biografiaAutor, origen);
        ISBN = unISBN;
        precio = 100;
    }

    public Libro() {

    }

    public String getTitulo() {
        return titulo;
    }

    public String getEditorial() {
        return editorial;
    }

    public int getAñoEdicion() {
        return añoEdicion;
    }

    public String getPrimerAutor() {
        return autor.toString();
    }

    public String getISBN() {
        return ISBN;
    }

    public double getPrecio() {
        return precio;
    }

    public void setTitulo(String unTitulo) {
        titulo = unTitulo;
    }

    public void setEditorial(String unaEditorial) {
        editorial = unaEditorial;
    }

    public void setAñoEdicion(int unAño) {
        añoEdicion = unAño;
    }

    public void setPrimerAutor(String nombreAutor, String biografiaAutor, String origen) {
        autor = new Author(nombreAutor, biografiaAutor, origen);
    }

    public void setISBN(String unISBN) {
        ISBN = unISBN;
    }

    public void setPrecio(double unPrecio) {
        precio = unPrecio;
    }

    @Override
    public String toString() {
        String aux;
        aux = titulo + " por " + autor.toString() + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
        return (aux);
    }

}
