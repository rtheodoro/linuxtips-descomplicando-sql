-- Databricks notebook source
-- Qual categoria tem mais produtos vendido?
SELECT
  tProduto.descCategoria,
  -- Como estamos utilizando duas bases, é preciso explicitar indicando de qual tabela veio a coluna
  COUNT(*)
FROM
  silver_olist.item_pedido AS tPedido
  LEFT JOIN silver_olist.produto AS tProduto -- Juntando a tabela de Produtos com os Pedidos, unindo pela idProduto
  ON tPedido.idProduto = tProduto.idProduto
GROUP BY
  tProduto.descCategoria
ORDER BY
  COUNT(*) DESC
LIMIT 1

-- COMMAND ----------

-- Qual categoria tem os produtos mais caros?

SELECT
  AVG(tPedido.vlPreco) AS precoMedio, 
  tProduto.descCategoria

FROM
  silver_olist.item_pedido AS tPedido
  LEFT JOIN silver_olist.produto AS tProduto -- Juntando a tabela de Produtos com os Pedidos, unindo pela idProduto
  ON tPedido.idProduto = tProduto.idProduto
GROUP BY  tProduto.descCategoria

-- COMMAND ----------

-- Qual categoria o produto mais caro?

SELECT
  MAX(tPedido.vlPreco) AS preco, 
  ROUND(AVG(tPedido.vlPreco), 2) AS precoMedio,
  tProduto.descCategoria

FROM
  silver_olist.item_pedido AS tPedido
  LEFT JOIN silver_olist.produto AS tProduto -- Juntando a tabela de Produtos com os Pedidos, unindo pela idProduto
  ON tPedido.idProduto = tProduto.idProduto
GROUP BY  tProduto.descCategoria
ORDER BY MAX(tPedido.vlPreco) DESC

-- COMMAND ----------

-- Os clientes de qual estado pagam mais frete?
SELECT
  tCliente.descUF,
  ROUND(AVG(tItemPedido.vlFrete), 2) AS mediaFrete
FROM
  silver_olist.item_pedido AS tItemPedido
  LEFT JOIN silver_olist.pedido AS tPedido ON tItemPedido.idPedido = tPedido.idPedido -- Primeiro Join para ter info do idCliente, através do idPedido
  LEFT JOIN silver_olist.cliente AS tCliente ON tPedido.idCliente = tCliente.idCliente -- Segundo Join para ter info do Frete
GROUP BY descUF
ORDER BY AVG(tItemPedido.vlFrete) DESC

-- COMMAND ----------

-- E os estados que possuem frete acima de R$40?
SELECT
  tCliente.descUF,
  ROUND(AVG(tItemPedido.vlFrete), 2) AS mediaFrete
FROM
  silver_olist.item_pedido AS tItemPedido
  LEFT JOIN silver_olist.pedido AS tPedido ON tItemPedido.idPedido = tPedido.idPedido -- Primeiro Join para ter info do idCliente, através do idPedido
  LEFT JOIN silver_olist.cliente AS tCliente ON tPedido.idCliente = tCliente.idCliente -- Segundo Join para ter info do Frete
GROUP BY descUF
HAVING mediaFrete > 40
ORDER BY mediaFrete DESC
