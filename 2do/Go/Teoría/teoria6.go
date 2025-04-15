package teoria

import "fmt"

type List[T any] struct {
	first, last *node[T]
}

type node[T any] struct {
	data T
	next *node[T]
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
