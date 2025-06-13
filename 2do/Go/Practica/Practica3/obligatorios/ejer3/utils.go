package ejer3Ob

import (
	"fmt"
	"math/rand"
	"os"
	"sync"
)

// la idea es manejar cada key del map individualmente y no bloquear los demas
type slices struct {
	nums   []int
	multer sync.Mutex
}

type channels struct {
	// este map sera el que almacene los datos [prioridad]slice de numeros
	numbers  map[int]*slices
	wg       sync.WaitGroup
	quantity int
}

// este struct me permite manejar el acumulador y bloquear el acceso cuando se suma y esperar para poder utilizarla
type accumulator struct {
	acc    int
	multer sync.Mutex
}

// esto es para manejar los diferentes archivos de escritura
type Logger struct {
	file *os.File
	mux  sync.Mutex
}

// se crea o trunca el nuevo archivo si es que existe y se retorna la nueva instancia para utilizarla en el ppal
func NewLogger(filename string) (*Logger, error) {
	file, err := os.OpenFile(filename, os.O_CREATE|os.O_WRONLY|os.O_TRUNC, 0644)
	if err != nil {
		return nil, err
	}
	return &Logger{file: file}, nil
}

// funcion para escribir en el archivo el n
func Write(l *Logger, prio, n int) error {
	l.mux.Lock()
	defer l.mux.Unlock()
	// se crea el string para escribir y se agrega salto de linea
	textToWrite := fmt.Sprintf("(%d, %d)\n", prio, n)
	_, err := l.file.WriteString(textToWrite)
	return err
}

// prioridad 2
func MultiplyAndPrint(n int) {
	fmt.Printf("%d\n", n*14)
}

// prioridad 3
func SumAndPrint(acc *accumulator, n int) {
	acc.multer.Lock()
	acc.acc += n
	acc.multer.Unlock()
	fmt.Printf("%d\n", acc.acc)
}

func SumDigits(n int) int {
	sum := 0
	for n > 0 {
		sum += n % 10
		n /= 10
	}
	return sum
}

func InvertDigits(n int) int {
	inverted := 0
	for n > 0 {
		inverted = inverted*10 + n%10
		n /= 10
	}
	return inverted
}

func Producer(channel *channels, n int) {
	// se crean los n int aleatorios
	channel.quantity = n
	for range n {
		prio := rand.Intn(4)
		num := rand.Intn(100)
		channel.numbers[prio].multer.Lock()
		channel.numbers[prio].nums = append(channel.numbers[prio].nums, num)
		channel.numbers[prio].multer.Unlock()
	}
}

func Consumer(channel *channels, arch0, arch1 *Logger, Write func(l *Logger, prio, n int) error, acc *accumulator) {
	for j := channel.quantity; j > 0; {
		for i := range 4 {
			var flag = false
			// se bloquea para poder esperar la prioridad 0
			channel.numbers[i].multer.Lock()
			if len(channel.numbers[i].nums) > 0 {
				number := channel.numbers[i].nums[0]
				if i == 0 {
					err := Write(arch0, i, SumDigits(number))
					if err != nil {
						fmt.Printf("hubo un error al escribir en el archivo %s", err)
					}
					channel.numbers[i].nums = channel.numbers[i].nums[1:]
				} else if i == 1 {
					err := Write(arch1, i, InvertDigits(number))
					if err != nil {
						fmt.Printf("hubo un error al escribir en el archivo %s", err)
					}
					channel.numbers[i].nums = channel.numbers[i].nums[1:]
				} else if i == 2 {
					MultiplyAndPrint(number)
					channel.numbers[i].nums = channel.numbers[i].nums[1:]
				} else {
					SumAndPrint(acc, number)
					channel.numbers[i].nums = channel.numbers[i].nums[1:]
				}
				channel.quantity--
				// cambio el flag a true para romper el for y que vuelva a comenzar para evaluar siempre desde el 0 primero
				flag = true
				channel.wg.Done()
			}
			channel.numbers[i].multer.Unlock()
			if flag {
				break
			}
		}
	}
}
