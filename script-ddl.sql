-- =====================================================================
-- Script DDL - Modelo E-commerce (Cliente PF/PJ, Pagamento, Entrega)
-- Bônus: implementação lógica/física do modelo conceitual descrito
-- no README.md e representado em modelo-conceitual.svg
-- Compatível com PostgreSQL (ajustes simples adaptam para MySQL)
-- =====================================================================

CREATE TABLE cliente (
    id_cliente      SERIAL PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    telefone        VARCHAR(20),
    endereco        VARCHAR(255),
    tipo_cliente    CHAR(2) NOT NULL CHECK (tipo_cliente IN ('PF', 'PJ'))
);

-- Especialização disjunta e total: cada cliente tem exatamente
-- um registro em pessoa_fisica OU em pessoa_juridica, nunca ambos.
-- A FK 1:1 (id_cliente como PK e FK) garante a ligação com a superclasse
-- e o CHECK em "cliente.tipo_cliente" ajuda a aplicação a validar qual
-- tabela consultar.

CREATE TABLE pessoa_fisica (
    id_cliente      INT PRIMARY KEY REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    cpf             CHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL
);

CREATE TABLE pessoa_juridica (
    id_cliente      INT PRIMARY KEY REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    cnpj            CHAR(14) NOT NULL UNIQUE,
    razao_social    VARCHAR(150) NOT NULL
);

CREATE TABLE produto (
    id_produto      SERIAL PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    preco           NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    estoque         INT NOT NULL DEFAULT 0 CHECK (estoque >= 0)
);

CREATE TABLE pedido (
    id_pedido       SERIAL PRIMARY KEY,
    id_cliente      INT NOT NULL REFERENCES cliente(id_cliente),
    data_pedido     TIMESTAMP NOT NULL DEFAULT NOW(),
    status          VARCHAR(30) NOT NULL DEFAULT 'aberto',
    valor_total     NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (valor_total >= 0)
);

-- Resolve o relacionamento N:M entre pedido e produto
CREATE TABLE item_pedido (
    id_pedido       INT NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    id_produto      INT NOT NULL REFERENCES produto(id_produto),
    quantidade      INT NOT NULL CHECK (quantidade > 0),
    preco_unitario  NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0),
    PRIMARY KEY (id_pedido, id_produto)
);

-- Um pedido pode ter mais de uma forma de pagamento (1:N)
CREATE TABLE pagamento (
    id_pagamento    SERIAL PRIMARY KEY,
    id_pedido       INT NOT NULL REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    tipo            VARCHAR(30) NOT NULL, -- ex.: 'cartao_credito', 'pix', 'boleto'
    valor           NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    data_pagamento  TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Cada pedido gera exatamente uma entrega (1:1)
CREATE TABLE entrega (
    id_entrega      SERIAL PRIMARY KEY,
    id_pedido       INT NOT NULL UNIQUE REFERENCES pedido(id_pedido) ON DELETE CASCADE,
    status          VARCHAR(30) NOT NULL DEFAULT 'em separacao',
    codigo_rastreio VARCHAR(50),
    data_envio      TIMESTAMP
);
