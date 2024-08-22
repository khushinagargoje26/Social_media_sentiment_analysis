-- Analyze the Relationship Between Post Frequency and Sentiment:

SELECT h.hashtag, COUNT(p.post_id) AS post_count, AVG(
    CASE
        WHEN p.sentiment = 'Positive' THEN 1
        WHEN p.sentiment = 'Neutral' THEN 0
        WHEN p.sentiment = 'Negative' THEN -1
        ELSE NULL
    END
) AS avg_sentiment_score
FROM hashtags h
JOIN posts p ON h.post_id = p.post_id
GROUP BY h.hashtag;

