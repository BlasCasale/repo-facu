package ejer1

import (
	"sort"
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

func PrimesBetween(x, y int) []int {
	if y < 2 {
		return []int{}
	}

	primes := []int{}
	for i := x; i <= y; i++ {
		if IsPrime(i) {
			primes = append(primes, i)
		}
	}
	return primes
}

func Ejer1b() {

	num, _ := checkNum()

	difference := num / 5

	wg := &sync.WaitGroup{}
	mu := &sync.Mutex{}

	primes := []int{}
	for i := 0; i < num; i += difference {
		start := i
		end := min(i+difference, num)
		wg.Add(1)
		go func(start, end int) {
			defer wg.Done()
			localPrimes := PrimesBetween(start, end)
			mu.Lock()
			primes = append(primes, localPrimes...)
			mu.Unlock()
		}(start, end)
	}
	wg.Wait()
	sort.Ints(primes)
	wg.Add(1)
	PrintPrimes(primes, wg)

	wg.Wait()
}
