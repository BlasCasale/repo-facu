package ejer5

import (
	"fmt"
)

/*
Escribir  un  programa  que  defina  el  tipo  vector  de  flotantes  de  tamaño  fijo,
constante, con las operaciones:
func Initialize(v Vector ,f float64)
func Sum(v1 , v2 Vector) Vector
func SumInPlace(v1 , v2 Vector)
SumInPlace, a diferencia de la anterior, guarda el resultado de la suma en el
primer vector. Investigar formas que existen para encapsular y separar el código.
Sub-objetivo: Arreglos, funciones y parámetros por referencia.
*/
func Ejer5() {

	var v1, v2 Vector

	Initialize(&v1, 1.3)
	Initialize(&v2, 2.4)

	c := Sum(v1, v2)
	fmt.Printf("La suma de los vectores da un total de %f", c)

	fmt.Println("")

	fmt.Println(v1)
	fmt.Println(v2)

	SumInPlace(&v1, v2)

	fmt.Println(v1)
	fmt.Println(v2)
}
