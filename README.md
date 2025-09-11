# YouTube Performance Metrics & Revenue Analysis using SQL

## 🚀 Executive Summary  
This project analyzes a relational YouTube dataset to solve key business problems for content creators, marketers, and brands. The primary challenge addressed is the difficulty of tracking performance and identifying growth opportunities in a saturated market.  

By writing efficient SQL queries in MySQL, this analysis identified:  
- The most lucrative content categories  
- Benchmarked top-performing channels  
- Uncovered mismatches between audience engagement and monetization effectiveness  

**Key Recommendations:**  
- Advise creators in lower-earning categories like Gaming to diversify revenue streams  
- Guide high-engagement channels to refine brand storytelling to improve their monetization potential  

---

## 📈 Business Problem  

With millions of videos and channels on YouTube, understanding performance metrics like engagement, views, and revenue is a major challenge for creators, brands, and marketers.

This project focuses on analyzing YouTube data to:

- Identify top-performing channels and videos
- Track audience engagement through likes, comments, and shares
- Understand revenue trends across different categories
- Detect underperforming content and improvement areas
  
By writing optimized SQL queries, the goal is to generate meaningful insights that support better decision-making in content planning, influencer collaborations, and monetization strategies.

---

## 🛠️ Methodology  
This project uses a relational YouTube dataset made up of four interconnected tables. Each table captures specific aspects of channel performance and activity:

Table 1 : youtube_channels
This table contains basic details about each YouTube channel.

Table 2 : channel_revenue
This table contains monetary data related to each channel’s earnings.

Table 3 : channel_videos
This table holds data about individual videos uploaded by each channel.

Table 4 : channel_engagement
This table tracks overall engagement trends per video on a channel.

The core of the methodology involved writing a series of targeted **SQL queries in MySQL** to extract, join, and aggregate data. This approach was chosen for its precision and efficiency in transforming raw data into clear performance indicators, allowing for direct answers to specific business questions regarding revenue, subscriptions, and engagement trends.  

---

## 🛠️ Specific Skills  

**Database Management:**  
- MySQL  

**Data Validation:**  
- Microsoft Excel  

**SQL Proficiency:**  
- **CTEs (Common Table Expressions):** To structure complex queries for calculating revenue and identifying outperforming videos  
- **Subqueries:** To find the most commented video by nesting a MAX() function query  
- **JOINs:** To combine data from all four tables to create a comprehensive view of channel performance, revenue, and engagement  
- **CASE Statements:** To format outputs and implement conditional logic (e.g., converting average views from text 'M'/'K' to numeric values)  
- **Aggregate Functions:** `SUM()`, `AVG()`, `COUNT()`, `MAX()` to calculate total revenues, average engagement rates, and top performers  
- **Filtering & Sorting:** `GROUP BY`, `ORDER BY`, `LIMIT`, and `WHERE` clauses (including `LIKE` and `BETWEEN`) to segment and rank data effectively  

---

## 📊 Results and Business Recommendations  

**Key Insights**

- **Content Category Dictates Revenue :** The Music category generates the highest average yearly revenue at $31.5M per channel, while People & Blogs and Gaming are at the lower end with under $10M.


- **Engagement Doesn't Equal Brand Value :** Channels like MrBeast and PewDiePie show high total engagement but have low NOX scores (<1), indicating strong viewer interaction but lower perceived brand value or monetization potential.


- **Entertainment is a Saturated Market :** The Entertainment category dominates the dataset with the most channels, showing it's the most competitive field.


- **Top Channels Have Massive Reach :** The top channels have a huge audience base, with MrBeast leading with 370 million subscribers, followed by T-Series with 288 million.


- **Engagement Varies by Metric :** While Entertainment leads in average likes (229K), the People & Blogs and Education categories show strong audience interaction through a higher proportion of comments and shares.


**Business Recommendations**

- **Diversify Revenue Streams :** Gaming and Blogs channels should explore additional revenue streams like merchandise, memberships, or brand collaborations to boost earnings beyond ad revenue.


- **Align Engagement with Monetization :** Creators with high engagement but low NOX scores should optimize brand collaborations and enhance their sponsorship pitches to better translate audience interaction into brand value.


- **Find a Niche in Less Crowded Fields :** Channels in less competitive categories like Education or People & Blogs can stand out by creating specialized, focused content tailored to a specific audience.


- **Prioritize High-Reach Influencers :** Brands looking for influencer collaborations should prioritize high-subscriber channels to maximize reach and impact.


- **Boost Interaction with Engaging Content :** Channels with lower engagement should experiment with interactive formats like polls, Q&As, and audience-focused content to spark more viewer participation.
---

## 🔮 Next Steps  

- **Time-Series Analysis:** Track video performance relative to upload date to identify decay trends, seasonality, and best posting times.  
- **Audience Sentiment Analysis:** Use **NLP on comments** to gauge audience sentiment, revealing why certain videos resonate positively or negatively.  
- **Data Limitations:** A more robust analysis would use **longitudinal data** across more channels. Further, NOX score should be validated against **real sponsorship deal values** to make it a stronger KPI.  

---
