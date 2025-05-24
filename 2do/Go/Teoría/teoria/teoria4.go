package teoria

import (
	"fmt"
	"math"
)

type Celc float64
type Fahren float64

type MyInt int

type MyString string
type MyString2 string

type MyFloat float64

type MySlice []int

type Person struct {
	name string
	age  int
}

type Point struct {
	x, y int
}

type Adress struct {
	hostname string
	port     int
}

// estructuras embebidas

type Circle struct {
	x, y Point
	r    float64
}

type Cylinder struct {
	circle Circle
	height int
}

// interfaces

/*
 un tipo interface esta definido por un conjunto de firmas de metodos

 un valor de un tipo interface puede ser cualquiera que implemente esos metodos

 un tipo implementa un tipo interface, implementando sus metodos. no hay una declaracion explicita de intencion (implements)
*/

type Abser interface {
	Abs() float64
}

type Vertex struct {
	x, y float64
}

type I interface {
	M()
}

func describe(i I) {
	fmt.Println("(%v, %T)", i, i)
}

func (v *Vertex) Abs() float64 {
	return math.Sqrt(v.x*v.x + v.y*v.y)
}

func do(i interface{}) {
	switch v := i.(type) { // type switch
	case int:
		fmt.Printf("Twice %v is %v\n", v, v*2)
	case string:
		fmt.Printf("%q is %v bytes long\n", v, len(v))
	default:
		fmt.Printf("I don't know about type %T!\n", v)
	}
}

func teoria4() {

	// pointers => direccion a un puntero en memoria

	var p *int
	// fmt.Println(p) // error en ejecucion

	if p != nil {
		fmt.Println(*p)
	} else {
		fmt.Println("p es nil")
	}

	i := 42
	p = &i
	fmt.Println(*p) // 42

	// new => reserva memoria
	k := new(int)
	j := new(int)

	*k = 21
	*j = 5

	fmt.Println(*k, *j)

	pointer1 := new(int)
	pointer2 := 4

	fmt.Println(*pointer1, pointer2) // 0 4

	zero(pointer1)  // esto al ser un puntero unicamente le debo enviar la variable
	zero(&pointer2) // esta como es una variable comun, debo enviarle la direccion de esa variable para poder cambiarla en memoria

	fmt.Println(*pointer1, pointer2) // 0 0

	// declaracion de tipos

	// var fl MyFloat = 3.14
	// var float float32 = 3.14
	// fmt.Println(fl == float) // mismatched types

	// casting
	// var str MyString = "hola"
	// var str2 MyString2 = "hola"
	// fmt.Println(str == str2) // mismatched types

	// var str3 string = "hola"
	// var str4 MyString2 = MyString2(str3)
	// fmt.Println(str4 == str2) // casteando el string puedo lograr que pueda operar dentro de mi tipo

	// metodos

	var cel Celc = 100
	var fahren Fahren = 100

	fmt.Println(cel.String())
	fmt.Println(fahren.String())

	fmt.Println(CelToFahr(cel).String())
	fmt.Println(FahrToCel(fahren).String())

	num1 := MyFloat(-math.Sqrt2)
	// no se va a alterar el valor, dado que en las funciones se trabaja con parametros por valor
	fmt.Println(num1)
	num1.Scale(2)
	fmt.Println(num1)

	// var ptr1 *MyFloat = MyFloat(math.Sqrt2)
	// fmt.Println(*ptr1)
	// ptr1.Scale2(2)
	// fmt.Println(*ptr1) // el valor cambia porque se esta trabajando sobre la direccion de memoria, entonces cambio el valor

	fl1 := MyFloat(3.43)
	ptr2 := &fl1
	ptr2.Scale2(2)
	fmt.Println(fl1)

	fl2 := MyFloat(3.43)
	fl2.Scale2(2)
	fmt.Println(fl2) // volvera a cambiar porque se estra trabajando sobre la direccion de memoria

	// el receiver puede ser nil

	ms1 := MySlice{1, 2, 3, 4, 5}
	var ms2 MySlice
	fmt.Println(ms1.Add(), ms2.Add()) // 15 0

	// declaracion de struct

	var p1 Person
	p2 := Person{"Pablo", 20}
	p3 := new(Person)
	p4 := Person{name: "antonio", age: 34}

	p1.age = 15
	p1.name = "juan"
	p3 = &p2

	fmt.Println(p1)  // juan 15
	fmt.Println(p2)  // pablo 20
	fmt.Println(p3)  // &{Pablo 20}
	fmt.Println(*p3) // Pablo 20
	fmt.Println(p4)  // antonio 34

	p3.age = 30

	fmt.Println(p2)  // Pablo 30
	fmt.Println(p3)  // &{Pablo 30}
	fmt.Println(*p3) // Pablo 30

	// comparacion entre structs

	point1 := Point{1, 2}
	point2 := Point{2, 1}

	fmt.Println(point1 == point2)                             // false
	fmt.Println(point1.x == point2.x && point1.y == point2.y) // true

	// los structs comparables se pueden usar como clave de un map

	hits := make(map[Adress]int)
	hits[Adress{"localhost", 8080}]++

	//interfaces

	var ab Abser
	f := MyFloat(123.45)
	v := Vertex{3, 4}

	ab = f
	fmt.Println(ab.Abs()) // 123.45
	ab = &v
	fmt.Println(ab.Abs())

	// el valor de un interface puede pensarse como un par (value, type)

	// la invocacion de un metodo de la interface, ejecuta el metodo del mismo nombre del tipo subyacente

	// el valor del tipo concreto puede ser nil

	// un valor de interface nil no tiene ni un tipo concreto ni un valor de dicho tipo

	var t I
	describe(t) // (nil, nil)
	t.M()       // runtime error

	// type assertion

	var newI interface{} = "hello"

	str5 := newI.(string)
	fmt.Println(str5) // hello

	str6, ok := newI.(string)
	fmt.Println(str6, ok) // hello true

	str7, ok := newI.(int)
	fmt.Println(str7, ok) // 0 false

	// f = newI.(float64) // runtime error

	// type switch

}

func (mv *MySlice) Add() (res int) {
	res = 0

	if mv == nil {
		return
	}

	for _, e := range *mv {
		res += e
	}

	return
}

func (a *MyFloat) Scale2(s float64) {
	*a = *a * MyFloat(s)
}

func (a MyFloat) Scale(s float64) {
	a = a * MyFloat(s)
}

func (c Celc) String() string {
	return fmt.Sprintf("%g°C", c)
}

func (f Fahren) String() string {
	return fmt.Sprintf("%g°F", f)
}

func CelToFahr(c Celc) Fahren {
	return Fahren(c*9/5 + 32)
}

func FahrToCel(f Fahren) Celc {
	return Celc((f - 32) * 5 / 9)
}

func zero(xPtr *int) {
	*xPtr = 0
}

func (f MyFloat) Abs() float64 {
	if f < 0 {
		return float64(-f)
	}

	return float64(f)
}
