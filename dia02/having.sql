-- Databricks notebook source
-- HAVING é um filtro que vem depois do agrupamento
SELECT
  descUF,
  COUNT(idVendedor) AS qtVendedorUF
FROM
  silver_olist.vendedor
WHERE
  descUF in ('SP', 'RJ', 'MG', 'ES')
GROUP BY
  descUF
HAVING
  qtVendedorUF >= 100
ORDER BY
  qtVendedorUF DESC
LIMIT
  10
