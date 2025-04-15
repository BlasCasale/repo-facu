package teoria

import (
	"fmt"
)

func squares() func() int {
	var x int
	return func() int { x++; return x * x }
}

func adds(vals ...int) int {
	total := 0
	for _, v := range vals {
		total += v
	}
	return total
}

func manejarPanic() {
	if r := recover(); r != nil {
		fmt.Println("Recuperado de un error:", r) // ✅ Captura el `panic`
	}
}

func peligroso() {
	defer manejarPanic()   // 🔄 `recover()` debe usarse con `defer`
	panic("Error crítico") // 🚨
}

func teoria5() {
	// los errores son comportamientos esperables/inevitables
	// las funciones para las cuales un error es uno de los posibles comportamienntos, usualmente retornan un valor resultado adicional

	// si el error tiene una unica causa posible

	// value, ok := cache.Lookup(key)

	// if !ok {
	// manejo del error
	// }

	s := squares()
	println(s()) // 1
	println(s()) // 4
	println(s()) // 9

	println(adds(1, 2, 3, 4, 5)) // 15

	// deferred function calls

	// la invocacion se ejecuta despues de que termina la funcion invocadora

	peligroso()
	fmt.Println("El programa sigue ejecutándose") // ✅
}
