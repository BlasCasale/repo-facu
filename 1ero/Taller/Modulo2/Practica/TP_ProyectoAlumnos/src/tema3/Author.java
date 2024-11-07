/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;


/*
2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.
B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los libros
con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de los
libros instanciados, obtenga e imprima la representación del autor de ese libro.
 */
public class Author {

    private String name, biography, origin;

    public Author() {

    }

    public Author(String name, String biography, String origin) {
        this.name = name;
        this.biography = biography;
        this.origin = origin;
    }

    @Override
    public String toString() {
        String aux = "El nombre del autor es " + name + " su biografía es ";
        aux += biography + " y es de " + origin;
        return aux;
    }
}
