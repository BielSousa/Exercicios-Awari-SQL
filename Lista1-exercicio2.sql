/*
Retorne os campos da tabela de produtos e calcule o volume de cada produto em um novo campo.
*/

SELECt 
	olist_products_dataset.product_id, 
	SUM((product_height_cm*product_length_cm*product_width_cm)) AS Volume 
FROM olist_products_dataset 
GROUP BY product_id;