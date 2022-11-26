/*
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
Write a query to list the candidates who possess all of the required skills for the job. Sort the the output by candidate ID in ascending order.

Link to original problem:
https://datalemur.com/questions/matching-skills
*/

SELECT CANDIDATE_ID
FROM CANDIDATES
WHERE SKILL IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(SKILL)=3
ORDER BY CANDIDATE_ID;
