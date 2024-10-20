package generated

import _ "embed"

//go:generate go run main.go -generate ../api/api_docs.yml openapi/api_docs_specs.yml
//go:embed openapi/api_docs_specs.yml
var APIDocsSpecs []byte

// else
// go run main.go -generate ../api/api_docs.yml openapi/api_docs_specs.yml
