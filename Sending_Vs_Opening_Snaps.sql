/*
Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps.
Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

Notes:
You should calculate these percentages:
time sending / (time sending + time opening)
time opening / (time sending + time opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.

Link to original problem:
https://datalemur.com/questions/time-spent-snaps
*/

WITH snaps_statistics AS (
SELECT
    age.age_bucket,
    SUM(CASE WHEN activities.activity_type = 'send'
        THEN activities.time_spent ELSE 0 END) AS send_timespent,
    SUM(CASE WHEN activities.activity_type = 'open'
        THEN activities.time_spent ELSE 0 END) AS open_timespent,
    SUM(activities.time_spent) AS total_timespent
  FROM activities
   INNER JOIN age_breakdown AS age 
    ON activities.user_id = age.user_id 
  WHERE activities.activity_type IN ('send', 'open') 
  GROUP BY age.age_bucket
  )
  
  SELECT 
    age_bucket,
    ROUND(100.0 * send_timespent / total_timespent, 2) AS send_perc,
    ROUND(100.0 * open_timespent / total_timespent, 2) AS open_perc
  FROM snaps_statistics;
