package practica3

import (
	"fmt"
	"sync"
)

/*
	Cree  un  programa  que  maneje  una  lista  de  contactos  de  manera
	concurrente.  La  lista  de  contactos  debe  permitir  agregar,  eliminar  y
	buscar contactos de manera segura desde múltiples goroutines.

	a)  Defina  una  estructura  Contact  que  contenga  campos  como
	Nombre, Apellido, CorreoElectronico, y Telefono.
	b)  Cree una estructura llamada Agenda que contenga un mapa de
	Contact con el correo electrónico como clave.
	c)  Implemente los siguientes métodos para la estructura Agenda:
	i.  AgregarContacto(contacto Contact): Agrega un
	nuevo contacto a la agenda.
	ii.  EliminarContacto(correo string): Elimina un
	contacto de la agenda dado su correo electrónico.
	iii. BuscarContacto(correo string) Contact: Busca y
	devuelve un contacto dado su correo electrónico.
	d)  Asegúrese de que las operaciones de agregar, eliminar y buscar
	contactos se realicen de manera concurrente y que la estructura
	Agenda  sea  segura  para  ser  accedida  desde  múltiples
	goroutines.
	e)  Cree  una  función  main()  que  cree  una  agenda,  inicie  varias
	goroutines para agregar, eliminar y buscar contactos de manera
	simultánea, y luego imprima el contenido de la agenda después
	de  un  tiempo  para  verificar  que  las  operaciones  se  hayan
	realizado correctamente.
*/

type Contact struct {
	name     string
	lastname string
	mail     string
	phone    string
}

type ContactWithoutMail struct {
	name     string
	lastname string
	phone    string
}

type ContactList struct {
	contacts map[string]ContactWithoutMail
	mu       sync.RWMutex
}

func (cl *ContactList) Add(c Contact, wg *sync.WaitGroup) (bool, error) {

	if c.name == "" || c.lastname == "" || c.phone == "" || c.mail == "" {
		return false, fmt.Errorf("no se pueden enviar cambios vacios")
	}

	cl.mu.Lock()
	defer cl.mu.Unlock()
	defer wg.Done()

	_, founded := cl.contacts[c.mail]

	if founded {
		return false, fmt.Errorf("\nse ha encontrado duplicado un contacto con el mail %s", c.mail)
	}

	cl.contacts[c.mail] = ContactWithoutMail{c.name, c.lastname, c.phone}

	return true, nil
}

func (cl *ContactList) Delete(mail string, wg *sync.WaitGroup) (bool, error) {
	cl.mu.Lock()
	defer cl.mu.Unlock()
	defer wg.Done()

	_, founded := cl.contacts[mail]

	if founded {
		delete(cl.contacts, mail)
		fmt.Printf("se ha eliminado el mail %s\n", mail)
		return true, nil
	}

	return founded, fmt.Errorf("\nno se ha encontrado el mail %s en el map", mail)
}

func (cl *ContactList) Search(mail string, wg *sync.WaitGroup) (Contact, error) {
	cl.mu.RLock()
	defer cl.mu.RUnlock()
	defer wg.Done()

	cont, founded := cl.contacts[mail]

	if !founded {
		return Contact{}, fmt.Errorf("\nno se ha encontrado el contacto con mail %s", mail)
	}

	fmt.Printf("se ha encontrado el contacto con mail %s\n", mail)

	return Contact{cont.name, cont.lastname, mail, cont.phone}, nil
}

func Ejer8() {
	cl := ContactList{
		contacts: make(map[string]ContactWithoutMail),
	}

	var wg sync.WaitGroup

	wg.Add(1)
	go cl.Add(Contact{"blas", "casale", "blas@mail.com", "123"}, &wg)
	wg.Add(1)
	go cl.Add(Contact{"blas", "casale", "blas@mail.com", "123"}, &wg)
	wg.Add(1)
	go cl.Add(Contact{"jazmin", "aranda", "jazaranda@mail.com", "123"}, &wg)
	wg.Add(1)
	go cl.Add(Contact{"nicolas", "galdos", "nico@mail.com", "123"}, &wg)
	wg.Add(1)
	go cl.Search("blas@mail.com", &wg)
	wg.Add(1)
	go cl.Search("nico@mail.com", &wg)
	wg.Add(1)
	go cl.Delete("nico@mail", &wg)
	wg.Add(1)
	go cl.Delete("nico@mail.com", &wg)

	wg.Wait()
	for k, v := range cl.contacts {
		fmt.Println(k, v)
	}

}
