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

Modificar la solución para incluir grupo de valores incorrectos, como
pueden ser los mayores a 50◦ y los menores a 20◦.
*/

func Ejer1B() {
	var temperatures []float32

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
		temperatures = append(temperatures, float32(num))
	}

	var min float32 = 999
	var max, average float32
	var counter [4]int

	for _, el := range temperatures {

		if el < 20 || el > 50 {
			counter[3]++
		} else {
			if el < 36 {
				counter[0]++
			} else if el > 36 && el < 37.5 {
				counter[1]++
			} else {
				counter[2]++
			}
		}

		if el < min {
			min = el
		} else if el > max {
			max = el
		}

		average = average + el
	}

	average = average / float32(len(temperatures))

	fmt.Printf("La temperatura minimia es %f \n", min)
	fmt.Printf("La temperatura maxima es %f \n", max)
	fmt.Printf("La temperatura promedio es %f \n", average)
	fmt.Printf("La cantidad de temperatura por debajo de 36 es %d, las temperaturas entre 36 y 37.5 son %d, las temperaturas superios a 37.5 son %d. Los valores ingresados incorrectamente fueron %d", counter[0], counter[1], counter[2], counter[3])
}
