package ejer3

import (
	"fmt"
	"strings"
)

var dirs = []string{"N", "NE", "E", "SE", "S", "SO", "O", "NO"}

type Cardinal int

const (
	N Cardinal = iota
	NE
	E
	SE
	S
	SO
	O
	NO
)

func getCardinal(c Cardinal) string {
	return dirs[c]
}

func getIndex(s string) int {
	for i, v := range dirs {
		if s == v {
			return i
		}
	}
	return -1
}

func readCardinal() string {
	fmt.Println("Ingrese el punto cardinal del cual viene el viento (N, S, E, O, NO, SE, NE, SO): ")
	var card string
	fmt.Scan(&card)
	card = strings.ToUpper(card)
	return card
}

func getOpposite(s string) string {
	i := getIndex(s)
	return getCardinal(7 - Cardinal(i))
}

type Stringer interface {
	String()
}

func (c Cardinal) String() string {
	return "El punto hacia donde va el viento es " + getCardinal(c)
}
