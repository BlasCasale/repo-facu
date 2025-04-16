package teoria

import "fmt"

type List[T any] struct {
	first, last *node[T]
}

type node[T any] struct {
	data T
	next *node[T]
}

type Tree[T any] struct {
	data  T
	left  *Tree[T]
	right *Tree[T]
}

func teoria6() {

	ints := map[string]int64{
		"first":  35587,
		"second": 60000,
	}

	floats := map[int]float64{
		1: 213.4245,
		2: 342345.213214,
	}

	fmt.Println(sumInts(ints))
	fmt.Println(sumGenerics(floats))

	// inicializacion de lista

	list := List[int]{}

	list.GetAll()

	// inicializacion de arboles

	tree := Tree[int]{}

	// inicializacion de arbol con el retorno del puntero
	secondTree := &Tree[string]{data: "Blas"}

	tree.findNode(10, itsEqual, lessThan)

	secondTree.insert("Juan", smallerString)
}

func sumInts(m map[string]int64) int64 {
	var result int64 = 0

	for _, v := range m {
		result += v
	}

	return result
}

/*
[T any]
[T comparable]
[T Stringer]
[T int, int16, int32, int64, int8, float32, float64]
[T Stringer | error]
*/
func sumGenerics[K comparable, V int64 | float64](m map[K]V) V {
	var result V
	for _, v := range m {
		result += v
	}

	return result
}

func (l *List[T]) PutOnFront(v T) {
	l.first = &node[T]{v, l.first}
	if l.last == nil {
		l.last = l.first
	}
}

func (l *List[T]) PutOnTail(v T) {
	nn := &node[T]{data: v}
	if l.last == nil {
		l.first = nn
	} else {
		l.last.next = nn
	}
	l.last = nn
}

func (l *List[T]) GetAll() []T {
	var result []T

	for e := l.first; e != nil; e = e.next {
		result = append(result, e.data)
	}
	return result
}

func smallerString(s1, s2 string) bool {
	return s1 > s2
}

func lessThan(x, y int) bool {
	return x < y
}

func itsEqual(x, y int) bool {
	return x == y
}

func (t *Tree[T]) insert(v T, f func(T, T) bool) *Tree[T] {
	if t == nil {
		return &Tree[T]{data: v}
	} else {
		if f(t.data, v) {
			t.left = t.left.insert(v, f)
		} else {
			t.right = t.right.insert(v, f)
		}
		return t
	}
}

func (t *Tree[T]) getAll() []T {
	var result []T

	if t != nil {
		result = append(result, t.left.getAll()...)
		result = append(result, t.data)
		result = append(result, t.right.getAll()...)
	}
	return result
}

func (t *Tree[T]) findNode(v T, f func(T, T) bool, f2 func(T, T) bool) *Tree[T] {
	if t == nil {
		return nil
	}

	if f(t.data, v) {
		return t
	}

	if f2(t.data, v) {
		return t.left.findNode(v, f, f2)
	}

	return t.right.findNode(v, f, f2)
}

type Container[T any] interface {
	Len() int
	Append(T)
	Remove() (T, error)
}
