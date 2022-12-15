-- Databricks notebook source
-- 01 selecione todos os clientes paulistanos

SELECT *
FROM silver_olist.cliente
WHERE descCidade = 'sao paulo'
LIMIT 10

-- COMMAND ----------

-- 02 selecione todos os clientes paulistas

SELECT *
FROM silver_olist.cliente
WHERE descUF = 'SP'
LIMIT 10

-- COMMAND ----------

-- 03 selecione todos os vendedores cariocas e paulistas

SELECT *
FROM silver_olist.vendedor
WHERE descCIdade = 'rio de janeiro' OR descUF = 'SP'
LIMIT 10

-- COMMAND ----------

-- 04 selecione todos os produtos de perfumaria e bebes com mais de 5cm

SELECT *
FROM silver_olist.produto
WHERE descCategoria  IN ('perfumaria', 'bebes') AND vlAlturaCm > 5
LIMIT 10

-- COMMAND ----------


