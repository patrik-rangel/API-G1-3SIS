-- -----------------------------------------------------
-- Table `Orcamento_anual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "orcamento_anual" (
  "id_orcamento_anual" SERIAL PRIMARY KEY,
  "data_inicio" TIMESTAMP NOT NULL,
  "data_fim" TIMESTAMP NOT NULL,
  "orcamento_anual" DOUBLE PRECISION NOT NULL
);

-- -----------------------------------------------------
-- Table `Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "area" (
  "id_area" SERIAL PRIMARY KEY,
  "nome_area" VARCHAR(45) NOT NULL UNIQUE
);

-- -----------------------------------------------------
-- Table `Centro_de_Custos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "centro_de_custos" (
  "id_centro_de_custos" SERIAL PRIMARY KEY,
  "nome_centro" VARCHAR(45) NOT NULL,
  "tipo" VARCHAR(45) NOT NULL,
  "fk_orcamento_anual" INTEGER NOT NULL REFERENCES "orcamento_anual" ("id_orcamento_anual") ON DELETE NO ACTION ON UPDATE NO ACTION,
  "fk_area" INTEGER NOT NULL REFERENCES "area" ("id_area") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT unique_centro_de_custos UNIQUE (nome_centro, fk_area)
);

-- -----------------------------------------------------
-- Table `Usuario` (assuming it's in the same schema)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "usuario" (
  "id_usuario" SERIAL PRIMARY KEY,
  "nome" VARCHAR(45) NOT NULL,
  "email" VARCHAR(65) NOT NULL UNIQUE,
  "senha" VARCHAR(65) NOT NULL,
  "tipo_usuario" VARCHAR(4) NOT NULL
);

-- -----------------------------------------------------
-- Table `Executivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "executivo" (
  "Id_executivo" SERIAL PRIMARY KEY,
  "fk_centro_de_custos" INTEGER NOT NULL REFERENCES "centro_de_custos" ("id_centro_de_custos") ON DELETE NO ACTION ON UPDATE NO ACTION,
  "fk_usuario" INTEGER NOT NULL REFERENCES "usuario" ("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION UNIQUE
);

-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "funcionario" (
  "id_funcionarios" SERIAL PRIMARY KEY,
  "nome" VARCHAR(45),
  "email" VARCHAR(65) UNIQUE,
  "cargo" VARCHAR(65) NOT NULL,
  "senioridade" VARCHAR(25) NOT NULL,
  "salario" DOUBLE PRECISION NOT NULL,
  "fk_centro_de_custos" INTEGER NOT NULL REFERENCES "centro_de_custos" ("id_centro_de_custos") ON DELETE NO ACTION ON UPDATE NO ACTION,
  "fk_usuario" INTEGER NOT NULL REFERENCES "usuario" ("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Gastos_variaveis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "gastos_variaveis" (
  "id_gastos_variaveis" SERIAL PRIMARY KEY,
  "tipo_variavel" VARCHAR(45) NOT NULL ,
  "valor" DOUBLE PRECISION NOT NULL,
  "categoria_despesa" VARCHAR(255) NOT NULL,
  "desc_transacao" VARCHAR(255),
  "metodo_pagto" VARCHAR(45),
  "obs" VARCHAR(200),
  "data" TIMESTAMP NOT NULL,
  "responsavel" VARCHAR(65) NOT NULL,
  "aprovado" BOOLEAN NOT NULL DEFAULT FALSE,
  "fk_centro_de_custos" INTEGER NOT NULL,
  UNIQUE(tipo_variavel, data, responsavel)
);
