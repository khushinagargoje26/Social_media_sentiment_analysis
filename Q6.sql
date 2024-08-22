-- Compare Sentiment Scores for Different Social Media Platforms:
SELECT p.platform, AVG(
    CASE
        WHEN p.sentiment = 'Positive' THEN 1
        WHEN p.sentiment = 'Neutral' THEN 0
        WHEN p.sentiment = 'Negative' THEN -1
        ELSE NULL
    END
) AS avg_sentiment_score
FROM posts p
GROUP BY p.platform;
