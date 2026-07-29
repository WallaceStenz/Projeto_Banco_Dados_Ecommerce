# Modelo Conceitual — E-commerce (Cliente PF/PJ, Pagamento e Entrega)

## 📌 Sobre o projeto

Este repositório contém o **projeto conceitual** de um banco de dados para um sistema de e-commerce, desenvolvido como desafio de projeto. O objetivo desta fase é representar, através de um Diagrama Entidade-Relacionamento (DER), as entidades, atributos e relacionamentos que refletem as regras de negócio do domínio, **sem se preocupar ainda com detalhes de implementação física** (tipos de dados específicos do SGBD, índices, etc.).

O modelo parte de um esquema básico de pedidos/produtos e foi **refinado** para atender três novos requisitos de negócio:

1. **Cliente PF ou PJ** — uma conta de cliente pode ser Pessoa Física *ou* Pessoa Jurídica, nunca as duas ao mesmo tempo.
2. **Pagamento** — um pedido pode ter mais de uma forma de pagamento cadastrada.
3. **Entrega** — cada pedido possui uma entrega associada, com status e código de rastreio.

## 🗺️ Diagrama Entidade-Relacionamento

![Modelo Conceitual](modelo-conceitual.svg)

## 🧩 Descrição das entidades e relacionamentos

### Cliente (generalização/especialização)
`CLIENTE` é uma superclasse com os atributos comuns a qualquer cliente (`id_cliente`, `nome`, `email`, `telefone`, `endereco`).

Ela é especializada em duas subclasses:
- **PESSOA_FISICA**: `cpf`, `data_nascimento`
- **PESSOA_JURIDICA**: `cnpj`, `razao_social`

A especialização é **disjunta e total** (representada pelo triângulo com "d" no diagrama):
- **Disjunta**: um cliente pertence a exatamente uma subclasse — PF **ou** PJ, nunca as duas.
- **Total**: todo cliente cadastrado obrigatoriamente pertence a uma das subclasses (não existe cliente "genérico" sem tipo definido).

Essa decisão evita a inconsistência de um mesmo cadastro possuir CPF e CNPJ simultaneamente, e reflete fielmente a regra de negócio proposta no desafio.

### Pedido
`PEDIDO` representa a compra realizada por um cliente (`id_pedido`, `data_pedido`, `status`, `valor_total`). Um cliente **realiza** vários pedidos (1:N), mas cada pedido pertence a um único cliente.

### Produto e Item_Pedido
`PRODUTO` (`id_produto`, `nome`, `preco`, `estoque`) se relaciona com `PEDIDO` através de um relacionamento N:M, já que um pedido pode conter vários produtos e um produto pode estar em vários pedidos. Esse relacionamento é resolvido pela entidade associativa `ITEM_PEDIDO`, que carrega os atributos próprios da associação (`quantidade`, `preco_unitario`) e as chaves estrangeiras de ambas as entidades.

### Pagamento
`PAGAMENTO` (`id_pagamento`, `tipo`, `valor`, `data_pagamento`) se relaciona com `PEDIDO` através de um relacionamento **1:N** — um pedido **efetua** uma ou mais formas de pagamento (por exemplo, parte no cartão e parte via Pix), mas cada registro de pagamento pertence a um único pedido. Modelar `PAGAMENTO` como entidade própria (e não como atributo multivalorado de `PEDIDO`) permite guardar valor, tipo e data de cada forma de pagamento de maneira estruturada.

### Entrega
`ENTREGA` (`id_entrega`, `status`, `codigo_rastreio`, `data_envio`) possui um relacionamento **1:1** com `PEDIDO` — cada pedido **gera** exatamente uma entrega, contendo o status atual (ex.: "em separação", "em trânsito", "entregue") e o código de rastreio.

## ⚙️ Decisões de modelagem

| Requisito | Decisão de modelagem | Justificativa |
|---|---|---|
| Cliente PF ou PJ | Generalização/especialização disjunta e total | Garante, no próprio esquema conceitual, que não é possível cadastrar as duas naturezas para o mesmo cliente |
| Mais de uma forma de pagamento | Entidade `PAGAMENTO` com relacionamento 1:N a partir de `PEDIDO` | Permite múltiplos pagamentos por pedido, cada um com seu próprio valor, tipo e data |
| Entrega com status e rastreio | Entidade `ENTREGA` com relacionamento 1:1 com `PEDIDO` | Isola as informações logísticas da entrega das informações comerciais do pedido |

## 📁 Estrutura do repositório

```
.
├── README.md                 # Este arquivo
├── modelo-conceitual.svg     # Diagrama ER (modelo conceitual)
└── script-ddl.sql            # Script de criação do esquema lógico/físico (bônus)
```

## 🛠️ Próximos passos (fora do escopo desta entrega)

- Projeto lógico: normalização das tabelas e definição de tipos de dados.
- Projeto físico: índices, particionamento e otimizações específicas do SGBD escolhido.

---
Desafio de projeto desenvolvido a partir do curso de modelagem de banco de dados.
