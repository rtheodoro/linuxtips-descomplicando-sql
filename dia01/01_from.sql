-- Databricks notebook source
-- selecione TUDO da tabela olist.pedido
SELECT *
FROM silver_olist.pedido


-- COMMAND ----------

-- selecione as colunas idPedido e descSituacao da tabela olist.pedido
SELECT idPedido, descSituacao
FROM silver_olist.pedido

-- COMMAND ----------

-- selecione 5 linhas das colunas idPedido e descSituacao da tabela olist.pedido
SELECT
  idPedido,
  descSituacao
FROM
  silver_olist.pedido
LIMIT
  5

-- COMMAND ----------

SELECT *, datediff(dtEstimativaEntrega, dtEntregue) AS qtDiasEntrega


FROM silver_olist.pedido

