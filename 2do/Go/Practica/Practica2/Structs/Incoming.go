package structs

import (
	"fmt"
	"sort"
)

/*
●  Apellido.
●  Nombre.
●  Ciudad de origen.
●  Fecha de nacimiento (día, mes, año).
●  Si presentó el título del colegio secundario
●  Código de la carrera en la que se inscribe (APU, LI, LS).
*/

type Date struct {
	day   int
	month int
	year  int
}

type Incoming struct {
	name       string
	lastname   string
	cityOrigin string
	bornDate   Date
	secondarie bool
	courrier   string
}

func (i Incoming) String() string {
	date := fmt.Sprintf("%02d/%02d/%04d", i.bornDate.day, i.bornDate.month, i.bornDate.year)
	return i.name + " " + i.lastname + " " + i.cityOrigin + " " + date + " " + i.courrier
}

func OlderInc(i1, i2 Incoming) bool {
	d1, d2 := i1.bornDate, i2.bornDate
	if d1.year != d2.year {
		return d1.year < d2.year
	}
	if d1.month != d2.month {
		return d1.month < d2.month
	}
	return d1.day < d2.day
}

func HigherName(i1, i2 Incoming) bool {
	return i1.name >= i2.name
}

func HigherLastname(i1, i2 Incoming) bool {
	return i1.lastname >= i2.lastname
}

func Inco() {
	students := []Incoming{
		{name: "Juan", lastname: "Pérez", cityOrigin: "Rosario", bornDate: Date{1, 5, 2002}, secondarie: true, courrier: "APU"},
		{name: "Ana", lastname: "Gómez", cityOrigin: "Córdoba", bornDate: Date{12, 8, 2000}, secondarie: true, courrier: "LI"},
		{name: "Luis", lastname: "Martínez", cityOrigin: "Mendoza", bornDate: Date{20, 3, 2001}, secondarie: false, courrier: "LS"},
	}

	sort.Slice(students, func(i, j int) bool {
		return HigherName(students[i], students[j])
	})

	fmt.Println(students)

	sort.Slice(students, func(i, j int) bool {
		return HigherLastname(students[i], students[j])
	})

	fmt.Println(students)

	sort.Slice(students, func(i, j int) bool {
		return OlderInc(students[i], students[j])
	})

	fmt.Println(students)
}
