package practica3

import "fmt"

/*
¿Cómo  podría  hacer  para  garantizar  que  el  siguiente  programa
imprima?

PING
PONG
PING
PONG
PING
PONG
PING
PONG
PING
PONG
*/

func pxng(m chan string, str string) {
	m <- str
}

func Ejer4() {
	messages := make(chan string)

	for range 5 {
		go pxng(messages, "PING")
		go pxng(messages, "PONG")
	}
	for range 10 {
		fmt.Println(<-messages)
	}

}
