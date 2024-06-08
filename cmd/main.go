package main

import (
	"log"
	"net/http"
	"os"

	_ "github.com/jackc/pgx/v5/stdlib"
	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
	"github.com/klauspost/compress/gzhttp"

	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"github.com/patrik-rangel/API-G1-3SIS/internal/api"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/service"
	"github.com/patrik-rangel/API-G1-3SIS/internal/resource/database"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		panic("fail to load the .env")
	}

	db := connDb()
	dbx := database.New(db)

	executiveGtw := dbx
	userGtw := dbx

	executiveService := service.NewExecutive(executiveGtw)
	userService := service.NewUser(userGtw)

	handler := api.NewHandler(userService, executiveService)
	security := api.NewMySecurityHandler(os.Getenv("AUTHORIZATION_SERVICE"))
	server, err := openapi.NewServer(handler, security)
	if err != nil {
		panic(err)
	}

	http.ListenAndServe(":8080", gzhttp.GzipHandler(server))
}

func connDb() *sqlx.DB {
	db, err := sqlx.Connect("pgx", "user=grupo1 password=grupo1 host=localhost port=5432 database=grupo1 sslmode=disable")
	if err != nil {
		log.Fatal(err)
		panic("error in connection database")
	}
	return db
}
