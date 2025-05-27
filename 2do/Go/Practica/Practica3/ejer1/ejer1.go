package practica3

/*
  Realice  un  programa  que  haga  dos  usos  con  distintos  tipos  del
	siguiente tipo genérico:

	type Map[K comparable, V any] map[K]V

	Objetivo: tipos genéricos
*/

type MyMap[K comparable, V any] map[K]V

func Ejer1() {
	mapInt := MyMap[int, string]{}

	mapInt[1] = "one"
	mapInt[2] = "two"
	mapInt[3] = "three"

	mapString := MyMap[string, int]{}

	mapString["one"] = 1
	mapString["two"] = 2
	mapString["three"] = 3
}
