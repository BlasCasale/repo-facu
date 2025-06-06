package bankMonitor

import "fmt"

var deposits = make(chan int) // send amount to deposit
var balances = make(chan int) // receive balance

func Deposit(amount int) {
	deposits <- amount
}

func Balance() int {
	return <-balances
}

func teller() {
	var balance int // balance is confined to teller goroutine
	for {
		select {
		case amount := <-deposits:
			balance += amount
			fmt.Println("balance:", balance)
		case balances <- balance:
		}
	}
}
func init() {
	go teller() // start the monitor goroutine
}
