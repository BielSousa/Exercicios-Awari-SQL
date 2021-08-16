/*
Mostre os 5 clientes (customer_id) que gastaram mais dinheiro em compras, 
qual foi o valor total de todas as compras deles, quantidade de compras, 
e valor médio gasto por compras. 
Ordene os mesmos por ordem decrescente pela média do valor de compra.
*/
SELECT 
	olist_customers_dataset.customer_id, 
	count(olist_order_payments_dataset.payment_type) as "Total itens comprados",
	sum(olist_order_payments_dataset.payment_value) as "Total Compras",
	avg(olist_order_payments_dataset.payment_value) as "Valor medio de compras"
FROM olist_customers_dataset
	inner JOIN olist_orders_dataset 
		on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
	inner JOIN olist_order_payments_dataset
		on olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
GROUP by olist_customers_dataset.customer_id
ORDER by 
	sum(olist_order_payments_dataset.payment_value) DESC,
	avg(olist_order_payments_dataset.payment_value) DESC
LIMIT 5;