package practica3

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

/*
	Realice  un  programa  que  envíe  datos  a  dos  canales  desde  dos
	goroutines  y  estos  sean  recibidos  en  el  programa  principal  por  un
	select. Los datos se deben recibir en uno de los canales por el lapso de
	5 segundos y por el otro en el lapso de 10 segundos.

	Objetivo: timeouts
*/

func producer(out chan<- int, durationSeconds int) {
	ticker := time.NewTicker(time.Duration(rand.Intn(400)) * time.Millisecond)
	defer ticker.Stop()

	timeout := time.After(time.Duration(durationSeconds) * time.Second)

	for {
		select {
		case <-timeout:
			close(out)
			return
		case <-ticker.C:
			out <- rand.Intn(100)
		}
	}
}

func Ejer7() {
	ch1 := make(chan int)
	ch2 := make(chan int)

	var wg sync.WaitGroup

	wg.Add(2)
	go producer(ch1, 5)
	go producer(ch2, 10)

	for ch1 != nil || ch2 != nil {
		select {
		case n, ok := <-ch1:
			if !ok {
				ch1 = nil
				wg.Done()
			} else {
				fmt.Printf("Recibido por el canal 1: %d\n", n)
			}
		case n, ok := <-ch2:
			if !ok {
				ch2 = nil
				wg.Done()
			} else {
				fmt.Printf("Recibido por el canal 2: %d\n", n)
			}
		}
	}

	wg.Wait()
}
