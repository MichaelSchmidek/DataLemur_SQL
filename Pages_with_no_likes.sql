/*
Assume you are given the tables below about Facebook pages and page likes.
Write a query to return the page IDs of all the Facebook pages that don't have any likes.
The output should be in ascending order.

Link to original problem:
https://datalemur.com/questions/sql-page-with-no-likes
*/

SELECT P.PAGE_ID
FROM PAGES AS P
WHERE P.PAGE_ID NOT IN (SELECT P2.PAGE_ID
                        FROM PAGES AS P2
                        JOIN PAGE_LIKES AS L2 
                        ON L2.PAGE_ID = P2.PAGE_ID)
ORDER BY P.PAGE_ID ASC
