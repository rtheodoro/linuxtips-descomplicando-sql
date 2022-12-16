-- Databricks notebook source
-- Junta as tabelas pela tabela da ESQUERDA
SELECT
  TPedido.*,  -- seleciona todas as colunas da tabela Pedido
  TCliente.descUF -- seleciona apenas uma coluna especifica da tabela Cliente
FROM
  silver_olist.pedido AS TPedido
  LEFT JOIN silver_olist.cliente AS TCliente 
    ON TPedido.idClientE = TCliente.idCliente -- Define as colunas que devem ter os mesmos valores
