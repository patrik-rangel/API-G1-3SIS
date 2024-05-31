package main

import (
	"net/http"
	"os"

	"github.com/joho/godotenv"
	"github.com/klauspost/compress/gzhttp"
	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"github.com/patrik-rangel/API-G1-3SIS/internal/api"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		panic("fail to load the .env")
	}

	handler := api.NewHandler()
	security := api.NewMySecurityHandler(os.Getenv("AUTHORIZATION_SERVICE"))
	server, err := openapi.NewServer(handler, security)
	if err != nil {
		panic(err)
	}

	http.ListenAndServe(":8080", gzhttp.GzipHandler(server))
}
