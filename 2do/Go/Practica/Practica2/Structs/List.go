package structs

import "strconv"

type ListInt struct {
	first, last *NodeInt
	quantity    int
}

type NodeInt struct {
	data int
	next *NodeInt
}

func New() ListInt {
	return ListInt{}
}

func IsEmpty(self ListInt) bool {
	return self.first == nil
}

func Len(self ListInt) int {
	return self.quantity
}

func FrontElement(self ListInt) int {
	return self.first.data
}

func Next(self ListInt) ListInt {
	if self.first == nil {
		return ListInt{}
	}

	return ListInt{
		first:    self.first.next,
		last:     self.last,
		quantity: self.quantity - 1,
	}
}

func ToString(self ListInt) string {
	str := ""

	aux := self.first

	for aux != nil {
		str += strconv.Itoa(aux.data)
		aux = aux.next
	}

	return str
}

func PushFront(self ListInt, elem int) {
	aux := &NodeInt{next: self.first, data: elem}
	self.first = aux
	self.quantity++
}

func PushBack(self ListInt, elem int) {
	aux := &NodeInt{next: nil, data: elem}
	self.last.next = aux
	self.last = aux
	self.quantity++
}

func Remove(self ListInt) int {
	aux := &ListInt{first: self.first.next, last: self.last, quantity: self.quantity - 1}
	value := self.first.data
	self = *aux
	return value
}

func Iterate(self ListInt, f func(int) int) {
	if self.first == nil {
		return
	}

	f(self.first.data)

	if self.first.next != nil {
		aux := ListInt{first: self.first.next, last: self.last, quantity: self.quantity - 1}
		Iterate(aux, f)
	}
}

func AddInList(n int) int {
	return n + 3
}

/*
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
*/
