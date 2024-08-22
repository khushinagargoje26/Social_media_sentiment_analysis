-- Analyze the Sentiment Distribution Across Different Age Groups:
SELECT 
    CASE
        WHEN u.age < 20 THEN 'Under 20'
        WHEN u.age BETWEEN 20 AND 29 THEN '20-29'
        WHEN u.age BETWEEN 30 AND 39 THEN '30-39'
        ELSE '40 and above'
    END AS age_group,
    AVG(
        CASE
            WHEN p.sentiment = 'Positive' THEN 1
            WHEN p.sentiment = 'Neutral' THEN 0
            WHEN p.sentiment = 'Negative' THEN -1
            ELSE NULL
        END
    ) AS avg_sentiment_score
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY age_group
ORDER BY avg_sentiment_score DESC;
