-- Calculate the Average Sentiment Score for Each User:

SELECT 
    users.user_id,
    users.username,
    AVG(CASE
        WHEN comments.sentiment = 'Positive' THEN 1
        WHEN comments.sentiment = 'Neutral' THEN 0
        WHEN comments.sentiment = 'Negative' THEN - 1
        ELSE NULL
    END) AS avg_sentiment_score
FROM
    comments
        JOIN
    users ON comments.user_id = users.user_id
GROUP BY user_id
ORDER BY user_id;                


