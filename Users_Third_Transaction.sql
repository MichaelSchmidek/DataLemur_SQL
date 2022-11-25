/*
Assume you are given the table below on Uber transactions made by users.
Write a query to obtain the third transaction of every user.
Output the user id, spend and transaction date.

Link to original problem:
https://datalemur.com/questions/sql-third-transaction
*/

SELECT USER_ID, SPEND, TRANSACTION_DATE
FROM (SELECT 
      USER_ID, 
      SPEND, 
      TRANSACTION_DATE,
      ROW_NUMBER() OVER (
        PARTITION BY USER_ID ORDER BY TRANSACTION_DATE) AS ROW_NUM
        FROM TRANSACTIONS) AS TEMP
WHERE ROW_NUM = 3;
