package ejer8

import (
	"fmt"
	"strconv"
)

/*
Escriba un programa que implemente la función:
func Convert ( v int , b int ) string

a.  La función debe convertir el entero v, en un string en su representación
en base b. El string será el valor de retorno. Por ejemplo si se invoca:

s = Convert ( 23 , 2 )

En s se almacenaría el valor “10111”.

La base debe ser mayor que 1 y menor que 37 dado que irı́a de base-2
hasta base-36, que usarı́a los dígitos:

“0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ”

b.  Re-implemente la función considerando que v puede ser negativo, y se
empleará el mismo símbolo (-) para su representación en base-b.
*/

func ConvertA(n, b int) string {

	if b < 2 || b > 36 {
		panic("Debe ingresar una base entre 2 y 36")
	}

	if n < 0 {
		return "-" + strconv.FormatInt(int64(-n), b)
	}

	return strconv.FormatInt(int64(n), b)
}

func Ejer8() {
	fmt.Printf("Conversion a la cadena %s", ConvertA(361273216, 23))
}
