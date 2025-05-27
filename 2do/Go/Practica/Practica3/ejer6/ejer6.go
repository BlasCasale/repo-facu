package practica3

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

/*
	Realice un programa que utilice select para recibir valores desde tres
	canales diferentes. Cada canal debe recibir una secuencia de números
	enteros. El programa debe recibir un valor de cada canal y mostrar el
	valor recibido. Debes usar select para determinar cuál canal tiene un
	valor disponible y recibir ese valor. El programa debe continuar hasta
	haber recibido todos los valores enviados a cada canal. Al final debe
	mostrar el total de valores recibidos desde cada canal.

  Objetivo: select
*/

func producer(out chan<- int) {
	out <- 1 + rand.Intn(20)
}

func consumer(n, id int) {
	fmt.Printf("\n Valor enviado %d del channel %d ", n, id)
}

func executeConsumer(n int, out chan<- int, wg *sync.WaitGroup) {
	for range n {
		producer(out)
		wg.Done()
	}
}

func Ejer6() {
	var ch1 = make(chan int)
	var ch2 = make(chan int)
	var ch3 = make(chan int)

	var wg sync.WaitGroup

	i1 := rand.Intn(5)
	wg.Add(i1)
	i2 := rand.Intn(5)
	wg.Add(i2)
	i3 := rand.Intn(5)
	wg.Add(i3)

	go executeConsumer(i1, ch1, &wg)
	go executeConsumer(i2, ch2, &wg)
	go executeConsumer(i3, ch3, &wg)

	select {
	case n := <-ch1:
		consumer(n, 1)

	case n := <-ch2:
		consumer(n, 2)

	case n := <-ch3:
		consumer(n, 3)

	default:
		time.Sleep(time.Millisecond * 500)
	}

	wg.Wait()
	fmt.Println("Termino el programa")
}
