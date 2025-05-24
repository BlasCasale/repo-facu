package teoria

import (
	"fmt"
	"math"
	"runtime"
	"time"
)

func teoria2() {
	sum := 1

	for sum < 1000 {
		sum += sum
	}

	tot := 0

	for i := 0; i < 10; i++ {
		tot += i
	}

	for i := 1; i < 500; {
		i += i
		fmt.Println(i)
	}

	// iteracion/do-while

	n := 0

	for {
		n++
		fmt.Println(n)
		if n == 10 {
			break
		}
	}

	// seleccion

	x := 3.2
	y := 4.3

	if x < y { // x < y && x > 0
		fmt.Println("x es menor que y")
	} else {
		fmt.Println("x es mayor que y")
	}

	// con inicializacion de valor

	if v := math.Pow(x, y); v > 100 {
		fmt.Println(v)
	} else {
		fmt.Println(100)
	}

	// switch
	switch runtime.GOOS {
	case "dar" + "win":
		fmt.Println("Darwin")
	default:
		fmt.Println("Otro")
	}

	t := time.Now()
	switch {
	case t.Hour() < 12:
		fmt.Println("Buenos dias")
	case t.Hour() < 18:
		fmt.Println("Buenas tardes")
	default:
		fmt.Println("Buenas noches")
	}

	num := 27
	nom := "Blas"
	b := false
	float := 3.2
	fmt.Printf("%v", num)            // formato predeterminado
	fmt.Printf("%#v", num)           // formato impreso en tipo
	fmt.Printf("%T", num)            // formato de tipo
	fmt.Printf("%v \n %v", num, num) // salto de linea entre variables
	fmt.Printf("%v \t %v", num, num) // tabulacion entre variables
	fmt.Printf("%t", b)              // booleano
	fmt.Printf("%d", num)            // entero a decimal
	fmt.Printf("%b", num)            // entero a binario
	fmt.Printf("%o", num)            // entero a octal
	fmt.Printf("%x", num)            // entero a hexadecimal
	fmt.Printf("%c", num)            // entero a caracter
	fmt.Printf("%q", num)            // entero a cadena
	fmt.Printf("%U", num)            // entero a unicode
	fmt.Printf("%s", num)            // entero a string
	fmt.Printf("%q", num)            // entero a string encomillado
	fmt.Printf("%x", nom)            // string a hexadecimal
	fmt.Printf("%X", nom)            // string a mayusculas hexadecimal
	fmt.Printf("%e", float)          // float a notacion cientifica
	fmt.Printf("%E", float)          // float a notacion cientifica en mayusculas
	fmt.Printf("%f", float)          // float a notacion decimal
	fmt.Printf("%F", float)          // float a notacion decimal en mayusculas
	fmt.Printf("%g", float)          // float con exponente grande => con e en minuscula
	fmt.Printf("%G", float)          // float con exponente grande en mayusculas => con E en mayuscula

	// flags de fmt.Printf
	fmt.Printf("%-d", num) // alineacion a la izquierda
	fmt.Printf("% d", num) // alineacion a la derecha
	fmt.Printf("%-6d", num)
	fmt.Printf("%-06d", num)
	fmt.Printf("%#", num)

	fmt.Printf("%s is %d years old.", nom, num)
}

func add(x, y int) int {
	return x + y
}

func swap(x, y string) (string, string) {
	return y, x
}

func swap2(x int, y int) (x2 int, y2 int) {
	x2, y2 = y, x
	return
}
