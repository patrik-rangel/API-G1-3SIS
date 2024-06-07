-- name: InsertUser :exec
INSERT INTO usuario (
    nome, email, senha, tipo_usuario
) VALUES (
    $1, $2, $3, $4
);

-- name: GetUser :one 
SELECT * FROM usuario 
WHERE 
    email = $1
AND
    senha = $2;
