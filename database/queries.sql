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

-- name: GetIdsExecutive :one
SELECT
    e.*,
    cc.fk_area AS area_id,
    a.nome_area
FROM
    executivo e
INNER JOIN centro_de_custos cc ON e.fk_centro_de_custos = cc.id_centro_de_custos
INNER JOIN area a ON cc.fk_area = a.id_area
WHERE
    e.fk_usuario = $1;

-- name: GetIdsEmployee :one
SELECT * FROM funcionario 
WHERE 
    fk_usuario = $1;


-- name: InsertEmployeeByIdCostCenter :exec
INSERT INTO funcionario (nome, email, cargo, senioridade, salario, fk_centro_de_custos, fk_usuario)
VALUES ($1, $2, $3, $4, $5, $6, $7);


-- name: InsertUserEmployee :one
INSERT INTO usuario (nome, email, senha, tipo_usuario)
VALUES ($1, $2, $3, $4)
RETURNING id_usuario;

-- name: SelectUserEmployee :one
SELECT (senha) FROM usuario
WHERE 
    nome = $1
AND
    email = $2;


-- name: SelectUserExecutive :one
SELECT (id_usuario) FROM usuario 
WHERE 
    nome = $1
AND
    email = $2
AND
    tipo_usuario = 'EXEC';

-- name: InsertExecutive :exec
INSERT INTO executivo (fk_centro_de_custos, fk_usuario) 
VALUES($1, $2);


-- name: InsertAnnualBudget :one
INSERT INTO orcamento_anual (
    data_inicio, data_fim, orcamento_anual
) VALUES (
    $1, $2, $3
)
RETURNING *;

-- name: InsertArea :one
INSERT INTO area (nome_area)
VALUES ($1)
ON CONFLICT (nome_area) DO UPDATE
SET nome_area = EXCLUDED.nome_area
RETURNING *;

-- name: InsertCostCenter :one
INSERT INTO centro_de_custos (nome_centro, tipo, fk_orcamento_anual, fk_area)
VALUES ($1, $2, $3, $4)
RETURNING *;


-- name: InsertVariableExpense :exec
INSERT INTO gastos_variaveis (
  tipo_variavel,
  valor,
  categoria_despesa,
  desc_transacao,
  metodo_pagto,
  obs,
  data,
  responsavel,
  aprovado,
  fk_centro_de_custos
)
VALUES (
  $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
);


-- name: UpdateVariableExpense :exec
UPDATE gastos_variaveis
SET aprovado = $1
WHERE data = $2 AND responsavel = $3 AND tipo_variavel = $4;


-- name: SelectAllVariableExpenseByIdCostCenter :many
SELECT * FROM gastos_variaveis
WHERE fk_centro_de_custos = $1;


-- name: SelectVariableExpenseByEmployee :many
SELECT * FROM gastos_variaveis
WHERE responsavel = $1;


-- name: SelectExecutiveById :one
SELECT * FROM "executivo"
WHERE "Id_executivo" = $1;

-- name: SelectCostCenterById :one
SELECT
  centro_de_custos.id_centro_de_custos,
  centro_de_custos.nome_centro,
  centro_de_custos.tipo,
  centro_de_custos.fk_orcamento_anual,
  area.nome_area,
  orcamento_anual.orcamento_anual
FROM centro_de_custos
JOIN area ON centro_de_custos.fk_area = area.id_area
JOIN orcamento_anual ON centro_de_custos.fk_orcamento_anual = orcamento_anual.id_orcamento_anual
WHERE centro_de_custos.id_centro_de_custos = $1;


-- name: SelectEmployeesByCostCenterId :many
SELECT * FROM funcionario
WHERE fk_centro_de_custos = $1;


-- name: InsertVariableExpenseDenied :exec
INSERT INTO gastos_variaveis_negados 
(fk_gastos_variaveis)
VALUES ($1);


-- name: GetVariableExpense :one
SELECT *
FROM gastos_variaveis
WHERE
    tipo_variavel = $1
    AND data = $2
    AND responsavel = $3;


-- name: GetVariableExpenseByArea :many
SELECT 
    gvn.id AS id_gasto_negado,
    gv.tipo_variavel,
    gv.valor,
    gv.categoria_despesa,
    gv.metodo_pagto,
    cc.nome_centro AS nome_centro_de_custos,
    a.nome_area AS nome_area,
    (SELECT SUM(gv_sub.valor)
     FROM gastos_variaveis_negados gvn_sub
     INNER JOIN gastos_variaveis gv_sub ON gvn_sub.fk_gastos_variaveis = gv_sub.id_gastos_variaveis
     INNER JOIN centro_de_custos cc_sub ON gv_sub.fk_centro_de_custos = cc_sub.id_centro_de_custos
     INNER JOIN area a_sub ON cc_sub.fk_area = a_sub.id_area
     WHERE a_sub.id_area = a.id_area
    ) AS total_valor_gastos_negados
FROM 
    gastos_variaveis_negados gvn
INNER JOIN 
    gastos_variaveis gv ON gvn.fk_gastos_variaveis = gv.id_gastos_variaveis
INNER JOIN 
    centro_de_custos cc ON gv.fk_centro_de_custos = cc.id_centro_de_custos
INNER JOIN 
    area a ON cc.fk_area = a.id_area
WHERE 
    a.id_area = $1;