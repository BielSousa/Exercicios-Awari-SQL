/*
Crie uma view (SELLER_STATS) para mostrar por fornecedor, a quantidade de itens enviados, 
o tempo médio de postagem após a aprovação da compra, a quantidade total de pedidos de cada Fornecedor, 
note que trabalharemos na mesma query com 2 granularidades diferentes.
*/

CREATE view SELLER_STATS as
	SELECT 
		tbsellers.seller_id as fornecedores, 
		count(tborders.order_delivered_carrier_date) as itens_enviados,
		round(avg(julianday(tborders.order_delivered_carrier_date) - julianday(tborders.order_approved_at)
					),0) as dias_ate_postagem,
		sum(tborders.order_id) over (PARTITION by tbsellers.seller_id) as total_pedidos
	from
		olist_sellers_dataset as tbsellers
	LEFT JOIN 
		olist_order_items_dataset as tborderitems
	USING 
		(seller_id)
	LEFT JOIN 
		olist_orders_dataset as tborders
	USING
		(order_id)
	GROUP by
		seller_id


