package ejer3

import "fmt"

/*
Declare  el  tipo  de  datos  punto  cardinal  como  un  enumerativo.  Realizar  un
programa que lea un punto cardinal del cual viene el viento (N, S, E, O, NO,
SE, NE, SO) e imprima hacia cuál se dirige. Encapsule la funcionalidad en una
función.
Resolver con un Map que tiene como índice el tipo punto cardinal y cada
elemento es el punto cardinal contrario al índice.
*/
func Ejer3C() {
	var cardinal = make(map[Cardinal]Cardinal)
	cardinal[N] = S
	cardinal[NE] = SO
	cardinal[E] = O
	cardinal[SE] = NO
	cardinal[S] = N
	cardinal[SO] = NE
	cardinal[O] = E
	cardinal[NO] = SE

	var card = readCardinal()

	index := getIndex(card)

	if elem, ok := cardinal[Cardinal(index)]; ok {
		fmt.Printf("El viento viene desde %s y va hacia %s", card, getCardinal(Cardinal(elem)))
		fmt.Println("")
		fmt.Printf("%v", elem)
	} else {
		fmt.Println("Error")
	}

}
