package funciones

import (
	"fmt"
	"io"
	"log"
	"math/rand"
	"net/http"
	"time"
)

func Iterar(n int) {
	for i := range 10 {
		fmt.Println(n, ":", i)
		amt := time.Duration(rand.Intn(250))
		time.Sleep(time.Millisecond * amt)
	}
}

func ResponseSize(url string) {

	fmt.Println("get ", url)

	response, err := http.Get(url)

	if err != nil {
		log.Fatal(err)
	}

	defer response.Body.Close()

	body, err := io.ReadAll(response.Body)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(url, len(body))
}
