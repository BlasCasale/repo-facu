package obligatorios

import (
	"fmt"
	structs "practica2/Structs"
)

/*
  Usando la estructura de datos definida en el ejercicio 9 resolver el siguiente
	problema. Se dispone de una lista con la información de los ingresantes a la
	Facultad  del  año  anterior.  De  cada  ingresante  se  conoce: apellido, nombre,
	ciudad de origen, fecha de nacimiento (día, mes, año), si presentó el título del
	colegio secundario y el código de la carrera en la que se inscribe (APU, LI, LS).
	Con esta información de los ingresantes se pide que recorra el listado una
	vez para:
	a)  Informar el nombre y apellido de los ingresantes cuya ciudad origen es
	“Bariloche”.
	b)  Calcular e informar el año en que más ingresantes nacieron.
	c)  Informar la carrera con la mayor cantidad de inscriptos.
	d)  Eliminar de la lista aquellos ingresantes que no presentaron el título.
*/

var listIncoming = structs.NewList[structs.Incoming]()

var mapYears = make(map[int]int)

var mapCarrers = make(map[string]int)

func createIncoming() {
	structs.AddNode(structs.Incoming{
		Name:       "Gonzalez",
		Lastname:   "Maria",
		CityOrigin: "Rosario",
		BornDate: structs.Date{
			Day:   14,
			Month: 7,
			Year:  2003,
		},
		Secondarie: true,
		Courrier:   "LT",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Ramirez",
		Lastname:   "Carlos",
		CityOrigin: "Córdoba",
		BornDate: structs.Date{
			Day:   2,
			Month: 11,
			Year:  2004,
		},
		Secondarie: false,
		Courrier:   "LI",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Fernandez",
		Lastname:   "Lucia",
		CityOrigin: "Mendoza",
		BornDate: structs.Date{
			Day:   29,
			Month: 5,
			Year:  2005,
		},
		Secondarie: true,
		Courrier:   "LT",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Lopez",
		Lastname:   "Federico",
		CityOrigin: "La Plata",
		BornDate: structs.Date{
			Day:   9,
			Month: 3,
			Year:  2002,
		},
		Secondarie: false,
		Courrier:   "LI",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Martinez",
		Lastname:   "Camila",
		CityOrigin: "Mar del Plata",
		BornDate: structs.Date{
			Day:   12,
			Month: 8,
			Year:  2006,
		},
		Secondarie: true,
		Courrier:   "LT",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Torres",
		Lastname:   "Joaquin",
		CityOrigin: "Salta",
		BornDate: structs.Date{
			Day:   5,
			Month: 1,
			Year:  2003,
		},
		Secondarie: false,
		Courrier:   "LI",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Sanchez",
		Lastname:   "Valentina",
		CityOrigin: "Neuquén",
		BornDate: structs.Date{
			Day:   17,
			Month: 6,
			Year:  2005,
		},
		Secondarie: true,
		Courrier:   "LT",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Moreno",
		Lastname:   "Bruno",
		CityOrigin: "San Luis",
		BornDate: structs.Date{
			Day:   30,
			Month: 9,
			Year:  2004,
		},
		Secondarie: false,
		Courrier:   "LI",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Rojas",
		Lastname:   "Sofia",
		CityOrigin: "Santa Fe",
		BornDate: structs.Date{
			Day:   22,
			Month: 12,
			Year:  2003,
		},
		Secondarie: true,
		Courrier:   "LT",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Adrogue",
		Lastname:   "Antonio",
		CityOrigin: "Bariloche",
		BornDate: structs.Date{
			Day:   3,
			Month: 12,
			Year:  2000,
		},
		Secondarie: true,
		Courrier:   "APU",
	}, listIncoming)

	structs.AddNode(structs.Incoming{
		Name:       "Perez",
		Lastname:   "Juan",
		CityOrigin: "San Juan",
		BornDate: structs.Date{
			Day:   23,
			Month: 2,
			Year:  2005,
		},
		Secondarie: false,
		Courrier:   "LI",
	}, listIncoming)
}

func printBariloche(l *structs.List[structs.Incoming]) {
	cur := l.First
	for cur != nil {
		if cur.Data.CityOrigin == "Bariloche" {
			fmt.Println(cur.Data)
		}
		cur = cur.Next
	}
}

func deleteTitle(l *structs.List[structs.Incoming]) {
	if l.First == nil {
		return
	}

	for l.First != nil {
		if !l.First.Data.Secondarie {
			l.First = l.First.Next
			l.Quantity--
		}
	}

	if l.First == nil {
		l.Last = nil
		return
	}

	cur := l.First
	prev := cur

	for cur != nil {
		if !cur.Data.Secondarie {
			prev.Next = cur.Next
			l.Quantity--
		}

		prev = cur
		cur = cur.Next
	}
}

func moreBorns(l structs.List[structs.Incoming], counterYears map[int]int) int {
	cur := l.First
	for cur != nil {
		counterYears[cur.Data.BornDate.Year]++
		cur = cur.Next
	}
	var year int
	max := -1
	for key, value := range counterYears {
		if value > max {
			year = key
			max = value
		}
	}

	return year
}

func getMoreCourriers(l *structs.List[structs.Incoming], mapCarrers map[string]int) string {
	cur := l.First
	for cur != nil {
		mapCarrers[cur.Data.Courrier]++
		cur = cur.Next
	}
	var courrier string
	max := -1
	for key, value := range mapCarrers {
		if value > max {
			courrier = key
			max = value
		}
	}
	return courrier
}

func Ejer1() {
	createIncoming()

	deleteTitle(listIncoming)

	printBariloche(listIncoming)

	moreBorns(*listIncoming, mapYears)

	getMoreCourriers(listIncoming, mapCarrers)
}
