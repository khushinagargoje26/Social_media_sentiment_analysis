-- Analyze the Impact of Hashtags on Post Sentiment:
SELECT h.hashtag, AVG(
    CASE
        WHEN p.sentiment = 'Positive' THEN 1
        WHEN p.sentiment = 'Neutral' THEN 0
        WHEN p.sentiment = 'Negative' THEN -1
        ELSE NULL
    END
) AS avg_post_sentiment
FROM hashtags h
JOIN posts p ON h.post_id = p.post_id
GROUP BY h.hashtag
ORDER BY avg_post_sentiment DESC;
