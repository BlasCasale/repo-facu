package ejer9

<<<<<<< HEAD
import (
	"container/list"
	"fmt"
	"practica2/structs"
)

=======
>>>>>>> f0e2fd8cb3f78ca44a51b7f2e77b804c620b0438
/*
Usando memoria dinámica con punteros escribir una programa que implemente
y use una lista enlazada de enteros.
a.  Definir  el  tipo,  operaciones  para  agregar  elementos  adelante,  atrás,
poder iterar, etc. Las operaciones pueden ser:

func New() List
func IsEmpty(self List) bool
func Len(self List) int
func FrontElement(self List) int
func Next(self List) List
func ToString(self List) string
func PushFront(self List, elem int)
func PushBack(self List, elem int)
func Remove(self List) int
func Iterate(self List, f func(int) int)

b.  Generar el programa que utiliza las operaciones programadas.
c.  Investigar  y  usar  el  paquete:  ‘‘container/list’’.  Ver  las  diferencias  y
similitudes con su implementación. Pensar de qué forma se podría hacer
de tipos genéricos.
d.  Ver de mejorar la interfaz de las funciones, por ejemplo usando métodos
y códigos de error.
Sub-objetivo:  Uso  de  memoria  dinámica,  structs,  funciones  anónimas.
Estudiar  biblioteca  estándar  ofrecida  por  el  lenguaje.  Pensar  cómo
encapsular código, orientar al alumno a pensar en packages. Métodos
para mejorar la interfaz y ver la posibilidad de retornar más de un valor
con código de errores en los casos que sea necesario
*/
func Ejer9() {
<<<<<<< HEAD
	l := structs.New()

	ll := list.New()

	ll.PushFront(1)
	ll.PushFront(1)
	ll.PushFront(1)
	ll.PushFront(1)

	for e := ll.Front(); e != nil; e = e.Next() {
		fmt.Println(e.Value)
	}

	for e := ll.Back(); e != nil; e = e.Prev() {
		fmt.Println(e.Value)
	}

	structs.PushFront(l, 3)
	structs.PushFront(l, 3)
	structs.PushFront(l, 3)
	structs.PushFront(l, 3)

	fmt.Println(structs.ToString(l))

	structs.Iterate(l, structs.AddInList)

	fmt.Println(structs.ToString(l))

	structs.GenericList()
=======

>>>>>>> f0e2fd8cb3f78ca44a51b7f2e77b804c620b0438
}
