-- Databricks notebook source
SELECT
  *,
  -- Isso é uma coluna nova
  CASE
    WHEN descUF = 'SP' THEN 'paulista'
    WHEN descUF = 'RJ' THEN 'fluminense'
    WHEN descUF = 'PR' THEN 'paranaense'
    ELSE 'outros'
  END AS descNacionalidade,
  -- Isso é outra coluna nova
  -- NOT LIKE nega a condição lógica
  CASE
    WHEN descCidade LIKE '%sao%' THEN 'tem sao no nome'
    END AS descCidadania
FROM
  silver_olist.cliente
LIMIT 50

-- COMMAND ----------

SELECT
  *,
  -- Isso é uma coluna nova
  CASE
    WHEN descUF IN ('SP','RJ','PR') THEN 'sudeste'
    ELSE 'nao e sudeste'
  END AS descRegiao
FROM
  silver_olist.vendedor
LIMIT 50

-- COMMAND ----------


