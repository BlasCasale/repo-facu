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
	Day   int
	Month int
	Year  int
}

type Incoming struct {
	Name       string
	Lastname   string
	CityOrigin string
	BornDate   Date
	Secondarie bool
	Courrier   string
}

func (i Incoming) String() string {
	date := fmt.Sprintf("%02d/%02d/%04d", i.BornDate.Day, i.BornDate.Month, i.BornDate.Year)
	return i.Name + " " + i.Lastname + " " + i.CityOrigin + " " + date + " " + i.Courrier
}

func OlderInc(i1, i2 Incoming) bool {
	d1, d2 := i1.BornDate, i2.BornDate
	if d1.Year != d2.Year {
		return d1.Year < d2.Year
	}
	if d1.Month != d2.Month {
		return d1.Month < d2.Month
	}
	return d1.Day < d2.Day
}

func HigherName(i1, i2 Incoming) bool {
	return i1.Name >= i2.Name
}

func HigherLastname(i1, i2 Incoming) bool {
	return i1.Lastname >= i2.Lastname
}

func Inco() {
	students := []Incoming{
		{Name: "Juan", Lastname: "Pérez", CityOrigin: "Rosario", BornDate: Date{1, 5, 2002}, Secondarie: true, Courrier: "APU"},
		{Name: "Ana", Lastname: "Gómez", CityOrigin: "Córdoba", BornDate: Date{12, 8, 2000}, Secondarie: true, Courrier: "LI"},
		{Name: "Luis", Lastname: "Martínez", CityOrigin: "Mendoza", BornDate: Date{20, 3, 2001}, Secondarie: false, Courrier: "LS"},
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
