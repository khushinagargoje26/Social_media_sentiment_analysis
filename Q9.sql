-- SELECT * FROM social_media_analysis.users;
SELECT h.hashtag, COUNT(h.post_id) AS hashtag_usage, AVG(
    CASE
        WHEN p.sentiment = 'Positive' THEN 1
        WHEN p.sentiment = 'Neutral' THEN 0
        WHEN p.sentiment = 'Negative' THEN -1
        ELSE NULL
    END
) AS avg_sentiment_score
FROM hashtags h
JOIN posts p ON h.post_id = p.post_id
GROUP BY h.hashtag
HAVING avg_sentiment_score > 0.7
ORDER BY hashtag_usage DESC
LIMIT 5;
