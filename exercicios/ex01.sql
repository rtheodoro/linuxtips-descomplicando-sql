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

-- Selecione os pedidos e defina os grupos em uma nova coluna:
-- Frete inferior a 10%
-- Frete entre 10% e 20%
-- Frete entre 20% e 50%
-- Frete superior a 50%
SELECT
  *,
  vlPreco + vlFrete AS vlTotal,
  vlFrete / (vlPreco + vlFrete) AS pctFrete,
  CASE
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN 'MENOS DE 10%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN 'ENTRE 10% E 25%'
    WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN 'ENTRE 25% E 50%'
    ELSE 'MAIS DE 50%'
  END AS descFretePct
FROM
  silver_olist.item_pedido
