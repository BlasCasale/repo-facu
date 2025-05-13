package structs

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
