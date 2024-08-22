
-- Identify the Top 5 Hashtags by Sentiment and Frequency:
SELECT 
    hashtag, frequency, sentiment
FROM
    hashtags
ORDER BY frequency DESC , sentiment
LIMIT 5;