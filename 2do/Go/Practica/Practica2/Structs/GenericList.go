package structs

import "fmt"

type List[T any] struct {
	First, Last *Node[T]
	Quantity    int
}

type Node[T any] struct {
	Data T
	Next *Node[T]
}

func NewList[T any]() *List[T] {
	return &List[T]{First: nil, Last: nil, Quantity: 0}
}

func NewNode[T any](v T) *List[T] {
	node := &Node[T]{Data: v}
	return &List[T]{
		First:    node,
		Last:     node,
		Quantity: 1,
	}
}

func AddNode[T any](v T, l *List[T]) {
	node := &Node[T]{Data: v, Next: nil}

	if l.First == nil {
		l.First = node
		l.Last = node
		l.Quantity = 1
	} else {
		l.Last.Next = node
		l.Last = node
		l.Quantity++
	}
}

func InsertOrder[T any](v T, f func(T, T) bool, l *List[T]) {
	node := &Node[T]{Data: v}

	if l.First == nil {
		l.First = node
		l.Last = node
		l.Quantity = 1
	} else {
		var prev *Node[T]

		cur := l.First

		for cur != nil {
			if f(cur.Data, v) {
				break
			}
			prev = cur
			cur = cur.Next
		}

		node.Next = cur

		if cur == l.First {
			l.First = node
		} else {
			prev.Next = node
		}

		l.Quantity++
	}
}

func DeleteNode[T any](f func(T) bool, l *List[T]) {
	if l.First == nil {
		fmt.Println("La lista esta vacia")
	}

	if f(l.First.Data) {
		l.First = l.First.Next
		l.Quantity--
	} else {
		cur := l.First
		prev := cur

		for cur != nil {
			prev = cur
			if f(cur.Data) {
				break
			}
			cur = cur.Next
		}

		if cur == l.First {
			l.First = l.First.Next
		} else {
			prev.Next = cur.Next
		}
	}
}

func PrintRecur[T any](node *Node[T]) {
	if node != nil {
		PrintRecur(node.Next)
		fmt.Println(node.Data)
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

	PrintRecur(l.First)

	li := NewNode(1)

	InsertOrder(2, LowerInt, li)
	InsertOrder(4, LowerInt, li)
	InsertOrder(5, LowerInt, li)
	InsertOrder(6, LowerInt, li)
	InsertOrder(7, LowerInt, li)

	PrintRecur(li.First)
}
