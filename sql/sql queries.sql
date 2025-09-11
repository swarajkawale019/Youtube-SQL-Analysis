-- Get the top 5 most subscribed YouTube channels?
SELECT 
    channel_name, subscribers
FROM
    youtube_channels
ORDER BY subscribers DESC
LIMIT 5;

-- Find the total yearly revenue of all channels?
WITH revenue_cte AS (
    SELECT 
        yc.channel_name,
        SUM(cr.yearly_revenue) AS total_revenue
    FROM 
        youtube_channels yc JOIN 
        channel_revenue cr ON yc.channel_id = cr.channel_id
    GROUP BY 
        yc.channel_name )
SELECT 
    channel_name,
    CONCAT(ROUND(total_revenue / 1000000, 1), ' M') AS total_year_revenue
FROM 
    revenue_cte
ORDER BY 
    total_revenue DESC;
    
-- Find the video uploaded by 'MrBeast' ? 
 SELECT 
    yc.channel_name, cv.video_title
FROM
    youtube_channels yc JOIN
    channel_videos cv ON yc.channel_id = cv.channel_id
WHERE
    channel_name = 'MrBeast';
    
-- Get the average engagement (likes & comments) per video for each channel ?
    SELECT 
    yc.channel_name, 
    CASE 
        WHEN AVG(ce.likes_per_video + ce.comments_per_video) >= 1000000 THEN 
            CONCAT(ROUND(AVG(ce.likes_per_video + ce.comments_per_video) / 1000000, 2), ' M')
        WHEN AVG(ce.likes_per_video + ce.comments_per_video) >= 1000 THEN 
            CONCAT(ROUND(AVG(ce.likes_per_video + ce.comments_per_video) / 1000, 2), ' K')
        ELSE 
            ROUND(AVG(ce.likes_per_video + ce.comments_per_video), 2)
    END AS avg_engagement
FROM 
    youtube_channels yc JOIN 
    channel_engagement ce ON yc.channel_id = ce.channel_id
GROUP BY 
    yc.channel_name
ORDER BY 
    AVG(ce.likes_per_video + ce.comments_per_video) DESC;
    
-- List channels that have a NOX score higher than 10 ?
    SELECT 
    channel_name, nox_score
FROM
    youtube_channels
WHERE
    nox_score > 10
ORDER BY nox_score DESC;

-- Find the most commented video ?
SELECT 
    video_title,
    comments
FROM 
    channel_videos
WHERE 
    comments = (
        SELECT 
            MAX(comments)
        FROM 
            channel_videos   );
            
-- Count the total number of channels in each category ? 
 SELECT 
    category, COUNT(DISTINCT channel_name) AS total_channels
FROM
    youtube_channels
GROUP BY category
ORDER BY total_channels DESC;

-- Search for channel names that start with "M" and end with "t" ? 
SELECT 
    channel_name
FROM
    youtube_channels
WHERE
    channel_name LIKE 'M%'
        AND channel_name LIKE '%t';
        
-- Find videos uploaded between '2024-03-01' AND '2024-08-01' ?
SELECT 
    video_title
FROM
    channel_videos
WHERE
    upload_date BETWEEN '2024-03-01' AND '2024-08-01';
    
-- Find the top 3 most liked videos on YouTube ?
SELECT 
    cv.video_title,
    CONCAT(ROUND(cv.likes / 1000, 0), ' K') AS video_likes
FROM 
    channel_videos cv
ORDER BY 
    cv.likes DESC
LIMIT 3;

-- Which YouTube channel shows the lowest overall engagement across likes, comments, and shares per video?
SELECT 
   yc.channel_name,
   CONCAT(ROUND((ce.likes_per_video + ce.comments_per_video + ce.shares_per_video) / 1000,
                   0),
           ' K') AS total_engagement
FROM
   youtube_channels yc JOIN
   channel_engagement ce ON yc.channel_id = ce.channel_id
ORDER BY (ce.likes_per_video + ce.comments_per_video + ce.shares_per_video) ASC
LIMIT 1;

-- Which videos have outperformed their respective channel’s average view count?
WITH converted_views AS (
    SELECT 
        yc.channel_id,
        yc.channel_name,
        cv.views,
        CASE
            WHEN yc.avg_views LIKE '%M' THEN REPLACE(yc.avg_views, 'M', '') * 1000000
            WHEN yc.avg_views LIKE '%K' THEN REPLACE(yc.avg_views, 'K', '') * 1000
            ELSE yc.avg_views
        END AS avg_views_numeric
    FROM 
        youtube_channels yc JOIN 
        channel_videos cv ON yc.channel_id = cv.channel_id
)

SELECT DISTINCT 
    channel_name
FROM 
    converted_views
WHERE 
    views > avg_views_numeric;
    
 -- What is the average engagement (likes, comments, and shares per video) across different YouTube content categories?   
 SELECT 
    yc.category,
    CONCAT(ROUND(AVG(ce.likes_per_video) / 1000, 2), ' K') AS avg_likes,
    CONCAT(ROUND(AVG(ce.comments_per_video) / 1000, 2), ' K') AS avg_comments,
    CONCAT(ROUND(AVG(ce.shares_per_video) / 1000, 2), ' K') AS avg_shares
FROM 
    youtube_channels yc JOIN 
    channel_engagement ce ON yc.channel_id = ce.channel_id
GROUP BY 
    yc.category
ORDER BY 
    AVG(ce.likes_per_video) DESC;
    
-- Which content category generates the highest average yearly revenue per channel?
SELECT 
    yc.category, 
    CONCAT(ROUND(SUM(cr.yearly_revenue) / COUNT(DISTINCT yc.channel_id) / 1000000, 2), ' M') AS avg_revenue_per_channel
FROM 
    youtube_channels yc JOIN 
    channel_revenue cr ON yc.channel_id = cr.channel_id
GROUP BY 
    yc.category
ORDER BY 
    SUM(cr.yearly_revenue) / COUNT(DISTINCT yc.channel_id) DESC;
    
-- Which YouTube channels have high total engagement but a low NOX score?
SELECT 
    yc.channel_name,
    CONCAT(ROUND((ce.likes_per_video + ce.comments_per_video + ce.shares_per_video) / 1000, 2), ' K') AS total_engagement,
    yc.nox_score
FROM 
    youtube_channels yc JOIN 
    channel_engagement ce ON yc.channel_id = ce.channel_id
WHERE 
    yc.nox_score < 10
ORDER BY 
    (ce.likes_per_video + ce.comments_per_video + ce.shares_per_video) DESC;
    