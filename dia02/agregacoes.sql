-- Databricks notebook source
SELECT 
 COUNT (*)  AS nrLinhasNaoNulas, -- total de linhas nao nulas
 COUNT (idCliente) as nrIdClientesNaoNulo -- total de clientes nao nulos
From silver_olist.cliente

-- COMMAND ----------

SELECT 
 COUNT (*)  AS nrLinhasNaoNulas, -- total de linhas nao nulas
 COUNT (idCliente) as nrIdClientesNaoNulo, -- total de clientes nao nulos
 COUNT (distinct idCliente) as nrIdClientesDistintos, -- total de id distintos
 COUNT (distinct idClienteUnico) as nrIdClientesUnicos -- total de id de clientes unicos
From silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT (*) AS qtLinhas,
  COUNT (idCliente) AS qtClientes,
  COUNT (distinct idClienteUnico) as qtClienteUnico
From
  silver_olist.cliente
WHERE
  descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT
  *
From
  silver_olist.cliente

-- COMMAND ----------

SELECT
  AVG(vlPreco) AS avgPreco,
  -- media da coluna vlPreco (preco medio dos produtos)
  MAX(vlPreco) AS maxPreco,
  -- maior valor de vlPreco
  MIN(vlFrete) AS minFrete,
  -- valor minimo do frete
  INT(AVG(vlFrete)) AS avgFrete,
  -- media da coluna vlFrete // -- INT transforma o numero em inteiro
  MAX(vlFrete) AS maxFrete,
  ROUND(PERCENTILE(vlFrete, 0.5), 2) AS medianaFrete 
  -- valor mediano do frete // --ROUND arredonda as casas decimais
From
  silver_olist.item_pedido

-- COMMAND ----------

SELECT
  descUF,
  COUNT(*) as qtClienteporCompra
From
  silver_olist.cliente
GROUP BY
  descUF

-- COMMAND ----------

SELECT
  descUF,
  COUNT(DISTINCT idClienteUnico) as qtClientesUnicos
From
  silver_olist.cliente
GROUP BY
  descUF

-- COMMAND ----------


