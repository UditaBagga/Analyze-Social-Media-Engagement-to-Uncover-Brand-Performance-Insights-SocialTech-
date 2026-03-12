#objective 3 Which sponsors & brands get the best ROI?

#(A)
-- Which sponsor gets the most total engagement?
SELECT 
    s.sponsor_name,
    SUM(e.likes + e.shares + e.comments_count) AS total_engagement
FROM sponsorship s
JOIN engagement e ON s.content_id = e.content_id
GROUP BY s.sponsor_name
ORDER BY total_engagement DESC
LIMIT 10;

#(B)
-- Which sponsor category performs best?
SELECT 
    s.sponsor_category,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM sponsorship s
JOIN engagement e ON s.content_id = e.content_id
GROUP BY s.sponsor_category
ORDER BY avg_engagement DESC;

#(C)
-- Which platform is best for sponsorships?
SELECT 
    c.platform,
    COUNT(s.sponsorship_id) AS total_sponsorships,
    ROUND(AVG(e.likes + e.shares + e.comments_count), 2) AS avg_engagement
FROM sponsorship s
JOIN post p ON s.content_id = p.content_id
JOIN creator c ON p.creator_id = c.creator_id
JOIN engagement e ON s.content_id = e.content_id
GROUP BY c.platform
ORDER BY avg_engagement DESC;

