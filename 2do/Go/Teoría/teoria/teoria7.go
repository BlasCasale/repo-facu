package teoria

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

/*
concurrencia => {
	concurrencia
	paralelismo
	threads/task/process
	goroutines
}
goroutines => funcion que es capaz de ejecutar concurrentemente con otras funciones
WaitGroup => {
	permite que una goroutine espere a que otras goroutines terminen
	el tipo sync.WaitGroup se puede pensar como un contador
	el tipo sync.WaitGroup define los metodos:
		Add(delta int) => aumenta(o decrementa) el contador
		Done() => decrementa el contador
		Wait() => bloquea la ejecucion hasta que el contador sea 0
}
Channels => {
	mecanismo que permite que las goroutines se comuniquen y se sincronicen
	conducto "tipado" a traves del cual una puede enviar y recibir datos a otra
	por defecto, tanto la accion de enviar como la recbir bloquean a la goroutine que la ejecuta que la del "otro extremo" este lista

	se declaran antes de usarlos => {
		msg := make(chan string) | var msg chan string = make(chan string)
		nums := make(chan int) | var nums chan int = make(chan int)
	}

	el "zero value" de un channel es nil => var nums chan int // nil

	send => nums <- x

	receive => {
		x = <-nums
		<-nums
	}

	se puede cerrar un channel => close(nums)

	el receptor => x, ok := <-nums (si !ok el channel no tiene mas valores y esta cerrado)

	range => {
		recibe valores repetidamente hasta que eventualmente el channel se cierre
		for x := range nums {
			fmt.Println(x)
		}
	}

	pueden ser "unidireccionales" => {
		send-only channel
			chan<- int

		receive-only channel
			<-chan int

		solo la goroutine "sender" puede cerrar un send-only channel

		intentar cerrar un receive-only channel produce un error en tiempo de compilacion
	}

	buffered channels => {
		ch = make(chan string, 3)

		tiene asociada una cola de elementos con la capacidad definiad en la declaracion

		un "send" agrega un elemento al final de la cola y un "receive" quita y devuelve un elemento del inicio

		productor/consumidor => {
			un productor genera datos que pone en un buffer
			un consumidor saca datos del buffer y los consume
		}
	}
}
select
monitores
semaforos
*/

func producer(out chan<- int) {
	timeProducer := rand.Intn(250)
	totalProduce := 10

	for range totalProduce {
		time.Sleep(time.Millisecond * time.Duration(timeProducer))
		out <- rand.Intn(1000)
	}

	close(out)
}

func consumer(in <-chan int, wg *sync.WaitGroup) {
	timeConsumer := rand.Intn(1000)

	for range in {
		fmt.Println(<-in)
		time.Sleep(time.Millisecond * time.Duration(timeConsumer))
	}

	wg.Done()
}

func Teoria7() {

	var ch = make(chan string, 3)

	ch <- "A"
	ch <- "B"
	ch <- "C"

	fmt.Println("imprime una dir de memoria ", ch)
	fmt.Println("imprime 3 porque son los elementos que tiene la cola actualemnte", len(ch))
	fmt.Println("primer elemento de la cola ", <-ch)
	fmt.Println("imprime 3 porque es la capacidad que tiene este buffer ", cap(ch))
	fmt.Println("imprime 2 porque le saque un elemento de la cola previamente ", len(ch))

	var chInt = make(chan int, 5)

	var wgC sync.WaitGroup
	wgC.Add(1)

	go func() {
		producer(chInt)
	}()

	go func() {
		consumer(chInt, &wgC)
	}()

	wgC.Wait()
}
