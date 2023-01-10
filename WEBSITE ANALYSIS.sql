#ANALYSIS OF WEBSITE PERFOMANCE 

show databases;
use mavenfuzzyfactory;
show tables;
desc website_pageviews;

select * from website_pageviews limit 50;
create temporary table pagevies
SELECT 
    pageview_url, COUNT(DISTINCT website_pageview_id) AS pvs
FROM
    website_pageviews
GROUP BY 1
ORDER BY 2 desc;
show tables;

select * from pagevies;
show tables;

select * from website_pageviews;

create temporary table first_page_view_demo
SELECT 
    website_pageviews.website_session_id,
    MIN(website_pageviews.website_session_id) AS min_page_view_id
FROM
    website_pageviews
        INNER JOIN
    website_sessions ON website_sessions.website_session_id = website_pageviews.website_session_id
GROUP BY 1;

