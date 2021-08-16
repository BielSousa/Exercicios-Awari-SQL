/*
Crie uma tabela analítica de todos os itens que foram vendidos, mostrando somente pedidos interestaduais. 
Queremos saber quantos dias os fornecedores demoram para postar o produto, se o produto chegou ou não no prazo.
*/
SELECT 
	olist_orders_dataset.order_id, 
	olist_sellers_dataset.seller_state, 
	olist_customers_dataset.customer_state,
	round(julianday(olist_orders_dataset.order_delivered_carrier_date) -julianday(olist_orders_dataset.order_approved_at), 0) AS "Dias_Postagem",
CASE 
    WHEN ROUND(JULIANDAY(olist_orders_dataset.order_delivered_customer_date) - JULIANDAY(olist_orders_dataset.order_estimated_delivery_date), 0) > 0 THEN
        "No Prazo"
    ELSE
        "Fora Prazo"
END "STATUS_PRAZO"
FROM olist_orders_dataset 
	INNER JOIN olist_order_items_dataset 
		ON olist_orders_dataset.order_id = olist_order_items_dataset.order_id
	INNER JOIN olist_sellers_dataset 
		ON olist_order_items_dataset.seller_id = olist_sellers_dataset.seller_id
	INNER JOIN olist_customers_dataset 
		ON olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
GROUP BY olist_orders_dataset.order_id
	HAVING olist_customers_dataset.customer_state != olist_sellers_dataset.seller_state;