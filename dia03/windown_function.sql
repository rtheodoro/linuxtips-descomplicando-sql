-- Databricks notebook source
-- windown_function serve para que o SQL particione o dado, crie uma partição nos dados

WITH 

tVendasVendedores AS (

    SELECT idVendedor,
          COUNT(*) AS qtVendas
    FROM silver_olist.item_pedido
    GROUP BY idVendedor
    ORDER BY qtVendas DESC
    
),

tRowNumber AS (

    SELECT tVendasVendedor.*,
           tVendedor.descUF,
           ROW_NUMBER() OVER (PARTITION BY tVendedor.descUF ORDER BY qtVendas DESC) AS RN  -- Cria a windown function sobre a particao escolhida
    FROM tVendasVendedores AS tVendasVendedor
    LEFT JOIN silver_olist.vendedor AS tVendedor
    ON tVendasVendedor.idVendedor = tVendedor.idVendedor
    ORDER BY descUF, qtVendas DESC
    
)

SELECT * FROM tRowNumber WHERE RN <= 10

-- COMMAND ----------

-- windown_function serve para que o SQL particione o dado, crie uma partição nos dados

WITH 

tVendasVendedores AS (

    SELECT idVendedor,
          COUNT(*) AS qtVendas
    FROM silver_olist.item_pedido
    GROUP BY idVendedor
    ORDER BY qtVendas DESC
    
),

tRowNumber AS (

    SELECT tVendasVendedor.*,
           tVendedor.descUF,
           ROW_NUMBER() OVER (PARTITION BY tVendedor.descUF ORDER BY qtVendas DESC) AS RN  -- Cria a windown function sobre a particao escolhida
    FROM tVendasVendedores AS tVendasVendedor
    LEFT JOIN silver_olist.vendedor AS tVendedor
    ON tVendasVendedor.idVendedor = tVendedor.idVendedor
    QUALIFY  RN <= 10  -- DOIDERA ISSO AQUI -- FILTRA O WINDOWN FUNCTION
    
)

SELECT * FROM tRowNumber

-- COMMAND ----------




