-- Find Users with the Most Negative Sentiments in Comments:

SELECT 
    users.username,
    users.user_id,
    COUNT(comments.comment_id) AS negative_comments
FROM
    users
        JOIN
    comments ON users.user_id = comments.user_id
WHERE
    sentiment = 'Negative'
GROUP BY users.username , users.user_id
ORDER BY negative_comments DESC
LIMIT 5;
