/*
Retorne somente os reviews que não tem comentários.
*/

SELECT * 
FROM olist_order_reviews_dataset 
WHERE review_comment_message IS NULL;