package structs

import "fmt"

type List[T any] struct {
	first, last *Node[T]
	quantity    int
}

type Node[T any] struct {
	data T
	next *Node[T]
}

func NewNode[T any](v T) *List[T] {
	node := &Node[T]{data: v}
	return &List[T]{
		first:    node,
		last:     node,
		quantity: 1,
	}
}

func InsertOrder[T any](v T, f func(T, T) bool, l *List[T]) {
	node := &Node[T]{data: v}

	if l.first == nil {
		l.first = node
		l.last = node
		l.quantity = 1
	} else {
		var prev *Node[T]

		cur := l.first

		for cur != nil {
			if f(cur.data, v) {
				break
			}
			prev = cur
			cur = cur.next
		}

		node.next = cur

		if cur == l.first {
			l.first = node
		} else {
			prev.next = node
		}

		l.quantity++
	}
}

func PrintRecur[T any](node *Node[T]) {
	if node != nil {
		PrintRecur(node.next)
		fmt.Println(node.data)
	}
}

func LowerString(s1, s2 string) bool {
	return s1 < s2
}

func LowerInt(x, y int) bool {
	return x < y
}

func GenericList() {
	l := NewNode("hola")

	InsertOrder("blas", LowerString, l)
	InsertOrder("blas1", LowerString, l)
	InsertOrder("blas2", LowerString, l)
	InsertOrder("blas3", LowerString, l)

	PrintRecur(l.first)

	li := NewNode(1)

	InsertOrder(2, LowerInt, li)
	InsertOrder(4, LowerInt, li)
	InsertOrder(5, LowerInt, li)
	InsertOrder(6, LowerInt, li)
	InsertOrder(7, LowerInt, li)

	PrintRecur(li.first)
}
