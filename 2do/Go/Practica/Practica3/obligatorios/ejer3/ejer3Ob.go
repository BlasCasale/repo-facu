package ejer3Ob

import (
	"fmt"
)

/*
	Desarrolla  un  programa  que  implemente  un  sistema de planificación
	(scheduler)  utilizando  5  goroutines  (el  main  y  4  más)  . El programa
	debe generar una serie de números enteros aleatorios, cada uno con
	una prioridad aleatoria entre 0 y 3 (donde 0 es la prioridad más alta y 3
	la más baja).
	El scheduler debe seguir las siguientes reglas:
	a)  El  scheduler  debe  procesar  los  datos  en  orden  de  prioridad,
	comenzando por los de prioridad 0, luego 1, 2 y 3.
	b)  Mientras  haya  datos  de  prioridad  0,  el  scheduler  debe
	procesarlos exclusivamente.
	c)  Si no hay datos de prioridad 0 y hay goroutines disponibles, el
	scheduler  puede  asignarles  datos  de  menor  prioridad  para  su
	procesamiento.
	d)  Una  vez  que  no  haya datos de prioridad 0, el scheduler debe
	pasar a procesar los datos de prioridad 1, y así sucesivamente,
	utilizando las goroutines disponibles de forma dinámica.
	e)  El  programa  principal  debe  generar  los  datos  numéricos
	aleatorios con sus respectivas prioridades aleatorias y distribuir el
	trabajo a las goroutines disponibles manteniendo el orden en el
	que llegan los datos por prioridad.
	f)  Con los datos se debe:
	i)  Prioridad 0: Sumar los dígitos del número y almacenar el
	resultado en un archivo llamado "prioridad0.txt" en formato
	de par ordenado (0, resultado).
	ii)  Prioridad 1: Invertir los dígitos del número y almacenar el
	resultado en un archivo llamado "prioridad1.txt" en formato
	de par ordenado (1, resultado).
	iii)  Prioridad  2:  Multiplicar  el  número por un valor constante
	(por ejemplo, 10) e imprimir el resultado en la consola.
	iv)  Prioridad  3:  Acumular  los  números  y  mostrar  el  valor
	acumulado en la consola cada vez que se procesa un dato.
	Tip: Puedes utilizar la librería math/rand para generar números
	aleatorios.
*/

/*
1) Para resolver el problema se penso en crear un productor para los n numeros aleatorios
2) Para consumir los n numeros anteriores se utilizaran 4 consumidores con anidacion de if para los 4 casos y su prioridad
3) Se utilizara una funcion que escriba en el archivo correspondiente con el formato pedido
4) Se utilizaran varios canales para la comunicacion de todas las goroutines y multer para bloquear el acumulador de prioridad 3
*/
func Ejer3Ob() {

	iterations := 150

	channels := &channels{numbers: make(map[int]*slices, 4)}

	// se da la cantidad de iteraciones a hacer para el scheduler
	channels.wg.Add(iterations)

	// se inicializa los slice para evitar nil
	for i := range 4 {
		channels.numbers[i] = &slices{nums: []int{}}
	}

	acc := &accumulator{}

	arch0, err := NewLogger("prioridad0.txt")
	if err != nil {
		fmt.Println("fallo aca")
		panic(err)
	}

	defer arch0.file.Close()

	arch1, err := NewLogger("prioridad1.txt")
	if err != nil {
		fmt.Println("fallo aca 2")
		panic(err)
	}

	defer arch1.file.Close()

	go Producer(channels, iterations)

	for range 4 {
		go Consumer(channels, arch0, arch1, Write, acc)
	}

	channels.wg.Wait()

	fmt.Println("termino el programa")
}
