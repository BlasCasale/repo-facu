package main

import (
	"bufio"
	"fmt"
	"os"
	"slices"
	"strings"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Se debe enviar la palabra a reemplazar")
		return
	}

	lowerCase := []string{"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}
	signs := []string{"!", "¡", "?", ".", ",", "¿", ":", ";", "(", ")", "-", "_", " ", "'", "\"", "[", "]", "{", "}", ">", "<", "@"}

	fmt.Println("Ingrese una frase")

	reader := bufio.NewReader(os.Stdin)
	phrase, _ := reader.ReadString('\n')

	words := strings.Split(phrase, " ")
	wordToChange := os.Args[1]
	wordToChangeLower := strings.ToLower(wordToChange)

	var finalWords []string

	for _, el := range words {
		original := el

		// Limpiar los signos del principio y final para comparar
		cleaned := strings.Trim(el, strings.Join(signs, ""))

		if strings.ToLower(cleaned) == wordToChangeLower {
			newWord := ""

			for _, c := range el {
				char := string(c)
				if slices.Contains(lowerCase, strings.ToLower(char)) {
					// invertir el case
					if char == strings.ToLower(char) {
						newWord += strings.ToUpper(char)
					} else {
						newWord += strings.ToLower(char)
					}
				} else {
					// mantener signos y otros caracteres
					newWord += char
				}
			}

			finalWords = append(finalWords, newWord)
		} else {
			finalWords = append(finalWords, original)
		}
	}

	outputStr := strings.Join(finalWords, " ")
	fmt.Println(outputStr)
}
