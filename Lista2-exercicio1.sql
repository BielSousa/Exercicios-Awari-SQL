/*
Retorne a quantidade de itens vendidos em cada categoria por estado em que o cliente se encontra, 
mostrando somente categorias que tenham vendido uma quantidade de items acima de 1000.
*/
SELECT 
	olist_customers_dataset.customer_state,
	olist_products_dataset.product_category_name, 
	count(olist_order_payments_dataset.payment_type) as "Itens Vendidos"
FROM olist_customers_dataset
	inner JOIN olist_orders_dataset 
		on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
	inner JOIN olist_order_payments_dataset
		on olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
	inner join olist_order_items_dataset
		on olist_order_payments_dataset.order_id = olist_order_items_dataset.order_id
	inner join  olist_products_dataset
		on olist_products_dataset.product_id = olist_order_items_dataset.product_id
GROUP by olist_customers_dataset.customer_state, 
	olist_products_dataset.product_category_name
HAVING "Itens Vendidos" > 1000;
	