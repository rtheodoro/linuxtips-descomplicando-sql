-- Databricks notebook source
--GROUP BY e ORDER BY - FORMA 1 CRESCENTE

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClientesUnicosPorUF
From
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY qtClientesUnicosPorUF

-- COMMAND ----------

--GROUP BY e ORDER BY - FORMA 2 CRESCENTE

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClientesUnicosPorUF
From
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY COUNT(DISTINCT idClienteUnico)

-- COMMAND ----------

-- DECRESCENTE FORMA 1
SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClientesUnicosPorUF
From
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY -qtClientesUnicosPorUF

-- COMMAND ----------

-- DECRESCENTE FORMA 2

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClientesUnicosPorUF
From
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY qtClientesUnicosPorUF DESC

-- COMMAND ----------

-- TOP 3

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClientesUnicosPorUF
From
  silver_olist.cliente
GROUP BY
  descUF
ORDER BY qtClientesUnicosPorUF DESC
LIMIT 3
