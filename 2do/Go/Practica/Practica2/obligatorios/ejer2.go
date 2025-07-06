package obligatorios

import (
	"crypto/sha256"
	"fmt"
	"time"
)

/*
Implemente una blockchain para que sea soporte de una cryptomoneda   que
incluya la creación de billeteras para los clientes. Una blockchain, o cadena de
bloques,  es  un  sistema  digital  distribuído  que  funciona  como  un  libro  de
contabilidad público e inmutable. Almacena información sobre transacciones de
forma  segura  y  descentralizada,  sin  necesidad  de  intermediarios.  Cada
transacción  se  agrupa  en  un  bloque,  que  se  enlaza  con  el bloque anterior,
creando una cadena irrompible.

Utilice structs para representar la transacción (con el monto, el identificador de
quien envía dinero, el identificador de quien recibe ese dinero y la fecha/hora
de la transacción - timestamp -), el bloque (que tienen el hash, el hash previo,
la transacción (data) y la fecha/hora de creación de dicho bloque), la cadena de
bloques y la billetera (con el identificador, nombre y apellido del cliente).

Tip:  puede  utilizar  la  librería  crypto/sha256  para  crear  el  hash  del  bloque
anterior.

a)  Defina todos los tipos de datos que va a utilizar.
b)  Programe funciones para:
i)  Crear una billetera
ii)  Enviar una transacción
iii)  Insertar un bloque en la cadena
iv)  Obtener el saldo de un usuario (recorriendo toda la cadena)
v)  Realizar  una  función  que  valide  que  la  cadena  sea  consistente
recorriéndola  y  verificando  que  el  hash  almacenado  del  bloque
anterior es válido
vi)  Si  utilizó  un  slice  para  la  estructura  de  la  cadena  de  bloques
cambie la implementación con una lista enlazada. Puede reutilizar
la implementación del ejercicio 9. ¿Cuál fue el impacto que tuvo en
su programa?
i)  ¿Cómo  validar  que  la  transacción  solo  se  pueda  hacer  si  la
billetera que va a enviar los fondos tiene saldo suficiente?
*/

type Block struct {
	Hash         string
	PreviousHash string
	Data         Transaction
	Timestamp    string
}

type Transaction struct {
	IdSender   int
	IdReceiver int
	Amount     float32
	timestamp  string
}

type Wallet struct {
	Id      int
	Name    string
	Surname string
	Balance float32
}

type Blockchain struct {
	First, Last *NodeBlock
	Quantity    int
}

type NodeBlock struct {
	data Block
	next *NodeBlock
}

func GetBalance(blockchain *Blockchain, walletId int) float32 {
	var balance float32 = 0

	for block := blockchain.First; block != nil; block = block.next {
		tx := block.data.Data

		if tx.IdReceiver == walletId {
			balance += tx.Amount
		}
		if tx.IdSender == walletId {
			balance -= tx.Amount
		}
	}

	return balance
}

func InitialTransfer(receiver Wallet, amount float32, blockchain *Blockchain) {
	// Se crea una transacción con IdSender = -1 (representa "el sistema")
	newTransaction := Transaction{
		IdSender:   -1,
		IdReceiver: receiver.Id,
		Amount:     amount,
		timestamp:  time.Now().String(),
	}

	str := fmt.Sprintf("%d %d %f", newTransaction.IdSender, newTransaction.IdReceiver, newTransaction.Amount)
	hash := sha256.Sum256([]byte(str))

	newBlock := &NodeBlock{
		data: Block{
			Hash:         fmt.Sprintf("%x", hash),
			PreviousHash: "",
			Data:         newTransaction,
			Timestamp:    time.Now().String(),
		},
	}

	blockchain.First = newBlock
	blockchain.Last = newBlock
	blockchain.Quantity++
}

func CreateWallet(id int, name string, surname string) Wallet {
	return Wallet{id, name, surname, 0}
}

func SendTransaction(sender, receiver Wallet, amount float32, blockchain *Blockchain) {
	senderBalance := GetBalance(blockchain, sender.Id)
	if senderBalance < amount {
		fmt.Println("el saldo es insuficiente para realizar la transaccion")
		return
	}

	newTransaction := Transaction{sender.Id, receiver.Id, amount, time.Now().String()}
	str := fmt.Sprintf("%d %d %f", sender.Id, receiver.Id, amount)
	hash := sha256.Sum256([]byte(str))

	newBlock := &NodeBlock{
		data: Block{
			Hash:         fmt.Sprintf("%x", hash),
			PreviousHash: "",
			Data:         newTransaction,
			Timestamp:    time.Now().String(),
		},
	}

	newBlock.data.PreviousHash = blockchain.Last.data.Hash
	blockchain.Last.next = newBlock
	blockchain.Last = newBlock
	blockchain.Quantity++
}

func TestIngrety(blockchain *Blockchain) bool {
	integrity := true

	for block := blockchain.First; block != nil; block = block.next {
		if block.next != nil && block.data.Hash != block.next.data.PreviousHash {
			integrity = false
		}
	}

	return integrity
}

func Ejer2() {
	bc := &Blockchain{}

	blas := CreateWallet(1, "Blas", "Casale")
	ana := CreateWallet(2, "Ana", "López")

	InitialTransfer(blas, 100, bc)

	SendTransaction(blas, ana, 30, bc)

	fmt.Printf("Saldo Blas: %f \n", GetBalance(bc, blas.Id)) // Debería ser 70
	fmt.Printf("Saldo Ana: %f \n", GetBalance(bc, ana.Id))   // Debería ser 30

	SendTransaction(blas, ana, 40, bc)
	fmt.Printf("Saldo Blas: %f \n", GetBalance(bc, blas.Id)) // Debería ser 30
	fmt.Printf("Saldo Ana: %f \n", GetBalance(bc, ana.Id))   // Debería ser 30

	fmt.Println(TestIngrety(bc))
}
