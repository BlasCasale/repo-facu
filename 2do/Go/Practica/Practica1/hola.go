package main

import (
	"fmt"
	"strings"
)

/*
Compile  con  el  compilador  Go  el  “famoso”  progama  Hello
World/Hola Mundo.

Nombre el archivo fuente hola.go. Compile y ejecute todo
en un paso y compile generando un ejecutable con nombre
hola.exe o directamente hola.

go run hola.go
go build -o hola hola.go
./hola
*/
func main() {
	fmt.Println("hola mundo")

	/*
		3) Dada  la  siguiente  declaración  de  programa  Go  indicar  si  es
		correcta. Usar el compilador:
	*/
	/* integers */
	var zz int = 0
	x := 10
	var z int = x
	var y int8 = int8(x) + int8(1)
	const n = 5001
	const c int = 5001
	/* float */
	e := 6
	f := e

	fmt.Println(zz, z, x, y, n, c, e, f)

	/*
		4) Escriba un programa que imprima en la salida estándar la suma
		de  los  primeros  números  positivos  pares  menores o iguales a
		250. Cambiar el programa para que itere en el sentido contrario
		pero obtener el mismo resultado. Cambiar el programa para que
		en lugar de usar un literal como tope se use una constante. Si lo
		desea, investigue la herramienta gofmt y pruebe sobre el código
		escrito.
		Sub-objetivo:  Uso  de  E/S  de  valores  numéricos  en  Go,
		estructuras de control básicas, constantes y variables
	*/

	j := 2
	const cut = 250
	sum := 0
	for i := cut; i > 0; i-- {
		if (j != 0) && (i%2 == 0) {
			sum += i
			j--
		}
	}

	fmt.Println("Sum ", sum)

	/*
		  6) Escriba  un  programa  que  lee  desde  la  entrada  estándar  dos
			enteros y retorne la división entre el mayor de ellos y el menor.
			Realizar  el  mismo  programa  considerando  que  se  leen  dos
			enteros sin signo. Luego modifique para que trabaje con reales
			(punto flotante). Ver que sucede con las división por cero.
	*/

	var n1 int
	var n2 int

	fmt.Scan(&n1)
	fmt.Scan(&n2)

	var res int

	if n1 < 0 {
		n1 = n1 * -1
	}
	if n2 < 0 {
		n2 = n2 * -1
	}

	if n1 != 0 && n2 != 0 {
		if n1 > n2 {
			res = n1 / n2
		} else {
			res = n2 / n1
		}
	}

	fmt.Println("Res ", res)

	var f1 float32
	var f2 float32
	var res2 float32

	fmt.Scan(&f1)
	fmt.Scan(&f2)

	if f1 < 0 {
		f1 = f1 * -1
	}

	if f2 < 0 {
		f2 = f2 * -1
	}

	if f1 > f2 {
		res2 = f1 / f2
	} else {
		res2 = f2 / f1
	}

	fmt.Println("Res2 ", res2)

	/*
		7) Las temperaturas de los pacientes de un hospital se dividen en 3
		grupos:  alta  (mayor  de  37.5),  normal  (entre  36  y  37.5) y baja
		(menor de 36). Se deben leer 10 temperaturas de pacientes e
		informar  el  porcentaje  de  pacientes  de  cada  grupo.  Luego  se
		debe imprimir el promedio entero entre la temperatura máxima y
		la temperatura mínima.
		a.  ¿Se  puede  utilizar  el  case  para  tipos  reales  en  otros
		lenguajes?
		b.  ¿ Cómo se realizan las conversiones entre reales (punto
		flotante) y enteros en otros lenguajes ?
		Sub-objetivo: El tipado fuerte, usar casting. Operaciones y
		E/S con float. Casting en otros lenguajes
	*/

	var temps [3]int

	const low = 36
	const high = 37.5

	var min float32 = 100
	var max float32 = 20
	for i := 0; i < 10; i++ {
		var temp float32
		fmt.Println("Ingrese la temp del paciente \n Faltan ", i, " pacientes")
		fmt.Scan(&temp)

		if temp < low {
			temps[0]++
		} else {
			if temp > high {
				temps[2]++
			} else {
				temps[1]++
			}
		}

		if temp < min {
			min = temp
		} else if temp > max {
			max = temp
		}
	}

	fmt.Println("Temperaturas ", temps)

	var average int = int(max+min) / 2
	fmt.Println("Promedio entero de temp ", average)

	/*
		8) Realizar un programa que lea el punto cardinal (como caracter o
		string) del cual viene el viento (‘N’, ‘S’, ‘E’, ‘O’) y envíe a la salida
		estándar hacia cuál se dirigiría.
		Sub-objetivo: Uso de case con la opción por default. E/S
		caracteres o strings.
		a.  ¿Cómo se escribe el default en el case de otros lenguajes?
	*/

	var cardinal string

	fmt.Println("Ingrese el punto cardinal")
	fmt.Scan(&cardinal)

	switch cardinal {
	case "N", "n":
		fmt.Println("El viento se dirige al sur")
	case "S", "s":
		fmt.Println("El viento se dirige al norte")
	case "O", "o":
		fmt.Println("El viento se dirige al este")
	case "E", "e":
		fmt.Println("El viento se dirige al oeste")
	default:
		fmt.Println("No ingreso un punto cardinal válido")
	}

	/*
		9) Realice un programa que reciba una frase e imprima en pantalla
		la  misma  frase  reemplazando  las  ocurrencias  de  “jueves”  por
		“martes”  respetando  las  letras  minúsculas  o  mayúsculas de la
		palabra original en su posición correspondiente. Por ejemplo, se
		reemplaza “Jueves” por “Martes” o “jueveS” por “marteS”
	*/

	var str = "Hola hoy es JueVes juEves"

	words := strings.Split(str, " ")

	newString := ""

	for _, word := range words {

		if strings.ToLower(word) == "jueves" {
			newWord := ""

			var thursday string = "jueves"

			splitThursday := strings.Split(thursday, "")

			chars := strings.Split(word, "")

			for i, c := range chars {
				if c == splitThursday[i] {
					newWord += c
				} else {
					newWord += strings.ToUpper(c)
				}
			}

			newString += newWord

		} else {
			newString += word
		}

	}
}
