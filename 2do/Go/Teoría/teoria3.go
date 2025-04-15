package teoria

import "fmt"

func teoria3() {
	// secuencia indexada de elementos de un mismo tipo, de longitud fija

	// var x [5]int

	x := [5]int{1: 10, 2: 20, 3: 30} // creacion con inicializacion
	fmt.Println(x)                   // [0 0 0 0 0]
	fmt.Println(len(x))              // 5

	var a [2][2]string
	a[0][0] = "hola"
	a[0][1] = "mundo"
	a[1][0] = "adios"
	a[1][1] = "mundo"
	fmt.Println(a)

	b := [2][2]string{{"hola", "mundo"}, {"adios", "mundo"}}
	fmt.Println(b)

	/*
		un slice es un segmento de un array
		son indexables y tienen una longitud fija
		pero esta longitud puede cambiar
	*/

	/*
		longitud y capacidad
		- len y cap
	*/

	// hay 3 formas de crear un slice

	s := [6]int{1, 2, 3, 4, 5, 6}
	slice := s[1:3]
	fmt.Println(slice) // [2 3]

	var s1 []int
	s2 := []int{}
	s3 := []int{1, 2, 3, 4, 5, 6}
	fmt.Println(s1, s2, s3)

	s4 := make([]int, 5)
	s5 := make([]int, 5, 10)
	fmt.Println(len(s4), cap(s4), len(s5), cap(s5))

	// slice vacio
	var s6 []int
	fmt.Println(len(s6), cap(s6)) // 0 0

	if s6 == nil {
		fmt.Println("slice vacio")
	}

	// slice es una referencia al array subyacente

	s7 := []int{1, 2, 3, 4, 5, 6}
	s8 := s7[1:3]
	s8[0] = 10
	fmt.Println(s7) // [1 2 3 4 5 6]
	fmt.Println(s8) // [10 3]

	t := s7[1:4]                                                         // [2 3 4]
	u := s7[:2]                                                          // [1 2]
	v := s7[3:]                                                          // [4 5 6]
	fmt.Println(t, len(t), cap(t), u, len(u), cap(u), v, len(v), cap(v)) // a esta linea agregale el cap y len

	// crear slice con make
	s9 := make([]int, 5)
	printSlice("s9", s9)

	s10 := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	s9 = s10
	printSlice("s9", s9)

	s11 := make([]int, 0, 5)
	printSlice("s11", s11)
	printSlice("s10", s11[0:5])

	// agregar elementos

	var n []int
	n = append(n, 1)
	n = append(n, 3, 4, 5)
	n = append(n, n...)

	// copiar slices

	numbers := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	printSlice("numbers", numbers)

	copied := numbers[:5]
	printSlice("copied", copied)

	numbersCopy := make([]int, len(numbers))
	printSlice("numbersCopy", numbersCopy)

	copy(numbersCopy, numbers)
	printSlice("numbersCopy", numbersCopy)

	// iteracion - range

	arr := [10]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	for i, elem := range arr {
		fmt.Printf("%d %d\n", i, elem)
	}
	fmt.Println("")
	for _, elem := range arr {
		fmt.Printf("%d\n", elem)
	}
	fmt.Println("")

	for i, _ := range arr {
		arr[i] = 1 << uint(i) // == 2^i
	}
	fmt.Println(arr)

	for i := range arr {
		arr[i] = 1 << uint(i) // == 2^i
	}
	fmt.Println(arr)

	strs := []string{"a", "b", "", "d", ""}
	fmt.Println(notEmpty1(strs)) // [a b d]
	fmt.Println(notEmpty2(strs)) // [a b d]

	// maps

	/*
		coleccion no ordenada de pares key-value
		tambien llamados arreglos asociativos, tablas de hash o diccionarios
		no permite claves duplicadas
		el valor por default es nil
		se puede agregar, modificar y eliminar elementos, expecto que el map sea nil
	*/

	/*
		tipos de claves permitidos
		-las que tienen definida la comparacion por igualdad
		- se puede: booleans, enteros, strings, arrays
		- no se puede: slices, maps, functions
		tipos de valores permitidos: cualquiera
	*/

	/*
		creacion
	*/

	var m map[string]string // m es nil
	// m["key"] = "value" error en tiempo de ejecucion

	fmt.Println(m)

	var m1 = make(map[string]string)
	m1["brand"] = "Ford" // para agregar un valor se hace asi
	m1["model"] = "Mustang"
	m1["year"] = "1964"
	fmt.Println(m1)

	var m2 = map[string]string{"brand": "Ford", "model": "Mustang", "year": "1964"}
	fmt.Println(m2)

	var m3 = map[string]int{"brand": 1, "model": 2, "year": 3}
	fmt.Println(m3)

	// eliminar

	delete(m1, "model") // se eliminara
	fmt.Println(m1)

	// recuperar
	var elem = m1["motor"] // devuelve el valor nil
	fmt.Println(elem)

	var elem1, ok = m1["motor"] // devuelve el valor nil y false
	fmt.Println(elem1, ok)

	var elem2, ok2 = m1["year"] // devuelve el valor 1964 y true
	fmt.Println(elem2, ok2)
}

func printSlice(s string, x []int) {
	fmt.Printf("%s len=%d cap=%d %v\n", s, len(x), cap(x), x)
}

func notEmpty1(strings []string) []string {
	i := 0
	for _, s := range strings {
		if s != "" {
			strings[i] = s
			i++
		}
	}
	return strings[:i]
}

func notEmpty2(string []string) []string {
	out := string[:0]
	for _, s := range string {
		if s != "" {
			out = append(out, s)
		}
	}
	return out
}

type Array600Int [600]int

// de esta manera generamos una copia del array en el modulo
func sumPrimes(arr Array600Int) (res int) {
	for _, e := range arr {
		res += e
	}
	arr[0] = 18
	return
}
