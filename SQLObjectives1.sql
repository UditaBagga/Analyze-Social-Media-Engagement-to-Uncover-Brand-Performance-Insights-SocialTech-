use social_media_db;

#objective 1 Which content types, hashtags & platforms get the most engagement?
#(A)
-- Which content type gets most engagement?
SELECT 
    p.content_type,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM post p
JOIN engagement e ON p.content_id = e.content_id
GROUP BY p.content_type
ORDER BY avg_engagement DESC;

#(B)
-- Which platform gets most engagement?
SELECT 
    c.platform,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM creator c
JOIN post p ON c.creator_id = p.creator_id
JOIN engagement e ON p.content_id = e.content_id
GROUP BY c.platform
ORDER BY avg_engagement DESC;

#(C)
-- Which content category gets most engagement?
SELECT 
    p.content_category,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM post p
JOIN engagement e ON p.content_id = e.content_id
GROUP BY p.content_category
ORDER BY avg_engagement DESC;
