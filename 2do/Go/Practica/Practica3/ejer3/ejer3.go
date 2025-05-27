package practica3

import (
	"fmt"
	"sync"
	"time"
)

/*
	a)  ¿Cuántas veces se imprime Hello world?
		El Hello World se imprime 3 veces por el for
	b)  ¿Cuántas Goroutines tiene el programa?
		Contiene una goroutine unicamente
	c)  ¿Cómo  cambiaría  el  programa  (con  la  misma  cantidad  de
	Goroutines) para que imprima 3 veces Hello world?
	i)  Hágalo usando time.Sleep
	ii)  Hágalo usando Channel Synchronization
*/

func Ejer3() {
	var wg sync.WaitGroup
	var ch = make(chan bool)
	wg.Add(2)
	fmt.Println("Inicia Goroutine del main")
	go hello(&wg)

	ok := false
	go helloChannel(ch, &wg)

	for !ok {
		ok = <-ch
	}

	fmt.Println("Termina Goroutine del main")
	wg.Wait()
}

func hello(wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Println("Inicia Goroutine de hello")
	for range 3 {
		time.Sleep(time.Millisecond * 1000)
		fmt.Println(" Hello world")
	}
	fmt.Println("Termina Goroutine de hello")
}

func helloChannel(out chan<- bool, wg *sync.WaitGroup) {
	for range 3 {
		fmt.Println(" Hello world")
	}

	out <- true
	wg.Done()
}
