/*
Queremos dar um cupom de 10% do valor da última compra do cliente. 
Porém os clientes elegíveis a este cupom devem ter feito uma compra anterior a última 
(a partir da data de aprovação do pedido) que tenha sido maior ou igual o valor da última compra.
Crie uma querie que retorne os valores dos cupons para cada um dos clientes elegíveis.
*/
SELECT
	CLIENTES,
	ANTERIOR,
	ULTIMO_PEDIDO,
	(ULTIMO_PEDIDO * 0.10) AS DESCONTO
FROM
(
	SELECT
		CLIENTES.customer_unique_id AS CLIENTES,
		ORDENS.order_id,
		payment_value AS ULTIMO_PEDIDO,
		LAG(payment_value, 1, 0) OVER(PARTITION BY CLIENTES.customer_unique_id ORDER by customer_unique_id) AS ANTERIOR
	FROM  olist_orders_dataset ORDENS
		JOIN olist_order_payments_dataset PAGAMENTOS USING(order_id)
		JOIN olist_customers_dataset CLIENTES USING(customer_id)
	WHERE order_approved_at is not NULL
)
WHERE ANTERIOR > ULTIMO_PEDIDO
ORDER BY CLIENTES