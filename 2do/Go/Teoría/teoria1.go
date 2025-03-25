/*
Lenguaje de programacion multiplataforma
compilado y fuertemente tipado
admite concurrencia, genericos y administra memoria
es portable
*/

package teoria

import (
	"fmt"
	"math/rand"
)

func teoria1 () {
	fmt.Println("Hello world")
	fmt.Println(rand.Intn(10))

	// los nombres de las variables son keySensitve
	var i int
	var c, d, e bool
	var (
		j int
		k, f, w bool
	)

	var h = 2
	var y, u int = 4, 5

	var a, b, c = true "hola" 3 // tiene inferencia en los tipos

	// solo se puede usar dentro de funciones
	l:= 3 // inferencia de tipo

	const Pi = 3.14

	/*
	tipos basicos
	bool= default false
	string default ""
	int, int8, int16, int32, int64 uint, uint8, uint16, uint32, uint64, uintptr default 0
	flotat32, float64 default 0
	complex64, complex128 default 0+0i
	*/

	/*
	casteo
	var i int = 42
	var f float64 = float64(i) + 0.5
	*/

	/*
	operadores
	+ - * / %
	+x y -x

	sobre string
	s = s1 + s2
	*/

	/*
	operadores de comparacion
	== != < > <= >=

	operadores logicos
	&& || !

	operadores bit a bit (bitwise)
	& | ^ 
	<< bit a la izquierda x << 2
	>> bit a la derecha x >> 2
	*/
}

type Celcius float64
type Fahrenheit float64

func CToF (c Celcius) Fahrenheit {
	return Fahrenheit(c * 9 / 5 + 32)
}

func FToC (f Fahrenheit) Celcius {
	return Celcius((f - 32) * 5 / 9)
}