package ejer4

import (
	"bufio"
	"fmt"
	"math"
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

func productoria(v []int) int {
	var total int

	for _, el := range v {
		total = total * int(math.Pow(float64(el), 3))
	}

	return total
}

func sumatoria(v []int) float64 {
	var total float64

	for _, el := range v {
		total = total + float64(1/el)
	}

	return total
}

func maxMin(v []int) (int, int) {
	var max, min int = 0, 9999

	for _, el := range v {
		if el < min {
			min = el
		}
		if el > max {
			max = el
		}
	}

	return max, min
}

func Ejer4() {

	numbers := readArchive()

	fmt.Println(numbers, len(numbers))

	checkLen(numbers)

	n := len(numbers) / 3

	successions := [3][]int{numbers[0:n], numbers[n : n*2], numbers[n*2 : n*3]}

	sum := sumatoria(successions[0])
	prod := productoria(successions[2])
	max, min := maxMin(successions[1])

	r := sum - float64(prod)

	maxMulti := float64(max) * r

	minMulti := float64(min) * r

	fmt.Printf("El valor maximo multiplcado por la sumatoria menos la productoria es %f", maxMulti)
	fmt.Println("")
	fmt.Printf("El valor minimo multiplcado por la sumatoria menos la productoria es %f", minMulti)
}
