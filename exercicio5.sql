/*
Encontre os clientes do estado de SP e que não morem na cidade de São Paulo.
*/
SELECT * 
FROM olist_customers_dataset 
WHERE (customer_state = "SP" and customer_city != "sao paulo");