package ejer6

import "fmt"

/*
Escribir un programa que implemente dos funciones sobre slices. La primera
recibe dos slices de enteros y retorna un tercer slice del tamaño del mínimo
entre los dos sumando elemento a elemento. La segunda recibe un slice de
enteros y calcula el promedio de sus elementos. Por ejemplo, las definiciones
de las funciones pueden ser las siguientes:
func Sum(a , b []int) []int
func Avg(a []int) int
a.  Re-implemente la función Avg para que retorne un float.
Sub-objetivo: Slices, funciones y parámetros
*/
func SumSli(s1, s2 []int) []int {
	length := min(len(s1), len(s2))

	s3 := make([]int, length)

	for i := range s3 {
		s3[i] = s1[i] + s2[i]
	}

	return s3
}

func Average(s1 []int) float32 {
	var tot int
	for i := range s1 {
		tot = tot + s1[i]
	}

	return float32(tot) / float32(len(s1))
}

func Ejer6() {
	s1 := []int{1, 2, 4, 5, 9, 10, 14, 75}
	s2 := []int{2, 3, 5, 6, 9}

	s3 := SumSli(s1, s2)

	fmt.Println(s3)

	fmt.Println("")

	fmt.Printf("Promedio de los valores del slice %f", Average(s1))
}
