package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/", index).Methods("GET")

	_ = http.ListenAndServe(":57600", handlers.LoggingHandler(os.Stdout, r))
}

var index = http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
	_, _ = fmt.Fprint(w, "<body style='text-align: center;' bgcolor='purple'><h1>Hellow  DOCKER</h1><br><br><br><br><h1>Hellow  DOCKER</h1><br><br><br><br><h1>Hellow  DOCKER</h1><br><br><br><br></body>")

})
