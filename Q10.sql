-- Track Engagement Trends Based on Hashtag Sentiment Over Time:
SELECT h.hashtag, p.post_date, COUNT(e.engagement_id) AS total_engagements, AVG(
    CASE
        WHEN p.sentiment = 'Positive' THEN 1
        WHEN p.sentiment = 'Neutral' THEN 0
        WHEN p.sentiment = 'Negative' THEN -1
        ELSE NULL
    END
) AS avg_sentiment_score
FROM hashtags h
JOIN posts p ON h.post_id = p.post_id
LEFT JOIN engagement e ON p.post_id = e.post_id
GROUP BY h.hashtag, p.post_date
ORDER BY p.post_date, avg_sentiment_score DESC;
