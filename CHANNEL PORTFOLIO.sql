show databases;

use mavenfuzzyfactory;

show tables;

select utm_source, count(utm_campaign) from website_sessions group by utm_source limit 50;
select * from website_sessions limit 50;

SELECT 
    YEARWEEK(created_at) AS week_start_date,
    MIN(created_at) AS created,
    COUNT(DISTINCT CASE
            WHEN utm_source = 'gsearch' THEN website_session_id
            ELSE NULL
        END) AS gsearch_session,
    COUNT(DISTINCT CASE
            WHEN utm_source = 'bsearch' THEN website_session_id
            ELSE NULL
        END) AS bsearch_session
FROM
    website_sessions
GROUP BY 1
ORDER BY 3 DESC;




