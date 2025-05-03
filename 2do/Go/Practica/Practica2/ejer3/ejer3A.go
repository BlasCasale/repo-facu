package ejer3

import (
	"fmt"
)

/*
  Declare  el  tipo  de  datos  punto  cardinal  como  un  enumerativo.  Realizar  un
	programa que lea un punto cardinal del cual viene el viento (N, S, E, O, NO,
	SE, NE, SO) e imprima hacia cuál se dirige. Encapsule la funcionalidad en una
	función.
	a.  Resolver usando un switch/case.
*/

func Ejer3A() {

	card := readCardinal()
	switch card {
	case "N", "NE", "E", "SE", "S", "SO", "O", "NO":
		fmt.Printf("El viento del %s esta soplando hacia %s", card, getOpposite(card))
	default:
		fmt.Println("Error")
	}
}
