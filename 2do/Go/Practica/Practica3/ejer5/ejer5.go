package practica3

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

/*
	Realice un programa que tenga 2 productores y 2 consumidores. Cada
	productor  y  consumidor  debe  ser  una  Goroutine.  Cada  productor
	producirá  3  números  y  cada  consumidor  consumirá  3  números. Los
	productores  deben  esperar  un  tiempo  aleatorio entre 0 y 1 segundo
	para  producir  un  número  aleatorio  entre  0 y 100. Los consumidores
	deben consumirlos inmediatamente e imprimirlos por pantalla indicando
	cual es el consumidor que lo consumió.

  Objetivo: WaitGroups
*/

func producer(outN, outId chan<- int, id int) {
	for range 3 {
		time.Sleep(time.Millisecond * (time.Duration(rand.Intn(500))))
		outN <- rand.Intn(100)
		outId <- id
	}
}

func consumer(inN, inId <-chan int, wg *sync.WaitGroup) {
	defer wg.Done()
	for range 3 {
		fmt.Printf("El productor %d envio el n° %d", <-inN, <-inId)
		fmt.Println("")
	}
}

func Ejer5() {
	var wg sync.WaitGroup

	wg.Add(2)

	var chanInt = make(chan int)
	var chanId = make(chan int)
	go producer(chanInt, chanId, 1)
	go producer(chanInt, chanId, 2)
	go consumer(chanInt, chanId, &wg)
	go consumer(chanInt, chanId, &wg)

	wg.Wait()
	fmt.Println("Termino el programa")
}
