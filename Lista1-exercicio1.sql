/*
Selecione os dados da tabela de pagamentos onde só apareçam os tipos de pagamento “VOUCHER” e “BOLETO”.
*/

SELECT * 
FROM olist_order_payments_dataset 
WHERE (payment_type = "boleto" or payment_type = "voucher");