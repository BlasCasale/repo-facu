package ejer12

/*
Un  banco  dispone  de  un  listado  en  donde  almacena  la  información de
aquellos  clientes que vienen a pagar impuestos. De cada cliente conoce: DNI,
Nombre, Apellido, código de impuesto a pagar (A, B, C o D) y el monto a pagar.
Se pide:

a.  Realizar  la  atención  de  los  clientes  hasta  que  se  recauden al menos
10.000 pesos o hasta que se terminen los clientes.
b.  Al finalizar la atención informar el código de impuesto que más veces se
pagó por los clientes que fueron atendidos.
c.  Al  finalizar  la  atención  informar,  en  caso  de  que  hayan  quedado,  la
cantidad de clientes sin atender
*/

type CodeBill map[string]int

type Client struct {
	dni      int
	name     string
	lastName string
	code     string
	amount   float32
}

func Ejer12() {
	codes := CodeBill{"A": 0, "B": 1, "C": 2, "D": 3}

	var clients = []Client{
		{dni: 12345678, name: "Juan", lastName: "Pérez", code: "A", amount: 1500.50},
		{dni: 87654321, name: "María", lastName: "Gómez", code: "B", amount: 2500.75},
		{dni: 11223344, name: "Carlos", lastName: "Rodríguez", code: "C", amount: 1800.00},
		{dni: 44332211, name: "Lucía", lastName: "Fernández", code: "D", amount: 3000.20},
		{dni: 55667788, name: "Pedro", lastName: "Martínez", code: "A", amount: 990.99},
		{dni: 99887766, name: "Ana", lastName: "López", code: "B", amount: 1340.60},
		{dni: 66554433, name: "Diego", lastName: "Sánchez", code: "C", amount: 2750.80},
		{dni: 33445566, name: "Florencia", lastName: "Ramírez", code: "D", amount: 4100.45},
		{dni: 77889900, name: "Sofía", lastName: "Torres", code: "A", amount: 800.00},
		{dni: 11221122, name: "Martín", lastName: "García", code: "B", amount: 2290.10},
		{dni: 44556677, name: "Paula", lastName: "Suárez", code: "C", amount: 1960.35},
		{dni: 22334455, name: "Leonardo", lastName: "Mendoza", code: "D", amount: 3650.99},
		{dni: 77881122, name: "Camila", lastName: "Aguilar", code: "A", amount: 1420.20},
		{dni: 66778899, name: "Tomás", lastName: "Moreno", code: "B", amount: 2111.11},
		{dni: 99112233, name: "Valentina", lastName: "Rivas", code: "C", amount: 2870.60},
		{dni: 55664433, name: "Federico", lastName: "Alonso", code: "D", amount: 3999.99},
	}

	var ocurrences [4]int

	var total float32

	for total < 10000 && len(clients) > 0 {
		client := clients[0]
		clients = clients[1:]

	}

}
