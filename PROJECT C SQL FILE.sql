CREATE DATABASE WEBSITE ;
USE WEBSITE;
SELECT * FROM events limit 5;
-- OUTPUT --
-- user_id	| ga_session_id	| country | device |   type   |  item_id   |  date
-- 2133	       16909	        US	    mobile   purchase	   94	     01-11-2020
-- 2133	       16909	        US	    mobile	 purchase	  425	     01-11-2020
-- 5789	       16908	        SE	    desktop	 purchase	   62	     01-11-2020
-- 5808	        4267	        US	    mobile	 add_to_cart  842	     01-11-2020

SELECT * FROM items limit 5;
SELECT * FROM sessions limit 5;
SELECT * FROM users limit 5;

## Segment Users by Device & Conversion Rate
SELECT 
    device,
    COUNT(DISTINCT user_id) AS total_users,
    SUM(purchase_count) AS total_purchases,
    ROUND(SUM(purchase_count) * 100.0 / COUNT(DISTINCT user_id), 2) AS conversion_rate_percent
FROM sessions
GROUP BY device
ORDER BY conversion_rate_percent DESC;
-- OUTPUT --
-- device |	total_users | total_purchases | conversion_rate_percent
-- mobile	  5966	         6270	              105.1
-- desktop	  8576	         8911	              103.91
-- tablet	   322	          294	               91.3

## Segment Users by Country
SELECT 
    country,
    COUNT(DISTINCT user_id) AS total_users,
    SUM(purchase_count) AS total_purchases,
    ROUND(SUM(purchase_count) * 100.0 / COUNT(DISTINCT user_id), 2) AS conversion_rate_percent
FROM sessions
GROUP BY country
ORDER BY conversion_rate_percent DESC
LIMIT 10;
-- OUTPUT --
-- country | total_users | total_purchases | conversion_rate_percent
--   AM	         1	             4	                  400
--   MT	         2	             8	                  400
--   SI	        11	            38	                  345.45
--   KW	         9	            26	                  288.89
--   MO	         3	             7	                  233.33
--   LB	         3	             7	                  233.33
--   NG	        15	            31	                  206.67
--   UY	         9	            16	                  177.78
--   SK	        12	            21	                  175
--   MK	         7	            12	                  171.43


## High-Value Users (Based on LTV)
SELECT 
    u.id AS user_id,
    u.ltv,
    COUNT(s.ga_session_id) AS total_sessions,
    SUM(s.purchase_count) AS total_purchases,
    SUM(s.session_revenue) AS total_revenue
FROM users u
JOIN sessions s ON u.id = s.user_id
GROUP BY u.id, u.ltv
ORDER BY u.ltv DESC
LIMIT 10;
-- OUTPUT --
-- user_id |  ltv  | total_sessions| total_purchases | total_revenue
-- 29733	  1530	      1	             11	              213
-- 15921	  1424	      1	             11	              636
-- 7765	      1409	      4	             23	             1410
-- 20086	  1260	      3	             10	              420
-- 186	      1215	      1	              5	               19
-- 27893	  1200	      3	             12	             1200
-- 1885	      1126	      1	              6	               60
-- 1298	      1121	      4	             25	              818
-- 3736	      1049	      3	             15	              533
-- 29376	  1019	      2	              1	               48


## Funnel Drop-off Analysis (Cart → Checkout → Purchase)
SELECT 
    device,
    SUM(add_to_cart_count) AS added_to_cart,
    SUM(begin_checkout_count) AS began_checkout,
    SUM(purchase_count) AS purchases,
    ROUND(SUM(purchase_count) * 100.0 / NULLIF(SUM(add_to_cart_count),0), 2) AS cart_to_purchase_rate,
    ROUND(SUM(purchase_count) * 100.0 / NULLIF(SUM(begin_checkout_count),0), 2) AS checkout_to_purchase_rate
FROM sessions
GROUP BY device
ORDER BY purchases DESC;
-- OUTPUT --
-- device   | added_to_cart | began_checkout | purchases | cart_to_purchase_rate | checkout_to_purchase_rate 
-- desktop	     384965	          44439	         8911	          2.31	                  20.05
-- mobile	     263610	          29421	         6270	          2.38	                  21.31
-- tablet	      14730	           1689	          294	             2	                  17.41

## Bounce Rate by Device
 SELECT 
    device,
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN events_count = 1 THEN 1 ELSE 0 END) AS bounced_sessions,
    ROUND(SUM(CASE WHEN events_count = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS bounce_rate_percent
FROM sessions
GROUP BY device
ORDER BY bounce_rate_percent DESC;
-- OUTPUT --
-- device  | total_sessions | bounced_sessions | bounce_rate_percent
-- tablet	     376	            15	               3.99
-- desktop	   10361	           366	               3.53
-- mobile	    7161	           239	               3.34

## Revenue by item category
SELECT 
    i.category,
    SUM(s.session_revenue) AS total_revenue,
    COUNT(DISTINCT s.user_id) AS buyers
FROM sessions s
JOIN events e ON s.ga_session_id = e.ga_session_id
JOIN items i ON e.item_id = i.id
WHERE s.purchase_count > 0
GROUP BY i.category
ORDER BY total_revenue DESC;
-- OUTPUT --
--      category     | total_revenue  | buyers
--      Apparel	          2841743	     2576
--         New	           799756	     1002
--   Campus Collection	   626620	      807
--     Accessories	       569846	      819
--        Bags	           488091	      522
--   Shop by Brand	       382980	      806
--       Office	           331862	      595
--     Drinkware	       305585	      594
--     Clearance	       288873	      570
--     Lifestyle	       288076	      553
-- Uncategorized Items	   188358	      447
--    Small Goods	       126879	      296
--    Gift Cards	       104496	       11
--   Instruments	        97869	      133
--    Stationery	        90346	      194
--     Google	            90083	      207
-- Electronics Accessories	28262	       48
-- Notebooks & Journals	    13627	       47
--        Fun	             9957	       41
--   Eco-Friendly	         6891	       14
-- Black Lives Matter	      730	        2


## User Segmentation by Device + Country (Cross-Analysis)
SELECT 
    country,
    device,
    COUNT(DISTINCT user_id) AS total_users,
    SUM(purchase_count) AS total_purchases,
    ROUND(SUM(purchase_count) * 100.0 / COUNT(DISTINCT user_id), 2) AS conversion_rate_percent
FROM sessions
GROUP BY country, device
ORDER BY total_purchases DESC
LIMIT 10;
-- OUTPUT --
-- country |  device  | total_users | total_purchases |	conversion_rate_percent
--   US	      desktop	   3834	           4089	               106.65
--   US	      mobile	   2690	           2648	                98.44
--   IN	      desktop	    811	            799	                98.52
--   CA	      desktop	    663	            792	               119.46
--   IN	      mobile	    543	            613	               112.89
--   CA	      mobile	    490	            543	               110.82
--   GB	      desktop	    268	            268	               100
--   ES	      desktop	    167	            251	               150.3
--   FR	      desktop	    181	            226	               124.86
--   GB	       mobile	    195	            186	                95.38









