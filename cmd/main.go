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

	"github.com/rs/cors"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		panic("fail to load the .env")
	}

	db := connDb()
	dbx := database.New(db)

	executiveService := service.NewExecutive(dbx)
	userService := service.NewUser(dbx)
	costService := service.NewCost(dbx)

	handler := api.NewHandler(userService, executiveService, costService)
	security := api.NewMySecurityHandler(os.Getenv("AUTHORIZATION_SERVICE"))
	server, err := openapi.NewServer(handler, security)
	if err != nil {
		panic(err)
	}

	serverWithCors := cors.AllowAll().Handler(server)

	http.ListenAndServe(":8080", gzhttp.GzipHandler(serverWithCors))
}

func connDb() *sqlx.DB {
	user := os.Getenv("DATABASE_USER")
	password := os.Getenv("DATABASE_PASSWORD")
	host := os.Getenv("DATABASE_HOST")
	port := os.Getenv("DATABASE_PORT")
	database := os.Getenv("DATABASE_NAME")

	connStr := "user=" + user +
		" password=" + password +
		" host=" + host +
		" port=" + port +
		" database=" + database +
		" sslmode=disable" 


	db, err := sqlx.Connect("pgx", connStr)
	if err != nil {
		log.Fatal(err)
		panic("error in connection database")
	}
	return db
}
