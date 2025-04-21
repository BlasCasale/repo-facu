package main

import (
	"bufio"
	"fmt"
	"os"
	"slices"
	"strings"
)

func main() {
	/*
		Realice un programa que reciba una palabra como argumento y lee de
		la  entrada una frase. Luego, el programa debe imprimir la frase que
		leyó con cada una de las ocurrencias de la palabra con las mayúsculas
		y minúsculas invertidas. Por ejemplo, si la frase es:  “Parece peqUEño, pero no es tan pequeÑo el PEQUEÑO”

		y la palabra es “PEQUEÑO” entonces el programa imprimirá:

		“Parece PEQueÑO, pero no es tan PEQUEñO el pequeño”   Tenga  en  cuenta  que  la  palabra  a  buscar  puede  ser  ingresada  con
		mayúsculas y minúsculas mezcladas.

		Este último ejercicio es el que deben entregar.
	*/

	if len(os.Args) < 2 {
		fmt.Println("Se debe enviar la palabra a reemplazar")
	} else {
		lowerCase := []string{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}

		signs := []string{"!", "¡", "?", ".", ",", "¿", ":", ";", "(", ")", "-", "_", " ", "'", "\"", "[", "]", "{", "}", ">", "<", "@"}

		phrase2 := ""

		fmt.Println("Ingrese una frase")

		reader := bufio.NewReader(os.Stdin)

		phrase2, _ = reader.ReadString('\n')

		words3 := strings.Split(phrase2, " ")

		wordToChange := os.Args[1]

		var slice3 []string

		for _, el := range words3 {
			word := ""
			if slices.Contains(signs, el) {
				chars := strings.Split(el, "")

				for _, c := range chars {
					if slices.Contains(lowerCase, c) {
						word += strings.ToUpper(c)
					} else if !slices.Contains(signs, c) {
						word += strings.ToLower(c)
					}
				}

				slice3 = append(slice3, word)
			} else {
				if strings.ToLower(wordToChange) == strings.ToLower(el) {
					letters := strings.Split(el, "")

					for _, l := range letters {
						if slices.Contains(lowerCase, l) {
							word += strings.ToUpper(l)
						} else {
							word += strings.ToLower(l)
						}
					}

					slice3 = append(slice3, word)

				} else {
					slice3 = append(slice3, el)
				}
			}
		}

		outputStr := strings.Join(slice3, " ")

		fmt.Println(outputStr)
	}

}
