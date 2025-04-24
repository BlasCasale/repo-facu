package main

import (
	"fmt"
	"os"
	"strings"
)

func invertir(slice, p string) string {
	var s string
	a := strings.Split(slice, "")
	b := strings.Split(p, "")

	for i, e := range a {
		if (e) == (b[i]) {
			s += strings.ToUpper(e)
		} else {
			s += strings.ToLower(e)
		}
	}
	return s
}

func coincide(slice, p string) bool {
	return strings.EqualFold(strings.ToLower(slice), strings.ToLower(p))
}

func funcionPrincipal(s, p string) {

	var l string = strings.ToLower(string(p[0]))
	l += strings.ToUpper(l) // l = {minus, mayus}

	index := 0
	var s2 string //string final

	for i, e := range s {
		if (e == rune(l[0]) || e == rune(l[1])) && len(s)-i >= len(p) { //busco el caracter de inicio
			sliceStr := s[i : i+len(p)]
			if coincide(sliceStr, p) { // chequeo si coincide la palabra
				strInv := invertir(sliceStr, strings.ToLower(p))
				s2 += s[index:i] + strInv
				index = i + len(p) // coloco el index luego del ultimo caracter que guarde
			}
		}
	}

	s2 += s[index:]
	fmt.Println(s2)
}

func main() {
	if len(os.Args) > 2 { //version con argumentos de consola
		s := strings.Join(os.Args[1:len(os.Args)-1], " ")
		p := os.Args[len(os.Args)-1]
		fmt.Println("Palabra a buscar: " + p)
		funcionPrincipal(s, p)
	} else {
		fmt.Println("Cantidad incorrecta de argumentos, minimo 2 palabras separadas por un espacio.")
		fmt.Println("Se tomara la ultima palabra como la indicada a buscar y modificar, dentro de la frase que le precede")
	}
	// version con lectura desde el programa (Scan)

	/*scanner := bufio.NewScanner(os.Stdin)
	fmt.Println("Ingrese una frase")
	scanner.Scan()
	s := scanner.Text()

	fmt.Println("Ingrese la palabra a invertir")
	scanner.Scan()
	p := scanner.Text()*/
}
