package generated

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	source := flag.String("generate", "", "Path to the source API Docs YAML file")
	flag.Parse()

	if *source == "" {
		fmt.Println("Missing source file path. Use the -generate flag.")
		os.Exit(1)
	}

	data, err := ioutil.ReadFile(*source)
	if err != nil {
		fmt.Println("Error reading source file:", err)
		os.Exit(1)
	}

	err = ioutil.WriteFile("openapi/api_docs_specs.yml", data, 0644)
	if err != nil {
		fmt.Println("Error writing to destination file:", err)
		os.Exit(1)
	}

	fmt.Println("API Docs YAML file copied successfully!")
}
