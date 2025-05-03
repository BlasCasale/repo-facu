package ejer4

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

/*
Se debe leer tres sucesiones, de N (constante), números enteros cada una: x1 .
. . xn, y1  . . . yn, z1 . . . zn, almacenarlas en sus respectivos arreglos y calcular
luego:

Para la productoria, la sumatoria y el máximo-mínimo usar funciones. La función
maxmin retorna el máximo y el mínimo de la serie y luego ambos son
multiplicados por el resto de la ecuación.

Sub-objetivo: Resaltar el tipado fuerte de Go y usar casting. Operaciones con
Integer y Float. Arreglos. Funciones que retornan más de un valor.
*/

func readArchive() []int {
	scanner := bufio.NewScanner(os.Stdin)
	if !scanner.Scan() {
		panic("No se encontro el archivo")
	}
	scanner.Split(bufio.ScanWords)

	var numbers []int

	for scanner.Scan() {
		line := scanner.Text()
		num, err := strconv.Atoi(line)

		if err != nil {
			fmt.Println("Ocurrio un error al parsear la linea")
		} else {
			numbers = append(numbers, num)
		}
	}

	return numbers
}

func checkLen(v []int) {
	if len(v)%3 != 0 {
		panic("La cantidad de datos no es multiplo de 3")
	}
}

func Ejer4() {

	numbers := readArchive()

	checkLen(numbers)

	n := len(numbers) / 3
	v1 := numbers[0:n]
	v2 := numbers[n : n*2]
	v3 := numbers[n*2 : n*3]
}
