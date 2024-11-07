
package Parciales;

public class Parcial1 {
    
    /*
        La UNLP necesita un sistema para reportar estadisticas para una carrera. El sistema conoce
        datos de la carrera (nombre, facultad a la que pertenece y año de creacion) y registrara cantidad
        de egresados en cada trimestre del año (1..4) para N años académicos desde su año de creación
        (A..A+N-1). Se necesitan dos versiones del sistema: una que permita reportar estadísticas por año
        académico y otra que permita reportar estadísticas por trimestre.
        1) Genere las clases. Provea contructores para crear cada sistema a partir de los datos de una
        carrera, una cantidad de años académicos N y 4 trimestres. El sistema se inicia con -1 egresados
        para cada año académico y trimestre.
        2) Implemente los métodos necesarios, en las clases que corresponda, para:
        a) Registrar la cantidad de egresados de un año académico X y un trimestre Y. Asuma que X es un año
        académico que esta en rango, y que Y es un trimestre que esta en rango.
        b) Obtener la cantidad de egresados de un año académico X y un trimestre Y. Asuma que X es un año
        académico que esta en rango, y que Y es un trimestre que esta en rango.
        c) Obtener la cantidad de trimestres que registran X egresados (tener en cuenta todos los trimestres
        de todos los años académicos). Suponga que ya estan registradas las cantidades de egresados de todos
        los años académicos y todos los trimestres.
        d) Retornar un String con los datos de la carrera y las estadísticas por año académico o estadísticas
        por trimestre segun corresponda:
        - La versión del sistema que reporta estadísticas por año académico, deberá anexar para cada año
        académico la suma total de egresados de ese año (teniendo en cuenta todos sus trimestres).
        Ej: "Licenciatura en sistemas plan 2015. Facultad de informatica. Año de creacion 2015.
        Año: 2015 - 80 egresados; Año: 2016 - 70 egresados; Año: 2017 - 53 egresados"
    
        - La versión del sistema que reporta estadísticas por trimestre, deberá anexar para cada trimestre la
        suma total de egresados en ese trimestre (teniendo en cuenta todos los años académicos).
        Ej: "Licenciatura en sistemas plan 2015. Facultad de informatica. Año de creacion 2015.
        Trimestre 1: 6 egresados; Trimestre 2: 9 egresados; Trimestre 3: 15 egresados; Trimestre 4: 10 egresados"
    
        3) Realice un programa que instancie un sistema de estadísticas por año académico y un sistemas de
        estadísticas por trimestre, uno para "Licenciatura en Sistemas Plan 2015" y otra para "Ingeniería en
        Computación Plan 2011". Registre todas las cantidades de egresados en cada sistema (para cada año académico
        y trimestres considerados). Compruebe el correcto funcionamiento de los métodos.
    */
    public static void main(String[] args) {
    }
    
}
