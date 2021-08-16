/*
Retorne todos os pagamentos do cliente, com suas datas de aprovação, 
valor da compra e o valor total que o cliente já gastou em todas as suas compras, 
mostrando somente os clientes onde o valor da compra é diferente do valor total já gasto.
*/
SELECT
	olist_customers_dataset.customer_id as cliente,
	olist_order_payments_dataset.order_id as compras,
	olist_orders_dataset.order_approved_at as data_aprovacao,
	olist_order_payments_dataset.payment_value as valor_compra,
	sum(olist_order_payments_dataset.payment_value) as Total_Comprado
FROM olist_customers_dataset
	INNER JOIN olist_orders_dataset
		ON olist_customers_dataset.customer_id = olist_orders_dataset.customer_id
	INNER JOIN olist_order_payments_dataset
		ON olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
GROUP BY olist_customers_dataset.customer_id
	HAVING olist_order_payments_dataset.payment_value != sum(olist_order_payments_dataset.payment_value);
