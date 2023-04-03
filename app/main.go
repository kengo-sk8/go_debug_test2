package main

import (
	"github.com/labstack/echo/v4"
	"net/http"

)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, aaaaaa!")
	})
	e.Logger.Fatal(e.Start(":8080"))
}

