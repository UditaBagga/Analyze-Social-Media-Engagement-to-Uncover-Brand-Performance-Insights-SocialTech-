#Objective 4  How does posting time & content affect engagement?

#(A)
-- Morning, Afternoon, Evening, Night — which gets most engagement?
SELECT 
    CASE 
        WHEN HOUR(post_date) BETWEEN 5 AND 11  THEN 'Morning'
        WHEN HOUR(post_date) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(post_date) BETWEEN 18 AND 21 THEN 'Evening'
        ELSE 'Night'
    END AS time_of_day,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM post p
JOIN engagement e ON p.content_id = e.content_id
GROUP BY time_of_day
ORDER BY avg_engagement DESC;

#(B)
-- Which day of the week gets most engagement?
SELECT 
    DAYNAME(post_date) AS day_of_week,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM post p
JOIN engagement e ON p.content_id = e.content_id
GROUP BY day_of_week
ORDER BY avg_engagement DESC;

#(C)
-- Top 10 most engaging posts overall
SELECT 
    p.content_id,
    p.content_type,
    p.content_category,
    (e.likes + e.shares + e.comments_count) AS total_engagement
FROM post p
JOIN engagement e ON p.content_id = e.content_id
ORDER BY total_engagement DESC
LIMIT 10;
