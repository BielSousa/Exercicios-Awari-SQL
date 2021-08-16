/*
Retorne pedidos que foram feitos somente no ano de 2017.
*/
SELECT * 
from olist_orders_dataset 
where order_purchase_timestamp 
	BETWEEN "2017-01-01 00:00" and "2017-12-31 23:59";