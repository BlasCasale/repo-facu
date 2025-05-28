package ejer1

import (
	"fmt"
	"os"
	"strconv"
	"sync"
)

/*
Realice  un  programa que acepte un número entero positivo N como
entrada  desde  la  línea  de  comandos  y  calcule  todos  los  números
primos menores o iguales a N.
a)  Realice  el  programa  con  una  única  goroutine  que  muestre en
pantalla la lista de números primos encontrados.
b)  Realice el programa utilizando más de una goroutine para dividir
el trabajo de comprobación de primos entre múltiples goroutines
en paralelo
i)  Cada  goroutine  debe  recibir  un  rango  de  números  a
comprobar  y  devolver  una  lista  de  los  números  primos
encontrados
ii)  El programa principal debe recibir el número N y dividir el
trabajo en goroutines, asignando a cada una un rango de
números a comprobar
iii)  Una  vez  que  todas  las  goroutines  hayan  finalizado,  el
programa principal debe recopilar los resultados y mostrar
en pantalla la lista de números primos encontrados.
c)  Realice la ejecución con N igual a 1.000, 100.000 y 1.000.000
tanto  del  programa  a)  como del b). Para cada caso calcule el
speed-up con la siguiente fórmula:

S(p) =  T(1) / T(p)

donde,  S(p)  es  el  speed-up,  T(1)  es  el  tiempo  que  tarda  la
ejecución  con  una  única  goroutine  y  T(p)  es  el  tiempo  de
ejecución con p goroutines.
*/

func checkNum() (int, error) {
	if len(os.Args) < 2 {
		panic("debe ingresar un numero entero positivo para continuar")
	}

	num, err := strconv.Atoi(os.Args[1])
	if err != nil {
		return 0, fmt.Errorf("debe ingresar un numero entero positivo para continuar")
	}

	if num < 1 {
		panic("debe ingresar un numero entero positivo para continuar")
	}

	return num, nil
}

func IsPrime(n int) bool {
	if n < 2 {
		return false
	}
	if n == 2 {
		return true
	}
	if n%2 == 0 {
		return false
	}

	// Chequeo desde 3 hasta sqrt(n), solo impares
	for i := 3; i*i <= n; i += 2 {
		if n%i == 0 {
			return false
		}
	}
	return true
}

func PrimesUpTo(n int) []int {
	if n < 2 {
		return []int{}
	}

	primes := []int{}
	for i := 2; i <= n; i++ {
		if IsPrime(i) {
			primes = append(primes, i)
		}
	}
	return primes
}

func PrintPrimes(primes []int, wg *sync.WaitGroup) {
	for _, prime := range primes {
		fmt.Println(prime)
	}
	wg.Done()
}

func Ejer1() {

	num, _ := checkNum()

	wg := &sync.WaitGroup{}
	wg.Add(1)
	go func(num int) {
		primes := PrimesUpTo(num)
		PrintPrimes(primes, wg)
	}(num)

	wg.Wait()
}
