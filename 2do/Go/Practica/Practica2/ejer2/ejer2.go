package ejer2

import "fmt"

/*
Implementar  la  función  factorial  de  dos  formas,  una  iterativa  y  otra
recursiva. Escribir un programa y compilar de forma que utilice una u
otra y la evalúe de 0 a 9. La función factorial se define como:

Sub-objetivo: Recursión vs. iteración. Usar funciones.
*/

func factorialIter(n int) int {
	var value = n

	for n > 1 {
		n--
		value = value * n
	}

	return value
}

func factorialRec(n int) int {
	if n == 0 {
		return 1
	}
	if n > 1 {
		return n * factorialRec(n-1)
	}
	return n
}

func Ejer2() {
	fmt.Println("Ingrese un numero para saber su factorial.")
	var num int
	fmt.Scan(&num)
	fmt.Printf("El fatorial de %d es %d", num, factorialIter(num))
	fmt.Println("")
	fmt.Printf("El facotial de %d es %d", num, factorialRec(num))
}
