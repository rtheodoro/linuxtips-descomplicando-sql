-- Databricks notebook source
-- Qual a lista de vendedores que esão no estado com MAIS clientes compradores? (FORMA 1)
SELECT
  idVendedor,
  descUF
FROM
  silver_olist.vendedor
WHERE
  descUF = (
    -- Inicio da subquery! deve retornar apenas um valor!, no caso será SP
          SELECT
            descUF
          FROM
            silver_olist.cliente
          GROUP BY
            descUF
          ORDER BY
            COUNT(DISTINCT idClienteUnico) DESC
          LIMIT
            1
  )

-- COMMAND ----------

-- Qual a lista de vendedores que esão nos 2 estado com MAIS clientes compradores? (FORMA 1)
SELECT
  idVendedor,
  descUF
FROM
  silver_olist.vendedor
WHERE
  descUF IN (
    -- Inicio da subquery! deve retornar apenas um valor!, no caso será SP e RJ
          SELECT
            descUF
          FROM
            silver_olist.cliente
          GROUP BY
            descUF
          ORDER BY
            COUNT(DISTINCT idClienteUnico) DESC
          LIMIT
            2
          
  )

-- COMMAND ----------

-- Qual a lista de vendedores que esão nos 2 estado com MAIS clientes compradores? (FORMA 2 E MELHOR)

-- Primeiro criamos uma tabela temporária, aqui chamada tEstados
WITH 
tEstados AS (
  SELECT descUF
  FROM silver_olist.cliente
  GROUP BY descUF
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2
),

-- Cria a segunda tabela temporária
tVendedores AS (SELECT idVendedor, descUF
FROM silver_olist.vendedor
-- Inicio da subquery! consultamos na primeira tabela temporária
WHERE descUF IN (SELECT * FROM tEstados))

-- Mostra o resultado da query final
SELECT * FROM tVendedores


-- COMMAND ----------

-- Qual a nota média dos vendedores de cada estado?


WITH 

-- segunda tabela temporaria
tPedidoNota AS (
  SELECT idVendedor,
         vlNota
  FROM
    silver_olist.item_pedido AS tItemPedido
    LEFT JOIN silver_olist.avaliacao_pedido AS tAvaliacao ON tItemPedido.idPedido = tAvaliacao.idPedido
),

-- segunda tabela temporaria
tVendedor AS (

  SELECT idVendedor,
         AVG(vlNota) AS avgNota
  FROM tPedidoNota
  GROUP BY idVendedor
),


-- terceira tabela temporaria
tVendedorEstado AS (
  SELECT
    tVendedores.*,
    tVendedorcompleta.descUF
  FROM tVendedor AS tVendedores
  LEFT JOIN silver_olist.vendedor AS tVendedorcompleta 
    ON tVendedores.idVendedor = tVendedorcompleta.idVendedor
)

-- Exibindo os resultados que queremos
SELECT
  descUF,
  AVG(avgNota) AS avgNotaEstado
FROM tVendedorEstado
GROUP BY descUF 
ORDER BY avgNotaEstado DESC
