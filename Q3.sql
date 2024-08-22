-- Find the Most Engaging Post Based on Likes, Shares, and Comments:

SELECT 
    post_id,
    content,
    (posts.likes + posts.shares + posts.comments) AS total_engagement
FROM
    posts
ORDER BY total_engagement DESC
LIMIT 1;