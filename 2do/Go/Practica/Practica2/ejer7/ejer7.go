package ejer7

import (
	"bufio"
	"fmt"
	"os"
)

/*
Se debe leer una secuencia de caracteres que finaliza con CR e informar la
cantidad de letras, números y caracteres especiales leídos.
a.  Modificar  el  programa  anterior  para  que  cuente  de  forma  separada
mayúsculas de minúsculas.
b.  Modificar para que, además, cuente de forma separada las ocurrencias
de cada dígito decimal. Utilice la estructura de datos Map.
Sub-objetivo:  Operaciones  sobre  caracteres  (runas)  y  estructuras  de
control.
*/

type Chars map[string]int

func readArchive() []rune {
	scanner := bufio.NewScanner(os.Stdin)

	var data []byte

	for scanner.Scan() {
		data = append(data, scanner.Bytes()...)
	}

	return []rune(string(data))
}

func compareRune(c Chars, r rune) {
	switch {
	case r >= 'a' && r <= 'z':
		c["lower"]++
	case r >= 'A' && r <= 'Z':
		c["upper"]++
	case r >= '0' && r <= '9':
		c["num"]++
	default:
		c["spec"]++
	}
}

func Ejer7() {
	runes := readArchive()

	chars := Chars{
		"upper": 0,
		"lower": 0,
		"num":   0,
		"spec":  0,
	}

	fmt.Println(runes)

	for i, el := range runes {
		if el == 13 || i+1 < len(runes) && el == 92 && runes[i+1] == 114 {
			break
		}
		compareRune(chars, runes[i])
	}

	fmt.Printf("Letras mayúsculas: %d \n", chars["upper"])
	// fmt.Println("")
	fmt.Printf("Letras minúsculas: %d \n", chars["lower"])
	// fmt.Println("")
	fmt.Printf("Números: %d \n", chars["num"])
	// fmt.Println("")
	fmt.Printf("Caracteres especiales: %d \n", chars["spec"])

}
