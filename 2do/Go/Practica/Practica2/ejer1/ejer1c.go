package ejer1

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

/*
Las  temperaturas  de  los  pacientes  de  un  hospital  se  dividen  en  3
grupos: alta (mayor de 37.5), normal (entre 36 y 37.5) y baja (menor de
36).  Se  deben  leer  10  temperaturas  de  pacientes  e  informar  el
porcentaje  de  pacientes  de  cada  grupo.  Luego  se  debe  imprimir  el
promedio entero entre la temperatura máxima y la temperatura mínima.
Resolver  cargando  primero  todos  los  valores  usando  un  arreglo  y
almacenar  los  datos  en  variables  escalares  como  acumuladores  y
contadores.  Probar  generar  archivos  de  entrada  con  los  valores  y
ejecutar, por ejemplo, de la siguiente forma:
go run p2-1.go < input2-1.txt

Escribir una función que pasa de grados Celsius a Fahrenheit
utilizando nuevos tipos y aplicarla al arreglo de los valores leídos. La
conversión se realiza de acuerdo a la siguiente ecuación:

F=(C×9/5)+32
Sub-objetivo: Ver el tipado fuerte, usar casting. Operaciones y E/S con
float. Arreglos. Maps. Constantes. Definición de nuevos tipos.
*/

func Ejer1C() {
	var temperatures []Fahrenheit

	var scanner *bufio.Scanner

	if checkArgs() {
		data, err := os.Open(os.Args[1])
		check(err)

		defer data.Close()

		scanner = bufio.NewScanner(data)
		scanner.Split(bufio.ScanWords)
	} else {
		scanner = bufio.NewScanner(os.Stdin)
		scanner.Split(bufio.ScanWords)
	}

	for scanner.Scan() {
		line := scanner.Text()
		num, err := strconv.ParseFloat(line, 32)

		check(err)
		temperatures = append(temperatures, CelcToFarh(num))
	}

	var min Fahrenheit = 999
	var max, average Fahrenheit
	var counter [3]int

	for _, el := range temperatures {
		if el < CelcToFarh(36) {
			counter[0]++
		} else if el > CelcToFarh(36) && el < CelcToFarh(37.5) {
			counter[1]++
		} else {
			counter[2]++
		}

		if el < min {
			min = el
		} else if el > max {
			max = el
		}

		average = average + el
	}

	average = average / Fahrenheit(len(temperatures))

	fmt.Printf("La temperatura minimia es %f \n", min)
	fmt.Printf("La temperatura maxima es %f \n", max)
	fmt.Printf("La temperatura promedio es %f \n", average)
	fmt.Printf("La cantidad de temperatura por debajo de 36 es %d, las temperaturas entre 36 y 37.5 son %d, las temperaturas superios a 37.5 son %d.", counter[0], counter[1], counter[2])
}
