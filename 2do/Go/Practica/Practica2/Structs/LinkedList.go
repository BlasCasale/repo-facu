package structs

type LinkedList struct {
	data []int
}

func RoamInOrderLinkedList(l *LinkedList, f func(int)) {
	for _, el := range l.data {
		f(el)
	}
}

func RoamReverseLinkedList(l *LinkedList, f func(int)) {
	for i := len(l.data) - 1; i >= 0; i-- {
		f(l.data[i])
	}
}
