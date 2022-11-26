/*
CVS Health is trying to better understand its pharmacy sales, and how well different drugs are selling.
Write a query to find the top 2 drugs sold, in terms of units sold, for each manufacturer.
List your results in alphabetical order by manufacturer

Link to original problem:
https://datalemur.com/questions/top-drugs-sold
*/

SELECT manufacturer, drug
FROM (SELECT 
      manufacturer, 
      drug,
      ROW_NUMBER() OVER (PARTITION BY manufacturer
      ORDER BY units_sold DESC) AS temp
      from pharmacy_sales) AS hold
WHERE temp < 3;
