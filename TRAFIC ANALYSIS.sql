#TRAFIC ANALYSSIS

use mavenfuzzyfactory;

select * from website_sessions 
where website_session_id between 1000 and 2000;

desc website_sessions;

select utm_content, count(utm_content) as adds from website_sessions group by utm_content order by adds desc;

select 
      website_sessions.utm_content,
      count(distinct website_sessions.website_session_id) as sessions,
      count(distinct orders.order_id) as orders
from website_sessions
  left join orders
                 on  website_sessions.website_session_id = orders.website_session_id 
group by 1 
order by 2 desc;

select 
      website_sessions.utm_content,
      count(distinct website_sessions.website_session_id) as sessions,
      count(distinct orders.order_id) as orders,
      count(distinct website_sessions.website_session_id)/count(distinct orders.order_id) as session_to_order_conv_rate
from website_sessions
  left join orders
                 on  website_sessions.website_session_id = orders.website_session_id 
group by 1 
order by 2 desc;

select utm_source, utm_campaign, http_referer, count(distinct website_session_id) as sessions from website_sessions where created_at < '2012-04-12' group by 1,2,3 order by 4;

SELECT 
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT website_sessions.website_session_id) / COUNT(DISTINCT orders.order_id) as order_for_add
FROM
    website_sessions
        LEFT JOIN
    orders ON website_sessions.website_session_id = orders.website_session_id
WHERE
    website_sessions.created_at  < '2012-04-14'
        AND utm_source = 'gsearch'
        AND utm_campaign = 'nonbrand';
        
select * from orders;

select * from website_sessions;

SELECT 
    website_sessions.device_type,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT website_sessions.website_session_id) / COUNT(DISTINCT orders.order_id) AS sessoin_to_order_rate
FROM
    website_sessions
        LEFT JOIN
    orders ON website_sessions.website_session_id = orders.order_id
GROUP BY 1
ORDER BY 4;
