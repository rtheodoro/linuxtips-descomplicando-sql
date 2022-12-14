-- Databricks notebook source
-- selecione todas as colunas da tabela pedido em que a descSituacao é considerada 'delivered'
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao = 'delivered'
  AND year(dtPedido) = '2018'
LIMIT
  5

-- COMMAND ----------

-- selecione todas as colunas da tabela pedido em que a descSituacao é considerada 'shipped' ou  'canceled' com pedido de 2018
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  (descSituacao = 'shipped' OR descSituacao = 'canceled')
  AND year(dtPedido) = '2018'
LIMIT
  5 

-- COMMAND ----------

-- selecione todas as colunas da tabela pedido em que a descSituacao é considerada 'shipped' ou  'canceled' com pedido de 2018
SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao IN ('shipped', 'canceled')
  AND year(dtPedido) = '2018'
LIMIT
  5

-- COMMAND ----------

SELECT
  *
FROM
  silver_olist.pedido
WHERE
  descSituacao IN ('shipped', 'canceled')
  AND year(dtPedido) = '2018'
  AND datediff(dtEstimativaEntrega, dtAprovado) > 30
LIMIT
  5

-- COMMAND ----------


