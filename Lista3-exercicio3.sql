/*
Retorne as categorias válidas, suas somas totais dos valores de vendas, um ranqueamento de maior 
valor para menor valor junto com o somatório acumulado dos valores pela mesma regra do ranqueamento.
*/
SELECT
	categoria,
	soma_vendas,
	rank,
	sum(soma_vendas) OVER (
						PARTITION BY ''
						ORDER BY
							soma_vendas DESC
						) AS soma_acumulada
FROM (
	SELECT
		product_category_name AS categoria,
		sum(price) AS soma_vendas,
		rank() OVER (
					PARTITION BY ''
					ORDER BY
						sum(price) DESC
					) AS rank
FROM
	olist_order_items_dataset AS items
	INNER JOIN olist_products_dataset AS products 
		ON products.product_id = items.product_id
WHERE
	products.product_category_name IS NOT NULL
GROUP BY
	product_category_name
ORDER BY
	sum(price) desc
) AS Dados