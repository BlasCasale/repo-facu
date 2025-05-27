package practica3

/*
	Definir e implementar las operaciones de lista enlazada de la práctica
	anterior usando el siguiente tipo de datos, de una lista genérica:

	type List[T any] struct {
	   head, tail *element[T]
	}

	type element[T any] struct {
	   next *element[T]
	   val  T
	}
*/

type List[T any] struct {
	head, tail *Node[T]
	quantity   int
}

type Node[T any] struct {
	data T
	next *Node[T]
}

type Ordered interface {
	~int | ~int32 | ~int64 | ~float64 | ~string
}

func NewListEmpty[T any]() *List[T] {
	return &List[T]{}
}

func NewList[T any](v T) *List[T] {
	newNode := &Node[T]{data: v, next: nil}
	return &List[T]{
		head:     newNode,
		tail:     newNode,
		quantity: 1,
	}
}

func AddNode[T any](v T, l *List[T]) {
	newNode := &Node[T]{data: v}

	if l.head == nil {
		l.head = newNode
	} else {
		l.tail.next = newNode
	}
	l.tail = newNode
	l.quantity++
}

func InsertInOrder[T any](v T, l *List[T], f func(a, b T) bool) {

	newNode := &Node[T]{data: v}

	if l.head == nil {
		newNode.next = nil
		l.head = newNode
		l.tail = newNode
	} else {
		var prev *Node[T]

		cur := l.head

		for cur != nil {
			if f(cur.data, v) {
				break
			}
			prev = cur
			cur = cur.next
		}

		newNode.next = cur

		if cur == l.head {
			l.head = newNode
		} else {
			prev.next = newNode
		}
	}

	l.quantity++
}

func LessThan[T Ordered](a, b T) bool {
	return a <= b
}

func Ejer2() {

}
