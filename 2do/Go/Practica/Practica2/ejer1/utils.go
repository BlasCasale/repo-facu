package ejer1

import (
	"fmt"
	"os"
)

func check(err error) {
	if err != nil {
		fmt.Println(err)
		panic(err)
	}
}

func checkArgs() bool {
	return len(os.Args) >= 2
}

/*
Escribir una función que pasa de grados Celsius a Fahrenheit
utilizando nuevos tipos y aplicarla al arreglo de los valores leídos. La
conversión se realiza de acuerdo a la siguiente ecuación:

F=(C×9/5)+32
*/

type Fahrenheit float32

func CelcToFarh(temp float64) Fahrenheit {
	return Fahrenheit(temp*9/5 + 32)
}
