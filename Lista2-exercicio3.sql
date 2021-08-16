/*
mostre o valor vendido total de cada vendedor (seller_id) em cada uma das categorias de produtos, 
somente retornando os vendedores que nesse somatório e agrupamento venderam mais de $1000. 
Desejamos ver a categoria do produto e os vendedores. 
Para cada uma dessas categorias, mostre seus valores de venda de forma decrescente.
*/
SELECT 
	olist_sellers_dataset.seller_id, 
	olist_products_dataset.product_category_name, 
	sum(olist_order_payments_dataset.payment_value) as "total"
FROM olist_sellers_dataset
	INNER JOIN olist_order_items_dataset
		on olist_sellers_dataset.seller_id = olist_order_items_dataset.seller_id
	INNER join olist_order_payments_dataset
		on olist_order_items_dataset.order_id = olist_order_payments_dataset.order_id
	INNER JOIN olist_products_dataset
		on olist_products_dataset.product_id = olist_order_items_dataset.product_id
GROUP by olist_sellers_dataset.seller_id, olist_products_dataset.product_category_name
HAVING sum(olist_order_payments_dataset.payment_value) > 1000
ORDER by sum(olist_order_payments_dataset.payment_value) DESC;