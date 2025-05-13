package structs

import (
	"fmt"
	"strconv"
)

type Stack struct {
	data []int
}

func NewStack() *Stack {
	return &Stack{}
}

func IsEmptyStack(s *Stack) bool {
	return s == nil
}

func LenStack(s Stack) int {
	return len(s.data)
}

func ToStringStack(s *Stack) string {
	aux := ""
	if s == nil {
		aux = "La pila esta vacia"
	} else {
		for _, el := range s.data {
			aux += strconv.Itoa(el)
		}

	}
	return aux
}

func FrontElementStack(s *Stack) (int, error) {
	if s == nil {
		return 0, fmt.Errorf("la pila esta vacia")
	}

	return s.data[0], nil
}

func Push(s *Stack, n int) {
	s.data = append(s.data, n)
}

func Pop(s *Stack) (int, error) {
	if len(s.data) == 0 {
		return 0, fmt.Errorf("la pila esta vacia")
	}
	aux := s.data[len(s.data)-1]
	s.data = s.data[0 : len(s.data)-1]
	return aux, nil
}

func IterateStack(s *Stack, f func(int) int) {
	for _, el := range s.data {
		f(el)
	}
}

/*
func New() Stack
func IsEmpty(s Stack) bool
func Len(s Stack) int
func ToString(s Stack) string
func FrontElement(s Stack) int
func Push(s Stack , element int)
func Pop(s  Stack) int
func Iterate(s Stack , f func (int) int)
*/
