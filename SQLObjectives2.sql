#Objective 2 How does audience location & demographics affect engagement?
#(A)

-- Which audience location has the most engagement?
SELECT 
    c.audience_location,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM creator c
JOIN post p ON c.creator_id = p.creator_id
JOIN engagement e ON p.content_id = e.content_id
GROUP BY c.audience_location
ORDER BY avg_engagement DESC;

#(B)
-- Which language drives the most engagement?
SELECT 
    p.language,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM post p
JOIN engagement e ON p.content_id = e.content_id
GROUP BY p.language
ORDER BY avg_engagement DESC;

#(C)-- Which platform + location combo performs best?
SELECT 
    c.platform,
    c.audience_location,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM creator c
JOIN post p ON c.creator_id = p.creator_id
JOIN engagement e ON p.content_id = e.content_id
GROUP BY c.platform, c.audience_location
ORDER BY avg_engagement DESC
LIMIT 10;