CREATE DATABASE Search_discovery;

USE Search_discovery;

SHOW TABLES;

-- Check the row counts
SELECT 'customers clean' AS table_name, COUNT(*) AS total_rows
FROM `customers clean`
UNION ALL
SELECT 'experiemnt clean', COUNT(*)
FROM `experiemnt clean`
UNION ALL
SELECT 'orders_clean', COUNT(*)
FROM `orders_clean`
UNION ALL
SELECT 'products clean', COUNT(*)
FROM `products clean`
UNION ALL
SELECT 'query quality clean', COUNT(*)
FROM `query quality clean`
UNION ALL
SELECT 'search queries clean', COUNT(*)
FROM `search queries clean`
UNION ALL
SELECT 'search_clicks_clean', COUNT(*)
FROM `search_clicks_clean`
UNION ALL
SELECT 'search_results_clean', COUNT(*)
FROM `search_results_clean`;

SELECT *
FROM search_results_clean
LIMIT 10;

DESCRIBE search_results_clean;

ALTER TABLE search_results_clean
RENAME COLUMN `ï»¿result_id` TO result_id;

USE search_discovery;

USE search_discovery;

USE search_discovery;

DESCRIBE search_clicks_clean;
USE search_discovery;

ALTER TABLE search_clicks_clean
RENAME COLUMN `ï»¿click_id` TO click_id;

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SHOW VARIABLES LIKE 'local_infile';

USE search_discovery;



SELECT 'search_results_clean' AS table_name,
       COUNT(*) AS total_rows
FROM search_results_clean

UNION ALL

SELECT 'search_clicks_clean',
       COUNT(*)
FROM search_clicks_clean;

USE search_discovery;

CREATE TABLE IF NOT EXISTS search_results_staging
LIKE search_results_clean;

CREATE TABLE IF NOT EXISTS search_clicks_staging
LIKE search_clicks_clean;

USE search_discovery;

CREATE TABLE IF NOT EXISTS search_results_staging
LIKE search_results_clean;

CREATE TABLE IF NOT EXISTS search_clicks_staging
LIKE search_clicks_clean;

USE search_discovery;

SHOW TABLES LIKE '%staging';

USE search_discovery;

CREATE TABLE search_results_staging
LIKE search_results_clean;

SHOW TABLES LIKE '%staging';

USE search_discovery;

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/Search_Clicks_Clean.csv'
INTO TABLE search_clicks_staging
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

USE search_discovery;

SELECT 'search_results_staging' AS table_name,
       COUNT(*) AS total_rows
FROM search_results_staging

UNION ALL

SELECT 'search_clicks_staging',
       COUNT(*)
FROM search_clicks_staging;

DESCRIBE search_results_staging;

DESCRIBE search_clicks_staging;

DESCRIBE search_results_staging;

USE search_discovery;

ALTER TABLE search_results_staging
RENAME COLUMN `ï»¿result_id` TO result_id;

DESCRIBE search_results_staging;

USE search_discovery;

DESCRIBE search_results_clean;

DESCRIBE search_clicks_clean;

DESCRIBE search_results_clean;

USE search_discovery;

CREATE TABLE search_results_backup
LIKE search_results_clean;

INSERT INTO search_results_backup
SELECT * FROM search_results_clean;

USE search_discovery;

CREATE TABLE IF NOT EXISTS search_results_backup
LIKE search_results_clean;

USE search_discovery;

INSERT INTO search_results_backup
SELECT *
FROM search_results_clean;

USE search_discovery;

START TRANSACTION;

DELETE FROM search_results_clean;

INSERT INTO search_results_clean
    (result_id, query_id, product_id, `rank`, relevance_score, sponsored)
SELECT
    result_id, query_id, product_id, `rank`, relevance_score, sponsored
FROM search_results_staging;

COMMIT;

USE search_discovery;

SELECT COUNT(*) AS total_rows
FROM search_results_clean;

USE search_discovery;

SELECT COUNT(*) AS staging_rows
FROM search_results_staging;

SELECT COUNT(*) AS original_rows
FROM search_results_clean;

SELECT COUNT(*) AS staging_rows
FROM search_discovery.search_results_staging;


SELECT COUNT(*) AS original_rows
FROM search_discovery.search_results_clean;

USE search_discovery;

DELETE FROM search_results_clean;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM search_results_clean;

INSERT INTO search_results_clean
    (result_id, query_id, product_id, `rank`, relevance_score, sponsored)
SELECT
    result_id, query_id, product_id, `rank`, relevance_score, sponsored
FROM search_results_staging;

USE search_discovery;

ALTER TABLE search_results_clean
RENAME COLUMN `ï»¿result_id` TO result_id;

INSERT INTO search_results_clean
    (result_id, query_id, product_id, `rank`, relevance_score, sponsored)
SELECT
    result_id, query_id, product_id, `rank`, relevance_score, sponsored
FROM search_results_staging;

SELECT COUNT(*) AS total_rows
FROM search_results_clean;

USE search_discovery;

CREATE TABLE IF NOT EXISTS search_clicks_backup
LIKE search_clicks_clean
USE search_discovery;

INSERT INTO search_clicks_backup
SELECT *
FROM search_clicks_clean;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM search_clicks_clean;

SELECT COUNT(*) AS original_rows
FROM search_clicks_clean;

INSERT INTO search_clicks_clean
    (click_id, query_id, product_id, `rank`, dwell_seconds,
     quality_status, quality_issue, Match_Check, Query_ID_Check,
     Product_ID_Check, Query_Product_Check, Query_Only_Check)
SELECT
    click_id, query_id, product_id, `rank`, dwell_seconds,
    quality_status, quality_issue, Match_Check, Query_ID_Check,
    Product_ID_Check, Query_Product_Check, Query_Only_Check
FROM search_clicks_staging;

USE search_discovery;

SELECT 'search_results_clean' AS table_name,
       COUNT(*) AS total_rows
FROM search_results_clean

UNION ALL

SELECT 'search_clicks_clean',
       COUNT(*)
FROM search_clicks_clean;

USE search_discovery;

SELECT 'customers clean' AS table_name, COUNT(*) AS total_rows
FROM `customers clean`
UNION ALL
SELECT 'experiemnt clean', COUNT(*)
FROM `experiemnt clean`
UNION ALL
SELECT 'orders_clean', COUNT(*)
FROM orders_clean
UNION ALL
SELECT 'products clean', COUNT(*)
FROM `products clean`
UNION ALL
SELECT 'query quality clean', COUNT(*)
FROM `query quality clean`
UNION ALL
SELECT 'search queries clean', COUNT(*)
FROM `search queries clean`
UNION ALL
SELECT 'search_results_clean', COUNT(*)
FROM search_results_clean
UNION ALL
SELECT 'search_clicks_clean', COUNT(*)
FROM search_clicks_clean;


USE search_discovery;

DESCRIBE `search queries clean`;
USE search_discovery;

ALTER TABLE `search queries clean`
CHANGE COLUMN `ï»¿query_id` `query_id` TEXT;

USE search_discovery;

SELECT *
FROM `search queries clean`
LIMIT 5;

USE search_discovery;

SELECT
    query_id,
    COUNT(*) AS id_count
FROM `search queries clean`
GROUP BY query_id
HAVING COUNT(*) > 1
ORDER BY id_count DESC
LIMIT 20;

USE search_discovery;

SELECT *
FROM `search queries clean`
WHERE query_id = 'Q011548';

USE search_discovery;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT query_id) AS unique_query_ids,
    SUM(query_id IS NULL OR TRIM(query_id) = '')
        AS missing_query_ids
FROM `search queries clean`;

USE search_discovery;

SELECT
    q.query_id,
    COUNT(DISTINCT q.customer_id) AS customers,
    COUNT(DISTINCT q.query_text) AS query_texts,
    COUNT(DISTINCT r.result_id) AS result_rows
FROM `search queries clean` q
LEFT JOIN search_results_clean r
    ON q.query_id = r.query_id
WHERE q.query_id = 'Q011548'
GROUP BY q.query_id;

USE search_discovery;

SELECT 'Search Queries' AS source, query_id
FROM `search queries clean`
WHERE query_id = 'Q011548'

UNION ALL

SELECT 'Search Results' AS source, query_id
FROM search_results_clean
WHERE query_id = 'Q011548';


USE search_discovery;

SELECT
    COUNT(DISTINCT q.query_id) AS query_ids_in_queries,
    COUNT(DISTINCT r.query_id) AS query_ids_in_results,
    COUNT(DISTINCT CASE
        WHEN r.query_id IS NOT NULL THEN q.query_id
    END) AS matching_query_ids
FROM `search queries clean` q
LEFT JOIN search_results_clean r
    ON q.query_id = r.query_id;
    
    USE search_discovery;

DESCRIBE orders_clean;

USE search_discovery;

ALTER TABLE orders_clean
CHANGE COLUMN `ï»¿order_id` order_id TEXT;

USE search_discovery;

SELECT *
FROM orders_clean
LIMIT 5;

USE search_discovery;

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS unique_order_ids,
    SUM(order_id IS NULL OR TRIM(order_id) = '') AS missing_order_ids,
    SUM(customer_id IS NULL OR TRIM(customer_id) = '') AS missing_customer_ids,
    SUM(product_id IS NULL OR TRIM(product_id) = '') AS missing_product_ids,
    SUM(gmv IS NULL) AS missing_gmv,
    SUM(margin IS NULL) AS missing_margin
FROM orders_clean;

USE search_discovery;

SELECT
    order_id,
    COUNT(*) AS order_count
FROM orders_clean
WHERE order_id IS NOT NULL
  AND TRIM(order_id) <> ''
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY order_count DESC
LIMIT 20;

USE search_discovery;

SELECT *
FROM orders_clean
WHERE order_id = 'O010623';


USE search_discovery;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT CONCAT_WS('|',
        customer_id,
        product_id,
        source,
        gmv,
        margin
    )) AS distinct_order_details
FROM orders_clean
WHERE order_id = 'O010623';

USE search_discovery;

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS customers_with_orders,
    COUNT(DISTINCT c.customer_id) AS matching_customers
FROM orders_clean o
LEFT JOIN `customers clean` c
    ON o.customer_id = c.customer_id;
    
    USE search_discovery;

DESCRIBE `customers clean`;

USE search_discovery;

ALTER TABLE `customers clean`
CHANGE COLUMN `ï»¿customer_id` `customer_id` TEXT;

USE search_discovery;

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS customers_with_orders,
    COUNT(DISTINCT c.customer_id) AS matching_customers
FROM orders_clean o
LEFT JOIN `customers clean` c
    ON o.customer_id = c.customer_id;
    
    USE search_discovery;

SELECT
    customer_id,
    COUNT(*) AS customer_count
FROM `customers clean`
WHERE customer_id IS NOT NULL
  AND TRIM(customer_id) <> ''
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY customer_count DESC
LIMIT 20;

USE search_discovery;

SELECT *
FROM `customers clean`
WHERE customer_id = 'C03291';

USE search_discovery;

SELECT COUNT(*) AS total_order_rows
FROM orders_clean;

USE search_discovery;

SELECT
    COUNT(*) AS total_customer_rows,
    COUNT(DISTINCT customer_id) AS unique_customer_ids
FROM `customers clean`;

USE search_discovery;

SELECT
    COUNT(*) AS customer_ids_with_duplicates
FROM (
    SELECT customer_id
    FROM `customers clean`
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS duplicate_customers;

USE search_discovery;

SELECT
    source,
    COUNT(*) AS order_rows,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(gmv), 2) AS average_gmv_per_row,
    ROUND(AVG(margin) * 100, 2) AS average_margin_percent
FROM orders_clean
GROUP BY source
ORDER BY total_gmv DESC;

SELECT
    CASE
        WHEN margin < 0 THEN 'Negative Margin'
        WHEN margin = 0 THEN 'Zero Margin'
        WHEN margin > 0 THEN 'Positive Margin'
        ELSE 'Missing Margin'
    END AS margin_category,
    COUNT(*) AS record_count,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(margin) * 100, 2) AS average_margin_percent
FROM orders_clean
GROUP BY margin_category
ORDER BY record_count DESC;

USE search_discovery;

SELECT
    order_id,
    customer_id,
    product_id,
    source,
    gmv,
    margin,
    ROUND(margin * 100, 2) AS margin_percent
FROM orders_clean
WHERE margin < 0
ORDER BY margin ASC;

USE search_discovery;

SELECT
    margin,
    COUNT(*) AS record_count,
    MIN(gmv) AS minimum_gmv,
    MAX(gmv) AS maximum_gmv
FROM orders_clean
GROUP BY margin
ORDER BY margin;

SELECT
    COUNT(*) AS valid_margin_records,
    ROUND(AVG(margin) * 100, 2) AS average_margin_percent,
    ROUND(SUM(gmv), 2) AS total_gmv
FROM orders_clean
WHERE margin IS NOT NULL
  AND margin <> -999;
  
  USE search_discovery;

SELECT
    COALESCE(NULLIF(TRIM(source), ''), 'Unknown') AS order_source,
    COUNT(*) AS total_records,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(gmv), 2) AS average_gmv_per_record,
    ROUND(AVG(
        CASE WHEN margin <> -999 THEN margin END
    ) * 100, 2) AS average_valid_margin_percent
FROM orders_clean
GROUP BY COALESCE(NULLIF(TRIM(source), ''), 'Unknown')
ORDER BY total_gmv DESC;

USE search_discovery;

CREATE OR REPLACE VIEW vw_order_source_kpis AS
SELECT
    COALESCE(NULLIF(TRIM(source), ''), 'Unknown') AS order_source,
    COUNT(*) AS total_records,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(gmv), 2) AS average_gmv_per_record,
    ROUND(
        AVG(CASE WHEN margin <> -999 THEN margin END) * 100,
        2
    ) AS average_valid_margin_percent
FROM orders_clean
GROUP BY COALESCE(NULLIF(TRIM(source), ''), 'Unknown');


USE search_discovery;

SELECT *
FROM vw_order_source_kpis
ORDER BY total_gmv DESC;

USE search_discovery;

SELECT
    COUNT(*) AS total_search_result_rows,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products
FROM search_results_clean;
SELECT
    COUNT(*) AS total_click_rows,
    COUNT(DISTINCT query_id) AS queries_with_clicks,
    COUNT(DISTINCT product_id) AS products_clicked
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_search_result_rows,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products
FROM search_results_clean;

SELECT
    COUNT(*) AS total_click_rows,
    SUM(
        CASE
            WHEN r.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS clicks_with_matching_query,
    SUM(
        CASE
            WHEN r.query_id IS NULL THEN 1
            ELSE 0
        END
    ) AS clicks_without_matching_query
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
) r
    ON c.query_id = r.query_id
WHERE c.query_id IS NOT NULL;

SELECT
    COUNT(*) AS total_clicks,
    SUM(
        CASE
            WHEN r.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS matching_query_and_product,
    SUM(
        CASE
            WHEN r.query_id IS NULL THEN 1
            ELSE 0
        END
    ) AS no_matching_query_product
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND product_id IS NOT NULL
) r
    ON c.query_id = r.query_id
   AND c.product_id = r.product_id;
   
   SELECT query_id, product_id
FROM search_clicks_clean
LIMIT 10;

SELECT query_id, product_id
FROM search_results_clean
LIMIT 10;

SELECT
    COUNT(*) AS total_click_rows,
    SUM(
        CASE WHEN r.query_id IS NOT NULL THEN 1 ELSE 0 END
    ) AS matching_query_ids,
    SUM(
        CASE WHEN r.query_id IS NULL THEN 1 ELSE 0 END
    ) AS unmatched_query_ids
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
) r
    ON TRIM(c.query_id) = TRIM(r.query_id);
    
    SELECT
    COUNT(*) AS clicks_with_matching_query,
    SUM(
        CASE
            WHEN p.product_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS matching_query_and_product,
    SUM(
        CASE
            WHEN p.product_id IS NULL THEN 1
            ELSE 0
        END
    ) AS product_not_found_for_query
FROM search_clicks_clean c
JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
) q
    ON TRIM(c.query_id) = TRIM(q.query_id)
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND product_id IS NOT NULL
) p
    ON TRIM(c.query_id) = TRIM(p.query_id)
   AND TRIM(c.product_id) = TRIM(p.product_id);
   
   DESCRIBE search_clicks_clean;
   
   DESCRIBE search_results_clean;
   
   SELECT
    Query_ID_Check,
    Product_ID_Check,
    Query_Product_Check,
    COUNT(*) AS total_clicks
FROM search_clicks_clean
GROUP BY
    Query_ID_Check,
    Product_ID_Check,
    Query_Product_Check
ORDER BY total_clicks DESC;

SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE WHEN query_id IS NULL OR TRIM(query_id) = ''
             THEN 1 ELSE 0 END) AS missing_query_id,
    SUM(CASE WHEN product_id IS NULL OR TRIM(product_id) = ''
             THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN rank IS NULL THEN 1 ELSE 0 END) AS missing_rank,
    SUM(CASE WHEN dwell_seconds IS NULL THEN 1 ELSE 0 END) AS missing_dwell_seconds
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE WHEN query_id IS NULL OR TRIM(query_id) = '' THEN 1 ELSE 0 END) AS missing_query_id,
    SUM(CASE WHEN product_id IS NULL OR TRIM(product_id) = '' THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN `rank` IS NULL THEN 1 ELSE 0 END) AS missing_rank,
    SUM(CASE WHEN dwell_seconds IS NULL THEN 1 ELSE 0 END) AS missing_dwell_seconds
FROM search_clicks_clean;

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds
FROM search_clicks_clean
WHERE query_id IS NULL
   OR TRIM(query_id) = ''
   OR product_id IS NULL
   OR TRIM(product_id) = ''
LIMIT 30;

CREATE OR REPLACE VIEW vw_click_data_quality AS
SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    CASE
        WHEN query_id IS NULL OR TRIM(query_id) = ''
             THEN 'Missing Query ID'
        WHEN product_id IS NULL OR TRIM(product_id) = ''
             THEN 'Missing Product ID'
        ELSE 'Identifiers Present'
    END AS data_quality_status
FROM search_clicks_clean;

SELECT
    data_quality_status,
    COUNT(*) AS total_clicks
FROM vw_click_data_quality
GROUP BY data_quality_status
ORDER BY total_clicks DESC;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT click_id) AS unique_click_ids,
    COUNT(*) - COUNT(DISTINCT click_id) AS duplicate_click_id_rows
FROM search_clicks_clean;

SELECT
    click_id,
    COUNT(*) AS occurrences
FROM search_clicks_clean
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_status,
    quality_issue
FROM search_clicks_clean
WHERE click_id = -999;

SELECT
    click_id,
    COUNT(*) AS occurrences
FROM search_clicks_clean
WHERE click_id IS NOT NULL
  AND click_id <> -999
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT
    CASE
        WHEN sponsored = 1 THEN 'Sponsored'
        WHEN sponsored = 0 THEN 'Organic'
        ELSE 'Unknown'
    END AS result_type,
    COUNT(*) AS total_result_rows,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    ROUND(AVG(`rank`), 2) AS average_rank
FROM search_results_clean
GROUP BY
    CASE
        WHEN sponsored = 1 THEN 'Sponsored'
        WHEN sponsored = 0 THEN 'Organic'
        ELSE 'Unknown'
    END
ORDER BY total_result_rows DESC;

CREATE OR REPLACE VIEW vw_search_result_type_kpis AS
SELECT
    CASE
        WHEN sponsored = 1 THEN 'Sponsored'
        WHEN sponsored = 0 THEN 'Organic'
        ELSE 'Unknown'
    END AS result_type,
    COUNT(*) AS total_result_rows,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    ROUND(AVG(`rank`), 2) AS average_rank
FROM search_results_clean
GROUP BY
    CASE
        WHEN sponsored = 1 THEN 'Sponsored'
        WHEN sponsored = 0 THEN 'Organic'
        ELSE 'Unknown'
    END;
    
    SELECT *
FROM vw_search_result_type_kpis;

SELECT
    data_quality_status,
    COUNT(*) AS total_clicks,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products,
    ROUND(AVG(dwell_seconds), 2) AS average_dwell_seconds
FROM vw_click_data_quality
GROUP BY data_quality_status
ORDER BY total_clicks DESC;

SELECT
    COUNT(*) AS clicks_with_identifiers,
    SUM(
        CASE WHEN r.query_id IS NOT NULL THEN 1 ELSE 0 END
    ) AS matching_query_product_pairs,
    SUM(
        CASE WHEN r.query_id IS NULL THEN 1 ELSE 0 END
    ) AS unmatched_query_product_pairs
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND product_id IS NOT NULL
) r
    ON TRIM(c.query_id) = TRIM(r.query_id)
   AND TRIM(c.product_id) = TRIM(r.product_id)
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> ''
  AND c.product_id IS NOT NULL
  AND TRIM(c.product_id) <> '';
  
  SELECT
    c.click_id,
    c.query_id,
    c.product_id AS clicked_product_id,
    r.product_id AS result_product_id,
    r.`rank` AS result_rank,
    r.sponsored
FROM search_clicks_clean c
LEFT JOIN search_results_clean r
    ON c.query_id = r.query_id
WHERE c.query_id = 'Q031803'
LIMIT 20;

SELECT
    click_id,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products
FROM search_clicks_clean
WHERE click_id <> -999
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY total_rows DESC
LIMIT 20;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT query_id) AS unique_query_ids,
    SUM(
        CASE
            WHEN query_id IS NULL OR TRIM(query_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_query_ids
FROM search_results_staging;

SELECT
    COUNT(*) AS clicks_with_identifiers,
    SUM(
        CASE WHEN r.query_id IS NOT NULL THEN 1 ELSE 0 END
    ) AS matching_query_product_pairs,
    SUM(
        CASE WHEN r.query_id IS NULL THEN 1 ELSE 0 END
    ) AS unmatched_query_product_pairs
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_staging
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) r
    ON TRIM(c.query_id) = TRIM(r.query_id)
   AND TRIM(c.product_id) = TRIM(r.product_id)
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> ''
  AND c.product_id IS NOT NULL
  AND TRIM(c.product_id) <> '';
  
  SELECT
    COUNT(*) AS clicks_with_identifiers,
    SUM(
        CASE WHEN r.query_id IS NOT NULL THEN 1 ELSE 0 END
    ) AS matching_pairs,
    SUM(
        CASE WHEN r.query_id IS NULL THEN 1 ELSE 0 END
    ) AS unmatched_pairs
FROM search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_staging
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) r
    ON TRIM(c.query_id) = TRIM(r.query_id)
   AND TRIM(c.product_id) = TRIM(r.product_id)
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> ''
  AND c.product_id IS NOT NULL
  AND TRIM(c.product_id) <> '';
  
  
  SELECT
    c.query_id,
    COUNT(*) AS click_records,
    COUNT(DISTINCT c.product_id) AS clicked_products,
    COUNT(DISTINCT r.product_id) AS products_in_search_results
FROM search_clicks_staging c
JOIN search_results_staging r
    ON TRIM(c.query_id) = TRIM(r.query_id)
   AND TRIM(c.product_id) = TRIM(r.product_id)
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> ''
  AND c.product_id IS NOT NULL
  AND TRIM(c.product_id) <> ''
GROUP BY c.query_id
ORDER BY click_records DESC;

SELECT
    COUNT(*) AS total_click_records,
    COUNT(DISTINCT c.query_id) AS distinct_click_queries,
    SUM(
        CASE
            WHEN q.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS records_with_query_id_found,
    SUM(
        CASE
            WHEN q.query_id IS NULL THEN 1
            ELSE 0
        END
    ) AS records_with_query_id_not_found
FROM search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON TRIM(c.query_id) = q.query_id
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> '';
  
  SELECT
    COUNT(*) AS total_click_records,
    SUM(
        CASE
            WHEN q.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS matched_records,
    SUM(
        CASE
            WHEN q.query_id IS NULL THEN 1
            ELSE 0
        END
    ) AS unmatched_records
FROM search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON TRIM(c.query_id) = q.query_id
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> '';
  
  SELECT
    c.query_id,
    COUNT(*) AS click_records
FROM search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON TRIM(c.query_id) = q.query_id
WHERE c.query_id IS NOT NULL
  AND TRIM(c.query_id) <> ''
  AND q.query_id IS NULL
GROUP BY c.query_id
ORDER BY click_records DESC
LIMIT 20;

SELECT
    c.query_id,
    COUNT(*) AS click_records,
    COUNT(DISTINCT q.query_id) AS matching_staging_query_ids
FROM search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON TRIM(c.query_id) = q.query_id
WHERE TRIM(c.query_id) IN (
    'Q019131', 'Q039330', 'Q003756',
    'Q003274', 'Q027130'
)
GROUP BY c.query_id
ORDER BY c.query_id;

SHOW TABLES;
DESCRIBE `search queries clean`;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT TRIM(query_id)) AS unique_query_ids,
    SUM(
        CASE
            WHEN query_id IS NULL OR TRIM(query_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_query_ids,
    COUNT(*) - COUNT(DISTINCT TRIM(query_id)) AS duplicate_count_estimate
FROM `search queries clean`;

SELECT
    COUNT(*) AS repeated_query_id_groups,
    SUM(occurrences - 1) AS extra_duplicate_rows
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        COUNT(*) AS occurrences
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
    GROUP BY TRIM(query_id)
    HAVING COUNT(*) > 1
) AS duplicate_groups;

SELECT
    TRIM(query_id) AS query_id,
    COUNT(*) AS occurrences,
    COUNT(DISTINCT customer_id) AS distinct_customers,
    COUNT(DISTINCT query_text) AS distinct_query_texts,
    COUNT(DISTINCT result_count) AS distinct_result_counts
FROM `search queries clean`
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
GROUP BY TRIM(query_id)
HAVING COUNT(*) > 1
ORDER BY occurrences DESC
LIMIT 10;

SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM `search queries clean`
WHERE TRIM(query_id) = 'Q011548'
ORDER BY timestamp;

SELECT
    q.query_id,
    COUNT(*) AS query_records,
    COUNT(DISTINCT q.customer_id) AS query_customers,
    COUNT(DISTINCT r.query_id) AS matching_result_query_ids,
    COUNT(r.result_id) AS matching_result_rows
FROM `search queries clean` q
LEFT JOIN search_results_staging r
    ON TRIM(q.query_id) = TRIM(r.query_id)
WHERE TRIM(q.query_id) = 'Q011548'
GROUP BY q.query_id;

SELECT
    COUNT(*) AS query_ids_without_results
FROM (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_results_staging
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) r
    ON q.query_id = r.query_id
WHERE r.query_id IS NULL;

SELECT
    CASE
        WHEN result_count = 0 THEN 'Zero Results'
        WHEN result_count > 0 THEN 'Positive Result Count'
        WHEN result_count IS NULL THEN 'Missing Result Count'
        ELSE 'Negative Result Count'
    END AS result_category,
    COUNT(DISTINCT TRIM(query_id)) AS distinct_query_ids
FROM `search queries clean`
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
  AND TRIM(query_id) IN (
      SELECT DISTINCT TRIM(q.query_id)
      FROM `search queries clean` q
      WHERE q.query_id IS NOT NULL
        AND TRIM(q.query_id) <> ''
  )
  AND NOT EXISTS (
      SELECT 1
      FROM search_results_staging r
      WHERE TRIM(r.query_id) = TRIM(`search queries clean`.query_id)
        AND r.query_id IS NOT NULL
        AND TRIM(r.query_id) <> ''
  )
GROUP BY result_category
ORDER BY result_category;

SELECT
    TRIM(query_id) AS query_id,
    COUNT(*) AS query_records,
    COUNT(DISTINCT result_count) AS different_result_counts,
    MIN(result_count) AS minimum_result_count,
    MAX(result_count) AS maximum_result_count
FROM `search queries clean`
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
GROUP BY TRIM(query_id)
HAVING COUNT(DISTINCT result_count) > 1
ORDER BY different_result_counts DESC, query_records DESC
LIMIT 10;

SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN `timestamp` IS NULL
                 OR TRIM(`timestamp`) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_timestamps,
    MIN(
        STR_TO_DATE(`timestamp`, '%Y-%m-%d %H:%i')
    ) AS earliest_timestamp,
    MAX(
        STR_TO_DATE(`timestamp`, '%Y-%m-%d %H:%i')
    ) AS latest_timestamp
FROM `search queries clean`;

SELECT
    SUM(
        CASE
            WHEN `timestamp` IS NOT NULL
                 AND TRIM(`timestamp`) <> ''
                 AND STR_TO_DATE(
                     `timestamp`,
                     '%Y-%m-%d %H:%i'
                 ) IS NULL
            THEN 1
            ELSE 0
        END
    ) AS invalid_timestamp_formats
FROM `search queries clean`;

SELECT
    COALESCE(
        NULLIF(TRIM(query_text), ''),
        'Missing Query Text'
    ) AS query_category,
    COUNT(*) AS total_records,
    COUNT(DISTINCT TRIM(query_id)) AS distinct_query_ids
FROM `search queries clean`
GROUP BY
    COALESCE(
        NULLIF(TRIM(query_text), ''),
        'Missing Query Text'
    )
ORDER BY total_records DESC;

SELECT
    query_text AS query_category,
    COUNT(*) AS total_query_records,
    SUM(
        CASE
            WHEN result_count = 0 THEN 1
            ELSE 0
        END
    ) AS zero_result_records,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN result_count = 0 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS zero_result_percentage
FROM `search queries clean`
WHERE query_text IS NOT NULL
  AND TRIM(query_text) <> ''
GROUP BY query_text
ORDER BY zero_result_percentage DESC;

SELECT
    CASE
        WHEN sponsored = 1 THEN 'Sponsored'
        WHEN sponsored = 0 THEN 'Organic'
        ELSE 'Unknown'
    END AS result_type,
    COUNT(*) AS total_impressions,
    COUNT(DISTINCT query_id) AS distinct_queries,
    COUNT(DISTINCT product_id) AS distinct_products,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    ROUND(AVG(`rank`), 2) AS average_rank
FROM search_results_clean
GROUP BY
    CASE
        WHEN sponsored = 1 THEN 'Sponsored'
        WHEN sponsored = 0 THEN 'Organic'
        ELSE 'Unknown'
    END
ORDER BY total_impressions DESC;

SELECT
    MIN(`rank`) AS minimum_rank,
    MAX(`rank`) AS maximum_rank,
    ROUND(AVG(`rank`), 2) AS average_rank,
    SUM(
        CASE WHEN `rank` < 1 THEN 1 ELSE 0 END
    ) AS ranks_below_one,
    SUM(
        CASE WHEN `rank` > 100 THEN 1 ELSE 0 END
    ) AS ranks_above_100,
    SUM(
        CASE WHEN `rank` IS NULL THEN 1 ELSE 0 END
    ) AS missing_ranks
FROM search_results_clean;

SELECT
    `rank`,
    COUNT(*) AS record_count
FROM search_results_clean
GROUP BY `rank`
ORDER BY record_count DESC
LIMIT 15;

SELECT
    CASE
        WHEN `rank` = -999 THEN 'Placeholder (-999)'
        WHEN `rank` < 1 THEN 'Below 1'
        WHEN `rank` BETWEEN 1 AND 10 THEN '1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN '11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN '51-100'
        WHEN `rank` BETWEEN 101 AND 500 THEN '101-500'
        WHEN `rank` BETWEEN 501 AND 1000 THEN '501-1000'
        ELSE 'Other'
    END AS rank_range,
    COUNT(*) AS total_records
FROM search_results_clean
GROUP BY rank_range
ORDER BY MIN(`rank`);

SELECT
    COUNT(*) AS total_records,
    MIN(relevance_score) AS minimum_score,
    MAX(relevance_score) AS maximum_score,
    ROUND(AVG(relevance_score), 3) AS average_score,
    SUM(
        CASE
            WHEN relevance_score IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_scores,
    SUM(
        CASE
            WHEN relevance_score < 0
              OR relevance_score > 1
            THEN 1
            ELSE 0
        END
    ) AS scores_outside_0_to_1
FROM search_results_clean;

SELECT
    COUNT(*) AS total_click_records,
    MIN(dwell_seconds) AS minimum_dwell_seconds,
    MAX(dwell_seconds) AS maximum_dwell_seconds,
    ROUND(AVG(dwell_seconds), 2) AS average_dwell_seconds,
    SUM(
        CASE
            WHEN dwell_seconds IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_dwell_values,
    SUM(
        CASE
            WHEN dwell_seconds < 0 THEN 1
            ELSE 0
        END
    ) AS negative_dwell_values
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_click_records,
    SUM(
        CASE
            WHEN dwell_seconds = `rank` THEN 1
            ELSE 0
        END
    ) AS dwell_equals_rank,
    SUM(
        CASE
            WHEN dwell_seconds <> `rank` THEN 1
            ELSE 0
        END
    ) AS dwell_differs_from_rank
FROM search_clicks_clean
WHERE dwell_seconds IS NOT NULL
  AND `rank` IS NOT NULL;
  
  SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_status,
    quality_issue
FROM search_clicks_clean
WHERE dwell_seconds <> `rank`
ORDER BY click_id;

SELECT
    CASE
        WHEN `rank` = -999 THEN 'Placeholder Rank (-999)'
        WHEN `rank` < 1 THEN 'Invalid Rank'
        WHEN `rank` BETWEEN 1 AND 10 THEN 'Rank 1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN 'Rank 11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN 'Rank 51-100'
        ELSE 'Rank Above 100'
    END AS rank_category,
    COUNT(*) AS total_records
FROM search_clicks_clean
GROUP BY rank_category
ORDER BY total_records DESC;

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_status,
    quality_issue
FROM search_clicks_clean
WHERE `rank` < 1
  AND `rank` <> -999
ORDER BY `rank`, click_id;

SELECT
    quality_status,
    quality_issue,
    COUNT(*) AS total_records
FROM search_clicks_clean
GROUP BY
    quality_status,
    quality_issue
ORDER BY total_records DESC;

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN query_id IS NULL OR TRIM(query_id) = ''
        THEN 1 ELSE 0
    END) AS missing_query_id,

    SUM(CASE
        WHEN product_id IS NULL OR TRIM(product_id) = ''
        THEN 1 ELSE 0
    END) AS missing_product_id,

    SUM(CASE
        WHEN `rank` < 1
        THEN 1 ELSE 0
    END) AS invalid_rank,

    SUM(CASE
        WHEN `rank` > 100
        THEN 1 ELSE 0
    END) AS rank_above_100,

    SUM(CASE
        WHEN dwell_seconds = `rank`
        THEN 1 ELSE 0
    END) AS dwell_equals_rank

FROM search_clicks_clean;

SELECT
    click_id,
    COUNT(*) AS occurrences
FROM search_clicks_clean
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT
    COUNT(*) AS total_clicks,
    COUNT(DISTINCT click_id) AS distinct_click_ids,
    COUNT(DISTINCT query_id) AS distinct_query_ids,
    COUNT(DISTINCT product_id) AS distinct_product_ids
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_clicks,
    SUM(
        CASE
            WHEN EXISTS (
                SELECT 1
                FROM search_results_clean r
                WHERE r.query_id = c.query_id
            )
            THEN 1
            ELSE 0
        END
    ) AS clicks_with_matching_query,
    SUM(
        CASE
            WHEN c.query_id IS NOT NULL
                 AND TRIM(c.query_id) <> ''
                 AND NOT EXISTS (
                     SELECT 1
                     FROM search_results_clean r
                     WHERE r.query_id = c.query_id
                 )
            THEN 1
            ELSE 0
        END
    ) AS clicks_without_matching_query
FROM search_clicks_clean c;

SELECT
    COUNT(*) AS total_clicks,
    COUNT(r.query_id) AS clicks_with_matching_query
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) r
    ON c.query_id = r.query_id;
    
    SELECT
    COUNT(*) AS total_clicks,
    SUM(
        CASE
            WHEN r.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS matching_query_product_pairs
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) r
    ON c.query_id = r.query_id
   AND c.product_id = r.product_id;
   
   SELECT
    COUNT(*) AS total_clicks,
    SUM(
        CASE
            WHEN r.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS matching_query_product_pairs
FROM search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_staging
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) r
    ON c.query_id = r.query_id
   AND c.product_id = r.product_id;
   
   SELECT DATABASE() AS active_database;
   
   USE search_discovery;
   SHOW TABLES LIKE '%click%';
   
   SELECT
    COUNT(*) AS total_clicks,
    SUM(
        CASE
            WHEN r.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS matching_query_product_pairs
FROM search_discovery.search_clicks_staging c
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_discovery.search_results_staging
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) r
    ON c.query_id = r.query_id
   AND c.product_id = r.product_id;
   
   SELECT
    query_id,
    product_id,
    `rank`
FROM search_discovery.search_results_staging
WHERE query_id = 'Q018072'
LIMIT 10;

SELECT
    query_id,
    COUNT(*) AS total_result_rows,
    COUNT(DISTINCT product_id) AS distinct_products,
    SUM(
        CASE
            WHEN product_id = 'P01004' THEN 1
            ELSE 0
        END
    ) AS product_p01004_rows
FROM search_discovery.search_results_staging
WHERE query_id = 'Q018072'
GROUP BY query_id;

SELECT
    COUNT(*) AS total_clicks,
    SUM(
        CASE
            WHEN q.query_id IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS clicks_matching_query_table
FROM search_discovery.search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON c.query_id = q.query_id;
    
    SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM search_discovery.`search queries clean`
WHERE query_id = 'Q018072';

SELECT
    CASE
        WHEN q.query_id IS NOT NULL THEN 'Matched'
        ELSE 'Unmatched'
    END AS query_match_status,
    COUNT(*) AS total_clicks
FROM search_discovery.search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON c.query_id = q.query_id
GROUP BY query_match_status;

SELECT
    c.click_id,
    c.query_id,
    c.product_id,
    c.`rank`,
    c.dwell_seconds
FROM search_discovery.search_clicks_clean c
WHERE c.query_id IS NULL
   OR TRIM(c.query_id) = ''
   OR NOT EXISTS (
       SELECT 1
       FROM search_discovery.`search queries clean` q
       WHERE q.query_id = c.query_id
   )
LIMIT 10;

SELECT
    q.query_id,
    COUNT(*) AS query_table_rows
FROM `search queries clean` q
WHERE q.query_id IN (
    'Q031803',
    'Q007894',
    'Q013249',
    'Q033106',
    'Q005778',
    'Q036277',
    'Q025726',
    'Q037210',
    'Q007071',
    'Q037817'
)
GROUP BY q.query_id;

SELECT
    c.click_id,
    c.query_id,
    CASE
        WHEN q.query_id IS NOT NULL THEN 'Matched'
        ELSE 'Unmatched'
    END AS query_match_status
FROM search_discovery.search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.`search queries clean`
) q
    ON c.query_id = q.query_id
WHERE c.click_id IN (1, 5, 6, 7, 10, 11, 13, 14, 15, 18)
ORDER BY c.click_id;


SELECT
    c.click_id,
    c.query_id,
    CASE
        WHEN q.query_id IS NOT NULL THEN 'Matched'
        ELSE 'Unmatched'
    END AS query_match_status;
    
    SELECT
    c.click_id,
    c.query_id,
    CASE
        WHEN q.query_id IS NOT NULL THEN 'Matched'
        ELSE 'Unmatched'
    END AS query_match_status
FROM search_discovery.search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.`search queries clean`
) q
    ON c.query_id = q.query_id
WHERE c.click_id IN (1, 5, 6, 7, 10, 11, 13, 14, 15, 18)
ORDER BY c.click_id;

SELECT
    COUNT(*) AS total_query_records,
    COUNT(DISTINCT query_id) AS distinct_query_ids,
    SUM(
        CASE
            WHEN query_id IS NULL OR TRIM(query_id) = ''
            THEN 1
            ELSE 0
        END
    ) AS missing_query_ids
FROM search_discovery.`search queries clean`;

SELECT
    COUNT(*) AS repeated_query_id_groups,
    SUM(query_count - 1) AS extra_occurrences
FROM (
    SELECT
        query_id,
        COUNT(*) AS query_count
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
    GROUP BY query_id
    HAVING COUNT(*) > 1
) repeated_ids;

SELECT
    query_id,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT customer_id) AS distinct_customers,
    COUNT(DISTINCT query_text) AS distinct_query_texts
FROM search_discovery.`search queries clean`
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
GROUP BY query_id
HAVING COUNT(*) > 1
   AND (
       COUNT(DISTINCT customer_id) > 1
       OR COUNT(DISTINCT query_text) > 1
   )
ORDER BY total_rows DESC
LIMIT 10;

SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM search_discovery.`search queries clean`
WHERE query_id = 'Q037105'
ORDER BY timestamp;

SELECT
    COUNT(*) AS query_ids_with_multiple_customers
FROM (
    SELECT query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
    GROUP BY query_id
    HAVING COUNT(DISTINCT customer_id) > 1
) AS repeated_customer_ids;

SELECT
    COUNT(*) AS query_ids_with_multiple_timestamps
FROM (
    SELECT query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
    GROUP BY query_id
    HAVING COUNT(DISTINCT timestamp) > 1
) AS repeated_timestamp_ids;

SELECT
    COUNT(*) AS duplicate_record_groups,
    SUM(record_count - 1) AS extra_duplicate_rows
FROM (
    SELECT
        query_id,
        customer_id,
        query_text,
        result_count,
        timestamp,
        COUNT(*) AS record_count
    FROM search_discovery.`search queries clean`
    GROUP BY
        query_id,
        customer_id,
        query_text,
        result_count,
        timestamp
    HAVING COUNT(*) > 1
) AS duplicate_records;

SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN timestamp IS NULL OR TRIM(timestamp) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_timestamps,
    MIN(timestamp) AS earliest_timestamp,
    MAX(timestamp) AS latest_timestamp
FROM search_discovery.`search queries clean`;

SELECT
    SUM(
        CASE
            WHEN timestamp IS NOT NULL
                 AND TRIM(timestamp) <> ''
                 AND STR_TO_DATE(timestamp, '%Y-%m-%d %H:%i') IS NULL
            THEN 1 ELSE 0
        END
    ) AS invalid_timestamps,
    SUM(
        CASE
            WHEN STR_TO_DATE(timestamp, '%Y-%m-%d %H:%i') > NOW()
            THEN 1 ELSE 0
        END
    ) AS future_timestamps
FROM search_discovery.`search queries clean`;

SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN result_count IS NULL THEN 1
            ELSE 0
        END
    ) AS missing_result_counts,
    SUM(
        CASE
            WHEN result_count < 0 THEN 1
            ELSE 0
        END
    ) AS negative_result_counts,
    SUM(
        CASE
            WHEN result_count = 0 THEN 1
            ELSE 0
        END
    ) AS zero_result_counts,
    MIN(result_count) AS minimum_result_count,
    MAX(result_count) AS maximum_result_count
FROM search_discovery.`search queries clean`;


SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM search_discovery.`search queries clean`
WHERE result_count < 0
ORDER BY result_count;

SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN query_id IS NULL OR TRIM(query_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_query_ids,
    COUNT(DISTINCT NULLIF(TRIM(query_id), '')) AS distinct_query_ids
FROM search_discovery.`search queries clean`;

SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM search_discovery.`search queries clean`
WHERE query_id IS NULL
   OR TRIM(query_id) = '';
   
   SELECT COUNT(*) AS missing_query_id_rows
FROM search_discovery.`search queries clean`
WHERE query_id IS NULL
   OR TRIM(query_id) = '';
   
   SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN customer_id IS NULL
                 OR TRIM(customer_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_customer_ids,
    COUNT(DISTINCT NULLIF(TRIM(customer_id), '')) AS distinct_customer_ids
FROM search_discovery.`search queries clean`;

SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM search_discovery.`search queries clean`
WHERE customer_id IS NULL
   OR TRIM(customer_id) = '';
   
   SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN query_text IS NULL
                 OR TRIM(query_text) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_query_text,
    COUNT(DISTINCT NULLIF(TRIM(query_text), '')) AS distinct_query_categories
FROM search_discovery.`search queries clean`;

SELECT
    COUNT(*) AS total_query_records,
    SUM(
        CASE
            WHEN q.query_id IS NULL OR TRIM(q.query_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_query_ids,
    SUM(
        CASE
            WHEN q.query_id IS NOT NULL
                 AND TRIM(q.query_id) <> ''
                 AND r.query_id IS NULL
            THEN 1 ELSE 0
        END
    ) AS query_ids_without_results
FROM search_discovery.`search queries clean` q
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) r
    ON q.query_id = r.query_id;
    
    SELECT
    CASE
        WHEN q.result_count < 0 THEN 'Invalid negative count'
        WHEN q.result_count = 0 THEN 'Zero results'
        WHEN q.result_count > 0 THEN 'Positive result count'
        ELSE 'Missing result count'
    END AS result_count_status,
    COUNT(*) AS total_records,
    COUNT(DISTINCT q.query_id) AS distinct_query_ids
FROM search_discovery.`search queries clean` q
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) r
    ON q.query_id = r.query_id
WHERE q.query_id IS NOT NULL
  AND TRIM(q.query_id) <> ''
  AND r.query_id IS NULL
GROUP BY result_count_status
ORDER BY total_records DESC;

SELECT
    q.query_id,
    q.customer_id,
    q.query_text,
    q.result_count,
    q.timestamp
FROM search_discovery.`search queries clean` q
WHERE q.query_id IS NOT NULL
  AND TRIM(q.query_id) <> ''
  AND q.result_count > 0
  AND NOT EXISTS (
      SELECT 1
      FROM search_discovery.search_results_clean r
      WHERE r.query_id = q.query_id
  )
ORDER BY q.query_id
LIMIT 10;

SELECT
    q.query_id,
    COUNT(*) AS query_table_records,
    COUNT(DISTINCT q.customer_id) AS distinct_customers,
    COUNT(DISTINCT s.query_id) AS matching_staging_query_ids
FROM search_discovery.`search queries clean` q
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.search_results_staging
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) s
    ON q.query_id = s.query_id
WHERE q.query_id IN (
    'Q000010',
    'Q000013',
    'Q000054',
    'Q000072',
    'Q000094'
)
GROUP BY q.query_id
ORDER BY q.query_id;

SELECT
    q.query_id,
    COUNT(DISTINCT q.query_id) AS query_id_count,
    COUNT(DISTINCT b.query_id) AS matching_backup_query_ids
FROM search_discovery.`search queries clean` q
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_discovery.search_results_backup
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) b
    ON q.query_id = b.query_id
WHERE q.query_id IN (
    'Q000010',
    'Q000013',
    'Q000054',
    'Q000072',
    'Q000094'
)
GROUP BY q.query_id
ORDER BY q.query_id;

SELECT
    q.query_id,
    COUNT(DISTINCT c.click_id) AS matching_click_ids,
    COUNT(c.query_id) AS matching_click_records
FROM (
    SELECT DISTINCT query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IN (
        'Q000010',
        'Q000013',
        'Q000054',
        'Q000072',
        'Q000094'
    )
) q
LEFT JOIN search_discovery.search_clicks_clean c
    ON q.query_id = c.query_id
GROUP BY q.query_id
ORDER BY q.query_id;

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_status,
    quality_issue
FROM search_discovery.search_clicks_clean
WHERE query_id IN (
    'Q000054',
    'Q000072',
    'Q000094'
)
ORDER BY query_id;

SELECT
    c.query_id,
    c.product_id,
    COUNT(r.query_id) AS matching_query_product_pairs
FROM search_discovery.search_clicks_clean c
LEFT JOIN search_discovery.search_results_backup r
    ON c.query_id = r.query_id
   AND c.product_id = r.product_id
WHERE c.query_id IN (
    'Q000054',
    'Q000072',
    'Q000094'
)
GROUP BY
    c.query_id,
    c.product_id
ORDER BY c.query_id;

SELECT
    c.query_id,
    c.product_id,
    COUNT(p.product_id) AS matching_products
FROM search_discovery.search_clicks_clean c
LEFT JOIN search_discovery.`products clean` p
    ON c.product_id = p.product_id
WHERE c.query_id IN (
    'Q000054',
    'Q000072',
    'Q000094'
)
GROUP BY
    c.query_id,
    c.product_id
ORDER BY c.query_id;

DESCRIBE search_discovery.`products clean`;

SELECT
    c.query_id,
    c.product_id,
    COUNT(p.`ï»¿product_id`) AS matching_products
FROM search_discovery.search_clicks_clean c
LEFT JOIN search_discovery.`products clean` p
    ON c.product_id = p.`ï»¿product_id`
WHERE c.query_id IN (
    'Q000054',
    'Q000072',
    'Q000094'
)
GROUP BY
    c.query_id,
    c.product_id
ORDER BY c.query_id;
SELECT
    product_id,
    COUNT(*) AS total_click_records,
    COUNT(DISTINCT query_id) AS distinct_query_ids
FROM search_discovery.search_clicks_clean
WHERE product_id = 'P01029'
GROUP BY product_id;

SHOW TABLES FROM search_discovery;

SELECT
    'search_results_clean' AS table_name,
    COUNT(*) AS product_records
FROM search_discovery.search_results_clean
WHERE product_id = 'P01029'

UNION ALL

SELECT
    'search_results_staging',
    COUNT(*)
FROM search_discovery.search_results_staging
WHERE product_id = 'P01029'

UNION ALL

SELECT
    'search_results_backup',
    COUNT(*)
FROM search_discovery.search_results_backup
WHERE product_id = 'P01029';

SELECT
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_clean
WHERE product_id = 'P01029'
ORDER BY query_id
LIMIT 10;

SELECT
    COUNT(*) AS total_product_records,
    COUNT(DISTINCT NULLIF(TRIM(`ï»¿product_id`), ''))
        AS distinct_product_ids,
    SUM(
        CASE
            WHEN `ï»¿product_id` = 'P01029'
            THEN 1 ELSE 0
        END
    ) AS p01029_catalogue_matches
FROM search_discovery.`products clean`;

SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
                 OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_product_ids,
    COUNT(DISTINCT NULLIF(TRIM(`ï»¿product_id`), ''))
        AS distinct_product_ids,
    COUNT(*) -
    COUNT(DISTINCT NULLIF(TRIM(`ï»¿product_id`), ''))
        AS nonunique_or_missing_id_rows
FROM search_discovery.`products clean`;

SELECT
    `ï»¿product_id` AS product_id,
    COUNT(*) AS record_count
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY `ï»¿product_id`
HAVING COUNT(*) > 1
ORDER BY record_count DESC, product_id
LIMIT 15;

SELECT
    `ï»¿product_id` AS product_id,
    category,
    price,
    rating,
    stock
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` = 'P00061';

SELECT
    COUNT(*) AS product_ids_with_multiple_categories
FROM (
    SELECT
        `ï»¿product_id`
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY `ï»¿product_id`
    HAVING COUNT(DISTINCT category) > 1
) AS repeated_products;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        `ï»¿product_id` IS NULL
        OR TRIM(`ï»¿product_id`) = ''
    ) AS missing_product_ids,
    SUM(category IS NULL OR TRIM(category) = '') AS missing_categories,
    SUM(price IS NULL) AS missing_prices,
    SUM(rating IS NULL) AS missing_ratings,
    SUM(stock IS NULL) AS missing_stock
FROM search_discovery.`products clean`;

SELECT
    SUM(price < 0) AS negative_prices,
    SUM(rating < 0 OR rating > 1) AS ratings_outside_0_to_1,
    SUM(stock < 0) AS negative_stock,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    MIN(rating) AS minimum_rating,
    MAX(rating) AS maximum_rating,
    MIN(stock) AS minimum_stock,
    MAX(stock) AS maximum_stock
FROM search_discovery.`products clean`;


SELECT
    `ï»¿product_id` AS product_id,
    category,
    price,
    rating,
    stock
FROM search_discovery.`products clean`
WHERE price < 0
   OR rating < 0
   OR rating > 1
   OR stock < 0;
   
   SELECT
    COUNT(*) AS repeated_product_id_groups,
    SUM(row_count) AS rows_in_repeated_groups
FROM (
    SELECT
        `ï»¿product_id`,
        COUNT(*) AS row_count
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY `ï»¿product_id`
    HAVING COUNT(*) > 1
) AS duplicates;

SELECT
    `ï»¿product_id` AS product_id,
    COUNT(*) AS record_count,
    COUNT(DISTINCT price) AS different_prices,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY `ï»¿product_id`
HAVING COUNT(*) > 1
   AND COUNT(DISTINCT price) > 1
ORDER BY different_prices DESC, record_count DESC
LIMIT 15;


SELECT
    `ï»¿product_id` AS product_id,
    COUNT(*) AS record_count,
    COUNT(DISTINCT category) AS different_categories,
    GROUP_CONCAT(DISTINCT category ORDER BY category SEPARATOR ', ')
        AS categories
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY `ï»¿product_id`
HAVING COUNT(*) > 1
   AND COUNT(DISTINCT category) > 1
ORDER BY different_categories DESC, record_count DESC
LIMIT 15;

SELECT
    COALESCE(NULLIF(TRIM(category), ''), 'Missing Category')
        AS product_category,
    COUNT(*) AS total_rows,
    COUNT(DISTINCT `ï»¿product_id`) AS unique_product_ids,
    ROUND(AVG(CASE WHEN price >= 0 THEN price END), 2)
        AS average_valid_price
FROM search_discovery.`products clean`
GROUP BY COALESCE(NULLIF(TRIM(category), ''), 'Missing Category')
ORDER BY total_rows DESC;

SELECT
    CASE
        WHEN category_count = 1 THEN 'One Category'
        ELSE 'Multiple Categories'
    END AS category_status,
    COUNT(*) AS product_id_count
FROM (
    SELECT
        `ï»¿product_id`,
        COUNT(DISTINCT NULLIF(TRIM(category), '')) AS category_count
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY `ï»¿product_id`
) AS product_category_check
GROUP BY
    CASE
        WHEN category_count = 1 THEN 'One Category'
        ELSE 'Multiple Categories'
    END;
    
    SELECT
    CASE
        WHEN COUNT(DISTINCT NULLIF(TRIM(category), '')) = 0
            THEN 'No Valid Category'
        WHEN COUNT(DISTINCT NULLIF(TRIM(category), '')) = 1
            THEN 'One Valid Category'
        ELSE 'Multiple Valid Categories'
    END AS category_status,
    COUNT(*) AS product_id_count
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY `ï»¿product_id`
;
SELECT
    category_status,
    COUNT(*) AS product_id_count
FROM (
    SELECT
        `ï»¿product_id`,
        CASE
            WHEN COUNT(DISTINCT NULLIF(TRIM(category), '')) = 0
                THEN 'No Valid Category'
            WHEN COUNT(DISTINCT NULLIF(TRIM(category), '')) = 1
                THEN 'One Valid Category'
            ELSE 'Multiple Valid Categories'
        END AS category_status
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY `ï»¿product_id`
) AS product_category_check
GROUP BY category_status
ORDER BY category_status;

SELECT
    COUNT(DISTINCT sr.product_id) AS result_product_ids_missing_from_catalogue
FROM search_discovery.search_results_clean AS sr
LEFT JOIN search_discovery.`products clean` AS p
    ON sr.product_id = p.`ï»¿product_id`
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL;
  
  SELECT
    sr.product_id,
    COUNT(*) AS search_result_rows
FROM search_discovery.search_results_clean AS sr
LEFT JOIN search_discovery.`products clean` AS p
    ON sr.product_id = p.`ï»¿product_id`
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL
GROUP BY sr.product_id
ORDER BY search_result_rows DESC
LIMIT 10;

SELECT
    sr.product_id,
    COUNT(*) AS search_result_rows,
    COUNT(p.`ï»¿product_id`) AS normalized_catalogue_matches
FROM search_discovery.search_results_clean AS sr
LEFT JOIN search_discovery.`products clean` AS p
    ON UPPER(TRIM(sr.product_id)) =
       UPPER(TRIM(p.`ï»¿product_id`))
WHERE sr.product_id IN (
    'P01593', 'P00384', 'P01957', 'P00117', 'P00995',
    'P00483', 'P01996', 'P00706', 'P01744', 'P01733'
)
GROUP BY sr.product_id
ORDER BY search_result_rows DESC;

SELECT
    COUNT(*) AS total_distinct_result_product_ids,
    SUM(
        CASE WHEN catalogue_match = 'Matched'
             THEN 1 ELSE 0 END
    ) AS matched_product_ids,
    SUM(
        CASE WHEN catalogue_match = 'Missing'
             THEN 1 ELSE 0 END
    ) AS missing_product_ids,
    ROUND(
        100.0 * SUM(
            CASE WHEN catalogue_match = 'Matched'
                 THEN 1 ELSE 0 END
        ) / COUNT(*),
        2
    ) AS match_percentage
FROM (
    SELECT
        sr.product_id,
        CASE
            WHEN MAX(p.`ï»¿product_id`) IS NOT NULL
                THEN 'Matched'
            ELSE 'Missing'
        END AS catalogue_match
    FROM search_discovery.search_results_clean AS sr
    LEFT JOIN search_discovery.`products clean` AS p
        ON UPPER(TRIM(sr.product_id)) =
           UPPER(TRIM(p.`ï»¿product_id`))
    WHERE sr.product_id IS NOT NULL
      AND TRIM(sr.product_id) <> ''
    GROUP BY sr.product_id
) AS product_match_summary;

SELECT
    COUNT(*) AS distinct_nonblank_product_ids,
    SUM(CASE WHEN id_count = 1 THEN 1 ELSE 0 END)
        AS ids_appearing_once,
    SUM(CASE WHEN id_count > 1 THEN 1 ELSE 0 END)
        AS duplicated_product_ids,
    SUM(CASE WHEN id_count > 1 THEN id_count - 1 ELSE 0 END)
        AS extra_duplicate_rows
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id,
        COUNT(*) AS id_count
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY TRIM(`ï»¿product_id`)
) AS catalogue_id_counts;

SELECT
    COUNT(*) AS exact_duplicate_groups,
    COALESCE(SUM(row_count - 1), 0) AS extra_exact_duplicate_rows
FROM (
    SELECT
        `ï»¿product_id`,
        category,
        price,
        rating,
        stock,
        COUNT(*) AS row_count
    FROM search_discovery.`products clean`
    GROUP BY
        `ï»¿product_id`,
        category,
        price,
        rating,
        stock
    HAVING COUNT(*) > 1
) AS exact_duplicates;

SELECT
    COUNT(*) AS product_ids_with_multiple_prices
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND price IS NOT NULL
      AND price <> -999
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT price) > 1
) AS price_conflicts;

SELECT
    COUNT(*) AS product_ids_with_multiple_ratings
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND rating IS NOT NULL
      AND rating BETWEEN 0 AND 1
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT rating) > 1
) AS rating_conflicts;

SELECT
    COUNT(*) AS product_ids_with_multiple_stock_values
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND stock IS NOT NULL
      AND stock >= 0
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT stock) > 1
) AS stock_conflicts;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM search_discovery.`products clean`
WHERE TRIM(`ï»¿product_id`) = 'P00061'
ORDER BY category;

SELECT
    COUNT(*) AS product_ids_with_multiple_categories
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND category IS NOT NULL
      AND TRIM(category) <> ''
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT TRIM(category)) > 1
) AS category_conflicts;

SELECT
    COUNT(*) AS total_rows,

    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_product_ids,

    SUM(
        CASE
            WHEN category IS NULL
              OR TRIM(category) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_categories,

    SUM(
        CASE
            WHEN price IS NULL OR price < 0
            THEN 1 ELSE 0
        END
    ) AS invalid_prices,

    SUM(
        CASE
            WHEN rating IS NULL OR rating < 0 OR rating > 1
            THEN 1 ELSE 0
        END
    ) AS invalid_ratings,

    SUM(
        CASE
            WHEN stock IS NULL OR stock < 0
            THEN 1 ELSE 0
        END
    ) AS invalid_stock_values

FROM search_discovery.`products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock,
    CASE
        WHEN price IS NULL OR price < 0
            THEN 'Invalid Price'
        WHEN rating IS NULL OR rating < 0 OR rating > 1
            THEN 'Invalid Rating'
    END AS issue
FROM search_discovery.`products clean`
WHERE price IS NULL
   OR price < 0
   OR rating IS NULL
   OR rating < 0
   OR rating > 1
ORDER BY issue, `ï»¿product_id`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock,
    CASE
        WHEN (
            `ï»¿product_id` IS NULL
            OR TRIM(`ï»¿product_id`) = ''
        )
        AND (
            category IS NULL
            OR TRIM(category) = ''
        )
            THEN 'Missing Product ID and Category'
        WHEN `ï»¿product_id` IS NULL
          OR TRIM(`ï»¿product_id`) = ''
            THEN 'Missing Product ID'
        ELSE 'Missing Category'
    END AS issue
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` IS NULL
   OR TRIM(`ï»¿product_id`) = ''
   OR category IS NULL
   OR TRIM(category) = ''
ORDER BY issue;

SELECT
    COUNT(*) AS total_search_result_rows,
    SUM(
        CASE
            WHEN product_id IS NULL OR TRIM(product_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_product_id_rows,
    COUNT(DISTINCT CASE
        WHEN product_id IS NOT NULL AND TRIM(product_id) <> ''
        THEN product_id
    END) AS distinct_nonblank_product_ids
FROM search_discovery.search_results_clean;

SELECT
    COUNT(*) AS total_search_result_rows,
    SUM(
        CASE
            WHEN query_id IS NULL OR TRIM(query_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_query_id_rows,
    COUNT(DISTINCT CASE
        WHEN query_id IS NOT NULL AND TRIM(query_id) <> ''
        THEN query_id
    END) AS distinct_nonblank_query_ids
FROM search_discovery.search_results_clean;

SELECT
    COUNT(DISTINCT sr.query_id) AS distinct_result_query_ids,

    COUNT(DISTINCT CASE
        WHEN sq.query_id IS NOT NULL
        THEN sr.query_id
    END) AS matched_query_ids,

    COUNT(DISTINCT CASE
        WHEN sq.query_id IS NULL
        THEN sr.query_id
    END) AS unmatched_query_ids

FROM search_discovery.search_results_clean AS sr
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS sq
    ON TRIM(sr.query_id) = sq.query_id
WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> '';
  
  SELECT
    sr.query_id,
    COUNT(*) AS search_result_rows
FROM search_discovery.search_results_clean AS sr
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS sq
    ON TRIM(sr.query_id) = sq.query_id
WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> ''
  AND sq.query_id IS NULL
GROUP BY sr.query_id
ORDER BY search_result_rows DESC, sr.query_id
LIMIT 10;

SELECT
    ids.query_id,
    CASE WHEN MAX(s.query_id) IS NOT NULL
         THEN 'Found' ELSE 'Not Found' END AS staging_status,
    CASE WHEN MAX(b.query_id) IS NOT NULL
         THEN 'Found' ELSE 'Not Found' END AS backup_status
FROM (
    SELECT 'Q029022' AS query_id
    UNION ALL SELECT 'Q005639'
    UNION ALL SELECT 'Q006563'
    UNION ALL SELECT 'Q012086'
    UNION ALL SELECT 'Q012621'
    UNION ALL SELECT 'Q016990'
    UNION ALL SELECT 'Q021433'
    UNION ALL SELECT 'Q021793'
    UNION ALL SELECT 'Q025260'
    UNION ALL SELECT 'Q033042'
) AS ids
LEFT JOIN search_discovery.search_results_staging AS s
    ON ids.query_id = s.query_id
LEFT JOIN search_discovery.search_results_backup AS b
    ON ids.query_id = b.query_id
GROUP BY ids.query_id
ORDER BY ids.query_id;

SELECT
    ids.query_id,
    COUNT(sq.query_id) AS query_table_rows
FROM (
    SELECT 'Q029022' AS query_id
    UNION ALL SELECT 'Q005639'
    UNION ALL SELECT 'Q006563'
    UNION ALL SELECT 'Q012086'
    UNION ALL SELECT 'Q012621'
    UNION ALL SELECT 'Q016990'
    UNION ALL SELECT 'Q021433'
    UNION ALL SELECT 'Q021793'
    UNION ALL SELECT 'Q025260'
    UNION ALL SELECT 'Q033042'
) AS ids
LEFT JOIN search_discovery.`search queries clean` AS sq
    ON ids.query_id = TRIM(sq.query_id)
GROUP BY ids.query_id
ORDER BY ids.query_id;

SELECT
    COUNT(*) AS unmatched_search_result_rows,
    COUNT(DISTINCT sr.query_id) AS unmatched_distinct_query_ids
FROM search_discovery.search_results_clean AS sr
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS sq
    ON TRIM(sr.query_id) = sq.query_id
WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> ''
  AND sq.query_id IS NULL;
  
  SELECT
    CASE
        WHEN `rank` = -999 THEN 'Placeholder Rank (-999)'
        WHEN `rank` < 1 THEN 'Invalid Rank (below 1)'
        WHEN `rank` BETWEEN 1 AND 10 THEN 'Rank 1-10'
        WHEN `rank` BETWEEN 11 AND 100 THEN 'Rank 11-100'
        WHEN `rank` BETWEEN 101 AND 500 THEN 'Rank 101-500'
        ELSE 'Rank 501+'
    END AS rank_group,
    COUNT(*) AS unmatched_result_rows,
    COUNT(DISTINCT query_id) AS unmatched_query_ids
FROM search_discovery.search_results_clean AS sr
WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> ''
  AND NOT EXISTS (
      SELECT 1
      FROM search_discovery.`search queries clean` AS sq
      WHERE TRIM(sq.query_id) = TRIM(sr.query_id)
  )
GROUP BY rank_group
ORDER BY unmatched_result_rows DESC;
SELECT
    COUNT(DISTINCT sr.query_id) AS unmatched_result_query_ids,

    COUNT(DISTINCT CASE
        WHEN sc.query_id IS NOT NULL THEN sr.query_id
    END) AS also_found_in_clicks,

    COUNT(DISTINCT CASE
        WHEN sc.query_id IS NULL THEN sr.query_id
    END) AS not_found_in_clicks

FROM search_discovery.search_results_clean AS sr

LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS sq
    ON TRIM(sr.query_id) = sq.query_id

LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.search_clicks_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS sc
    ON TRIM(sr.query_id) = sc.query_id

WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> ''
  AND sq.query_id IS NULL;
  
  SELECT
    COUNT(*) AS unmatched_click_rows,
    COUNT(DISTINCT sc.query_id) AS unmatched_click_query_ids
FROM search_discovery.search_clicks_clean AS sc
WHERE sc.query_id IS NOT NULL
  AND TRIM(sc.query_id) <> ''
  AND NOT EXISTS (
      SELECT 1
      FROM search_discovery.`search queries clean` AS sq
      WHERE TRIM(sq.query_id) = TRIM(sc.query_id)
  );
  
  SELECT
    COUNT(DISTINCT TRIM(sc.query_id)) AS distinct_click_query_ids,

    COUNT(DISTINCT CASE
        WHEN sq.query_id IS NOT NULL THEN TRIM(sc.query_id)
    END) AS matched_query_ids,

    COUNT(DISTINCT CASE
        WHEN sq.query_id IS NULL THEN TRIM(sc.query_id)
    END) AS unmatched_query_ids,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN sq.query_id IS NOT NULL THEN TRIM(sc.query_id)
        END)
        / COUNT(DISTINCT TRIM(sc.query_id)),
        2
    ) AS query_id_match_percentage

FROM search_discovery.search_clicks_clean AS sc

LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS sq
    ON TRIM(sc.query_id) = sq.query_id

WHERE sc.query_id IS NOT NULL
  AND TRIM(sc.query_id) <> '';
  
  SELECT
    COUNT(DISTINCT TRIM(sc.product_id))
        AS distinct_click_product_ids,

    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NOT NULL
        THEN TRIM(sc.product_id)
    END) AS matched_product_ids,

    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN TRIM(sc.product_id)
    END) AS unmatched_product_ids,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN p.`ï»¿product_id` IS NOT NULL
            THEN TRIM(sc.product_id)
        END)
        / COUNT(DISTINCT TRIM(sc.product_id)),
        2
    ) AS product_id_match_percentage

FROM search_discovery.search_clicks_clean AS sc
LEFT JOIN search_discovery.`products clean` AS p
    ON TRIM(sc.product_id) = TRIM(p.`ï»¿product_id`)
WHERE sc.product_id IS NOT NULL
  AND TRIM(sc.product_id) <> '';
  
  SELECT
    COUNT(DISTINCT TRIM(sc.product_id))
        AS unmatched_click_product_ids,

    COUNT(DISTINCT CASE
        WHEN sr.product_id IS NOT NULL
        THEN TRIM(sc.product_id)
    END) AS also_found_in_search_results,

    COUNT(DISTINCT CASE
        WHEN sr.product_id IS NULL
        THEN TRIM(sc.product_id)
    END) AS not_found_in_search_results

FROM search_discovery.search_clicks_clean AS sc

LEFT JOIN (
    SELECT DISTINCT TRIM(product_id) AS product_id
    FROM search_discovery.search_results_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) AS sr
    ON TRIM(sc.product_id) = sr.product_id

LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) AS p
    ON TRIM(sc.product_id) = p.product_id

WHERE sc.product_id IS NOT NULL
  AND TRIM(sc.product_id) <> ''
  AND p.product_id IS NULL;
  
  SELECT
    COUNT(*) AS repeated_product_id_groups,
    SUM(product_count) AS rows_with_repeated_ids,
    SUM(product_count - 1) AS extra_duplicate_id_rows
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id,
        COUNT(*) AS product_count
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(*) > 1
) AS repeated_products;

SELECT
    COUNT(*) AS product_ids_with_multiple_categories
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND category IS NOT NULL
      AND TRIM(category) <> ''
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT TRIM(category)) > 1
) AS category_conflicts;

SELECT
    COUNT(*) AS product_ids_with_multiple_prices
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND price IS NOT NULL
      AND price <> -999
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT price) > 1
) AS price_conflicts;

SELECT
    COUNT(*) AS product_ids_with_multiple_ratings
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND rating IS NOT NULL
      AND rating BETWEEN 0 AND 1
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT rating) > 1
) AS rating_conflicts;

SELECT
    COUNT(*) AS product_ids_with_multiple_stock_values
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND stock IS NOT NULL
      AND stock >= 0
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(DISTINCT stock) > 1
) AS stock_conflicts;

SELECT
    COUNT(*) AS total_rows,

    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_product_ids,

    SUM(
        CASE
            WHEN category IS NULL
              OR TRIM(category) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_categories,

    SUM(
        CASE
            WHEN price IS NULL OR price = -999 OR price < 0
            THEN 1 ELSE 0
        END
    ) AS invalid_prices,

    SUM(
        CASE
            WHEN rating IS NULL
              OR rating = -999
              OR rating < 0
              OR rating > 1
            THEN 1 ELSE 0
        END
    ) AS invalid_ratings,

    SUM(
        CASE
            WHEN stock IS NULL OR stock < 0
            THEN 1 ELSE 0
        END
    ) AS invalid_stock

FROM search_discovery.`products clean`;

SELECT
    SUM(CASE
        WHEN (`ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = '')
         AND (category IS NULL OR TRIM(category) = '')
        THEN 1 ELSE 0
    END) AS missing_id_and_category,

    SUM(CASE
        WHEN price IS NULL OR price < 0 OR price = -999
        THEN 1 ELSE 0
    END) AS invalid_price_rows,

    SUM(CASE
        WHEN rating IS NULL
          OR rating < 0
          OR rating > 1
          OR rating = -999
        THEN 1 ELSE 0
    END) AS invalid_rating_rows,

    SUM(CASE
        WHEN (price IS NULL OR price < 0 OR price = -999)
         AND (rating IS NULL OR rating < 0
              OR rating > 1 OR rating = -999)
        THEN 1 ELSE 0
    END) AS rows_with_both_invalid_price_and_rating

FROM search_discovery.`products clean`;

SELECT
    'Invalid Price' AS issue_type,
    COUNT(*) AS total_rows,
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NOT NULL
             AND TRIM(`ï»¿product_id`) <> ''
            THEN 1 ELSE 0
        END
    ) AS rows_with_product_id,
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS rows_without_product_id
FROM search_discovery.`products clean`
WHERE price IS NULL OR price < 0 OR price = -999

UNION ALL

SELECT
    'Invalid Rating',
    COUNT(*),
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NOT NULL
             AND TRIM(`ï»¿product_id`) <> ''
            THEN 1 ELSE 0
        END
    ),
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    )
FROM search_discovery.`products clean`
WHERE rating IS NULL
   OR rating < 0
   OR rating > 1
   OR rating = -999;
   
   SELECT
    TRIM(`ï»¿product_id`) AS product_id,
    category,
    price,
    rating,
    stock,
    CASE
        WHEN price IS NULL OR price < 0
            THEN 'Invalid Price'
        WHEN rating IS NULL OR rating < 0 OR rating > 1
            THEN 'Invalid Rating'
    END AS issue_type
FROM search_discovery.`products clean`
WHERE price IS NULL
   OR price < 0
   OR rating IS NULL
   OR rating < 0
   OR rating > 1
ORDER BY issue_type, product_id;

SELECT
    COUNT(*) AS total_catalogue_rows,

    COUNT(DISTINCT NULLIF(TRIM(`ï»¿product_id`), ''))
        AS unique_nonblank_product_ids,

    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS rows_with_missing_product_id,

    COUNT(*) -
    COUNT(DISTINCT NULLIF(TRIM(`ï»¿product_id`), '')) -
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL
              OR TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS extra_rows_from_repeated_ids

FROM search_discovery.`products clean`;

SELECT
    COUNT(DISTINCT `ï»¿product_id`)
        AS distinct_raw_product_ids,

    COUNT(DISTINCT NULLIF(TRIM(`ï»¿product_id`), ''))
        AS distinct_trimmed_product_ids,

    COUNT(DISTINCT CASE
        WHEN `ï»¿product_id` IS NOT NULL
         AND `ï»¿product_id` <> TRIM(`ï»¿product_id`)
        THEN `ï»¿product_id`
    END) AS product_ids_with_extra_spaces

FROM search_discovery.`products clean`;

SELECT
    SUM(
        CASE
            WHEN `ï»¿product_id` IS NULL THEN 1
            ELSE 0
        END
    ) AS null_product_ids,

    SUM(
        CASE
            WHEN `ï»¿product_id` IS NOT NULL
             AND TRIM(`ï»¿product_id`) = ''
            THEN 1 ELSE 0
        END
    ) AS blank_or_whitespace_product_ids,

    SUM(
        CASE
            WHEN `ï»¿product_id` = ''
            THEN 1 ELSE 0
        END
    ) AS empty_string_product_ids

FROM search_discovery.`products clean`;

SELECT
    COUNT(*) AS total_rows,
    SUM(
        CASE
            WHEN BINARY `ï»¿product_id`
                 <> BINARY UPPER(TRIM(`ï»¿product_id`))
            THEN 1 ELSE 0
        END
    ) AS ids_with_case_or_spacing_differences
FROM search_discovery.`products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> '';
  
  SELECT
    COUNT(*) AS exact_duplicate_groups,
    COALESCE(SUM(record_count - 1), 0)
        AS extra_exact_duplicate_rows
FROM (
    SELECT
        `ï»¿product_id`,
        category,
        price,
        rating,
        stock,
        COUNT(*) AS record_count
    FROM search_discovery.`products clean`
    GROUP BY
        `ï»¿product_id`,
        category,
        price,
        rating,
        stock
    HAVING COUNT(*) > 1
) AS duplicates;

SELECT
    COUNT(DISTINCT TRIM(sr.product_id))
        AS distinct_search_result_product_ids,

    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NOT NULL
        THEN TRIM(sr.product_id)
    END) AS matched_catalogue_ids,

    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN TRIM(sr.product_id)
    END) AS unmatched_catalogue_ids,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN p.`ï»¿product_id` IS NOT NULL
            THEN TRIM(sr.product_id)
        END)
        / COUNT(DISTINCT TRIM(sr.product_id)),
        2
    ) AS catalogue_match_percentage

FROM search_discovery.search_results_clean AS sr

LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) AS p
    ON TRIM(sr.product_id) = p.product_id

WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> '';
  
  SELECT
    COUNT(DISTINCT TRIM(sr.product_id))
        AS distinct_search_result_product_ids,

    COUNT(DISTINCT CASE
        WHEN p.product_id IS NOT NULL
        THEN TRIM(sr.product_id)
    END) AS matched_catalogue_ids,

    COUNT(DISTINCT CASE
        WHEN p.product_id IS NULL
        THEN TRIM(sr.product_id)
    END) AS unmatched_catalogue_ids,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN p.product_id IS NOT NULL
            THEN TRIM(sr.product_id)
        END)
        / NULLIF(COUNT(DISTINCT TRIM(sr.product_id)), 0),
        2
    ) AS catalogue_match_percentage

FROM search_discovery.search_results_clean AS sr

LEFT JOIN (
    SELECT DISTINCT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) AS p
    ON TRIM(sr.product_id) = p.product_id

WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> '';
  
  SELECT
    TRIM(sr.product_id) AS unmatched_product_id,
    COUNT(*) AS search_result_rows
FROM search_discovery.search_results_clean AS sr
LEFT JOIN (
    SELECT DISTINCT
        TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) AS p
    ON TRIM(sr.product_id) = p.product_id
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> ''
  AND p.product_id IS NULL
GROUP BY TRIM(sr.product_id)
ORDER BY search_result_rows DESC, unmatched_product_id
LIMIT 10;

SELECT
    check_ids.product_id,
    COUNT(p.`ï»¿product_id`) AS catalogue_matches,
    CASE
        WHEN COUNT(p.`ï»¿product_id`) = 0
            THEN 'Missing from Catalogue'
        ELSE 'Found in Catalogue'
    END AS validation_status
FROM (
    SELECT 'P00384' AS product_id
    UNION ALL SELECT 'P01593'
    UNION ALL SELECT 'P01957'
    UNION ALL SELECT 'P00117'
    UNION ALL SELECT 'P00995'
    UNION ALL SELECT 'P00483'
    UNION ALL SELECT 'P00706'
    UNION ALL SELECT 'P01996'
    UNION ALL SELECT 'P01744'
    UNION ALL SELECT 'P00076'
) AS check_ids
LEFT JOIN search_discovery.`products clean` AS p
    ON TRIM(p.`ï»¿product_id`) = check_ids.product_id
GROUP BY check_ids.product_id
ORDER BY check_ids.product_id;

SELECT
    check_ids.product_id,
    COUNT(sc.click_id) AS click_records
FROM (
    SELECT 'P00384' AS product_id
    UNION ALL SELECT 'P01593'
    UNION ALL SELECT 'P01957'
    UNION ALL SELECT 'P00117'
    UNION ALL SELECT 'P00995'
    UNION ALL SELECT 'P00483'
    UNION ALL SELECT 'P00706'
    UNION ALL SELECT 'P01996'
    UNION ALL SELECT 'P01744'
    UNION ALL SELECT 'P00076'
) AS check_ids
LEFT JOIN search_discovery.search_clicks_clean AS sc
    ON TRIM(sc.product_id) = check_ids.product_id
GROUP BY check_ids.product_id
ORDER BY click_records DESC, check_ids.product_id;

SELECT
    TRIM(product_id) AS product_id,
    COUNT(*) AS total_clicks,
    SUM(CASE WHEN `rank` BETWEEN 1 AND 100 THEN 1 ELSE 0 END)
        AS ranks_1_to_100,
    SUM(CASE WHEN `rank` > 100 THEN 1 ELSE 0 END)
        AS ranks_above_100,
    SUM(CASE WHEN `rank` < 1 THEN 1 ELSE 0 END)
        AS invalid_ranks
FROM search_discovery.search_clicks_clean
WHERE TRIM(product_id) IN (
    'P00384', 'P01593', 'P01957', 'P00117', 'P00995',
    'P00483', 'P00706', 'P01996', 'P01744', 'P00076'
)
GROUP BY TRIM(product_id)
ORDER BY total_clicks DESC, product_id;

SELECT
    TRIM(product_id) AS product_id,
    COUNT(*) AS total_clicks,
    SUM(CASE
        WHEN dwell_seconds BETWEEN 1 AND 600
        THEN 1 ELSE 0
    END) AS dwell_1_to_600_seconds,
    SUM(CASE
        WHEN dwell_seconds = 0
        THEN 1 ELSE 0
    END) AS zero_dwell_seconds,
    SUM(CASE
        WHEN dwell_seconds > 600
        THEN 1 ELSE 0
    END) AS dwell_above_600_seconds,
    SUM(CASE
        WHEN dwell_seconds < 0
        THEN 1 ELSE 0
    END) AS negative_dwell_seconds
FROM search_discovery.search_clicks_clean
WHERE TRIM(product_id) IN (
    'P00384', 'P01593', 'P01957', 'P00117', 'P00995',
    'P00483', 'P00706', 'P01996', 'P01744', 'P00076'
)
GROUP BY TRIM(product_id)
ORDER BY total_clicks DESC, product_id;
SELECT
    COUNT(*) AS total_clicks,

    SUM(CASE
        WHEN `rank` = dwell_seconds
        THEN 1 ELSE 0
    END) AS rank_equals_dwell,

    SUM(CASE
        WHEN `rank` <> dwell_seconds
        THEN 1 ELSE 0
    END) AS rank_differs_from_dwell

FROM search_discovery.search_clicks_clean
WHERE TRIM(product_id) IN (
    'P00384', 'P01593', 'P01957', 'P00117', 'P00995',
    'P00483', 'P00706', 'P01996', 'P01744', 'P00076'
);

SELECT
    COUNT(*) AS total_click_records,

    COUNT(DISTINCT TRIM(product_id))
        AS distinct_missing_catalogue_products,

    SUM(CASE
        WHEN `rank` = dwell_seconds
        THEN 1 ELSE 0
    END) AS rank_dwell_matches,

    SUM(CASE
        WHEN `rank` > 100
        THEN 1 ELSE 0
    END) AS ranks_above_100,

    SUM(CASE
        WHEN dwell_seconds > 600
        THEN 1 ELSE 0
    END) AS dwell_above_600_seconds

FROM search_discovery.search_clicks_clean
WHERE TRIM(product_id) IN (
    'P00384', 'P01593', 'P01957', 'P00117', 'P00995',
    'P00483', 'P00706', 'P01996', 'P01744', 'P00076'
);
SELECT
    CASE
        WHEN `rank` = -999 THEN 'Placeholder Rank (-999)'
        WHEN `rank` < 1 THEN 'Invalid Rank (Below 1)'
        WHEN `rank` BETWEEN 1 AND 10 THEN 'Rank 1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN 'Rank 11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN 'Rank 51-100'
        WHEN `rank` BETWEEN 101 AND 500 THEN 'Rank 101-500'
        WHEN `rank` BETWEEN 501 AND 1000 THEN 'Rank 501-1000'
        ELSE 'Rank Above 1000'
    END AS rank_category,
    COUNT(*) AS total_rows
FROM search_discovery.search_results_clean
GROUP BY rank_category
ORDER BY
    CASE rank_category
        WHEN 'Placeholder Rank (-999)' THEN 1
        WHEN 'Invalid Rank (Below 1)' THEN 2
        WHEN 'Rank 1-10' THEN 3
        WHEN 'Rank 11-50' THEN 4
        WHEN 'Rank 51-100' THEN 5
        WHEN 'Rank 101-500' THEN 6
        WHEN 'Rank 501-1000' THEN 7
        ELSE 8
    END;
    
    SELECT
    COUNT(*) AS total_rows,
    MIN(`rank`) AS minimum_rank,
    MAX(`rank`) AS maximum_rank,
    SUM(CASE WHEN `rank` < 1 THEN 1 ELSE 0 END)
        AS ranks_below_1,
    SUM(CASE WHEN `rank` > 1000 THEN 1 ELSE 0 END)
        AS ranks_above_1000,
    ROUND(AVG(`rank`), 2) AS average_rank
FROM search_discovery.search_results_clean;

SELECT
    COUNT(*) AS total_rows,

    SUM(CASE
        WHEN relevance_score IS NULL
        THEN 1 ELSE 0
    END) AS missing_relevance_scores,

    MIN(relevance_score) AS minimum_relevance_score,

    MAX(relevance_score) AS maximum_relevance_score,

    ROUND(AVG(relevance_score), 3)
        AS average_relevance_score,

    SUM(CASE
        WHEN relevance_score < 0 OR relevance_score > 1
        THEN 1 ELSE 0
    END) AS scores_outside_0_to_1

FROM search_discovery.search_results_clean;

SELECT
    COUNT(*) AS total_rows,

    SUM(CASE
        WHEN query_id IS NULL OR TRIM(query_id) = ''
        THEN 1 ELSE 0
    END) AS missing_query_ids,

    SUM(CASE
        WHEN product_id IS NULL OR TRIM(product_id) = ''
        THEN 1 ELSE 0
    END) AS missing_product_ids,

    SUM(CASE
        WHEN (query_id IS NULL OR TRIM(query_id) = '')
         AND (product_id IS NULL OR TRIM(product_id) = '')
        THEN 1 ELSE 0
    END) AS rows_missing_both_ids

FROM search_discovery.search_results_clean;

SELECT
    COUNT(DISTINCT TRIM(sr.query_id))
        AS distinct_search_result_query_ids,

    COUNT(DISTINCT CASE
        WHEN q.query_id IS NOT NULL
        THEN TRIM(sr.query_id)
    END) AS matched_query_ids,

    COUNT(DISTINCT CASE
        WHEN q.query_id IS NULL
        THEN TRIM(sr.query_id)
    END) AS unmatched_query_ids,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN q.query_id IS NOT NULL
            THEN TRIM(sr.query_id)
        END)
        / NULLIF(COUNT(DISTINCT TRIM(sr.query_id)), 0),
        2
    ) AS query_id_match_percentage

FROM search_discovery.search_results_clean AS sr

LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS q
    ON TRIM(sr.query_id) = q.query_id

WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> '';
  
  SELECT DISTINCT
    TRIM(sr.query_id) AS unmatched_query_id
FROM search_discovery.search_results_clean AS sr
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM search_discovery.`search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) AS q
    ON TRIM(sr.query_id) = q.query_id
WHERE sr.query_id IS NOT NULL
  AND TRIM(sr.query_id) <> ''
  AND q.query_id IS NULL
ORDER BY unmatched_query_id
LIMIT 10;

SELECT
    query_id,
    customer_id,
    query_text,
    result_count,
    timestamp
FROM search_discovery.`search queries clean`
WHERE TRIM(query_id) IN (
    'Q000001', 'Q000003', 'Q000011', 'Q000012',
    'Q000016', 'Q000025', 'Q000033', 'Q000037',
    'Q000042', 'Q000044'
);

SELECT DISTINCT
    TRIM(query_id) AS query_id
FROM search_discovery.search_results_backup
WHERE TRIM(query_id) IN (
    'Q000001', 'Q000003', 'Q000011', 'Q000012',
    'Q000016', 'Q000025', 'Q000033', 'Q000037',
    'Q000042', 'Q000044'
)
ORDER BY query_id;

SELECT
    result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_backup
WHERE TRIM(query_id) = 'Q000033';

DESCRIBE search_discovery.search_results_backup;

SELECT
    `ï»¿result_id` AS result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_backup
WHERE TRIM(query_id) = 'Q000033';

SELECT
    'backup' AS source_table,
    COUNT(*) AS total_rows
FROM search_discovery.search_results_backup
WHERE TRIM(query_id) = 'Q000033'

UNION ALL

SELECT
    'clean' AS source_table,
    COUNT(*) AS total_rows
FROM search_discovery.search_results_clean
WHERE TRIM(query_id) = 'Q000033';

SELECT
    'backup' AS source_table,
    `ï»¿result_id` AS result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_backup
WHERE TRIM(query_id) = 'Q000033'

UNION ALL

SELECT
    'clean' AS source_table,
    `ï»¿result_id` AS result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_clean
WHERE TRIM(query_id) = 'Q000033'

ORDER BY source_table, result_id;

DESCRIBE search_discovery.search_results_clean;

SELECT
    'backup' AS source_table,
    `ï»¿result_id` AS result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_backup
WHERE TRIM(query_id) = 'Q000033'

UNION ALL

SELECT
    'clean' AS source_table,
    result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_clean
WHERE TRIM(query_id) = 'Q000033'

ORDER BY source_table, result_id;

SELECT
    (SELECT COUNT(*)
     FROM search_discovery.search_results_backup) AS backup_rows,

    (SELECT COUNT(*)
     FROM search_discovery.search_results_clean) AS clean_rows,

    (SELECT COUNT(*)
     FROM search_discovery.search_results_clean c
     LEFT JOIN search_discovery.search_results_backup b
       ON c.result_id = b.`ï»¿result_id`
     WHERE b.`ï»¿result_id` IS NULL) AS clean_rows_without_backup_match;
     
     SELECT
    COUNT(*) AS backup_rows,
    COUNT(c.result_id) AS backup_rows_matching_clean,
    COUNT(*) - COUNT(c.result_id) AS backup_rows_without_clean_match
FROM search_discovery.search_results_backup b
LEFT JOIN search_discovery.search_results_clean c
    ON b.`ï»¿result_id` = c.result_id;
    
    SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT result_id) AS unique_result_ids,
    COUNT(*) - COUNT(DISTINCT result_id) AS extra_duplicate_id_rows
FROM search_discovery.search_results_clean;

SELECT
    result_id,
    COUNT(*) AS occurrences
FROM search_discovery.search_results_clean
GROUP BY result_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC, result_id;

SELECT
    result_id,
    COUNT(*) AS occurrences
FROM search_discovery.search_results_clean
WHERE result_id <> -999
GROUP BY result_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC, result_id;

SELECT
    COUNT(*) AS total_rows,
    SUM(result_id IS NULL) AS null_result_ids,
    SUM(result_id = -999) AS placeholder_result_ids,
    SUM(result_id <= 0 AND result_id <> -999) AS other_nonpositive_ids
FROM search_discovery.search_results_clean;

SELECT
    result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_clean
WHERE result_id = -999;

SELECT
    c.query_id,
    c.product_id,
    c.`rank`,
    c.relevance_score,
    c.sponsored,
    COUNT(b.`ï»¿result_id`) AS matching_backup_rows
FROM search_discovery.search_results_clean c
LEFT JOIN search_discovery.search_results_backup b
    ON TRIM(c.query_id) = TRIM(b.query_id)
   AND TRIM(c.product_id) = TRIM(b.product_id)
WHERE c.result_id = -999
GROUP BY
    c.query_id,
    c.product_id,
    c.`rank`,
    c.relevance_score,
    c.sponsored
ORDER BY c.query_id;

SELECT
    c.query_id,
    c.product_id,
    CASE
        WHEN q.query_id IS NULL THEN 'Missing query reference'
        ELSE 'Query found'
    END AS query_check,
    CASE
        WHEN p.`ï»¿product_id` IS NULL THEN 'Missing product reference'
        ELSE 'Product found'
    END AS product_check
FROM search_discovery.search_results_clean c
LEFT JOIN search_discovery.`search queries clean` q
    ON TRIM(c.query_id) = TRIM(q.query_id)
LEFT JOIN search_discovery.`products clean` p
    ON TRIM(c.product_id) = TRIM(p.`ï»¿product_id`)
WHERE c.result_id = -999
ORDER BY c.query_id;

SELECT
    query_id,
    product_id,
    COUNT(*) AS occurrences,
    GROUP_CONCAT(result_id ORDER BY result_id) AS result_ids
FROM search_discovery.search_results_clean
GROUP BY query_id, product_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC
LIMIT 20;

SELECT
    query_id,
    product_id,
    result_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_discovery.search_results_clean
WHERE (query_id, product_id) IN (
    ('Q001800', 'P00720'),
    ('Q002205', 'P01998'),
    ('Q003791', 'P00135'),
    ('Q004436', 'P01061'),
    ('Q004519', 'P01423'),
    ('Q005299', 'P00230'),
    ('Q005361', 'P00749'),
    ('Q005446', 'P01258'),
    ('Q005643', 'P00525'),
    ('Q006136', 'P00957'),
    ('Q006593', 'P01763'),
    ('Q008869', 'P01701'),
    ('Q009705', 'P00016'),
    ('Q012529', 'P01378'),
    ('Q014267', 'P00884'),
    ('Q014341', 'P00553'),
    ('Q014844', 'P00090'),
    ('Q015079', 'P01698'),
    ('Q015476', 'P00481'),
    ('Q016630', 'P00197')
)
ORDER BY query_id, product_id, result_id;

SELECT
    COUNT(*) AS repeated_query_product_pairs,
    SUM(pair_count) AS rows_in_repeated_pairs,
    SUM(pair_count - 1) AS extra_rows_beyond_one_per_pair,
    MAX(pair_count) AS maximum_occurrences
FROM (
    SELECT
        query_id,
        product_id,
        COUNT(*) AS pair_count
    FROM search_discovery.search_results_clean
    GROUP BY query_id, product_id
    HAVING COUNT(*) > 1
) AS repeated_pairs;

SELECT
    COUNT(*) AS total_rows,
    SUM(query_id IS NULL OR TRIM(query_id) = '') AS missing_query_ids,
    SUM(product_id IS NULL OR TRIM(product_id) = '') AS missing_product_ids,
    SUM(
        (query_id IS NULL OR TRIM(query_id) = '')
        AND
        (product_id IS NULL OR TRIM(product_id) = '')
    ) AS rows_missing_both
FROM search_discovery.search_results_clean;

SELECT
    COUNT(DISTINCT s.query_id) AS distinct_query_ids,
    COUNT(DISTINCT CASE
        WHEN q.query_id IS NOT NULL THEN s.query_id
    END) AS matched_query_ids,
    COUNT(DISTINCT CASE
        WHEN q.query_id IS NULL THEN s.query_id
    END) AS unmatched_query_ids
FROM search_discovery.search_results_clean s
LEFT JOIN search_discovery.`search queries clean` q
    ON TRIM(s.query_id) = TRIM(q.query_id)
WHERE s.query_id IS NOT NULL
  AND TRIM(s.query_id) <> '';
  
  SELECT
    COUNT(DISTINCT s.product_id) AS distinct_product_ids,
    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NOT NULL
        THEN s.product_id
    END) AS matched_product_ids,
    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN s.product_id
    END) AS unmatched_product_ids
FROM search_discovery.search_results_clean s
LEFT JOIN search_discovery.`products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> '';
  
  SELECT
    s.product_id,
    COUNT(*) AS result_rows,
    COUNT(DISTINCT s.query_id) AS distinct_queries,
    MIN(s.rank) AS min_rank,
    MAX(s.rank) AS max_rank
FROM search_discovery.search_results_clean s
LEFT JOIN search_discovery.`products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL
GROUP BY s.product_id
ORDER BY result_rows DESC
LIMIT 20;
SELECT
    s.product_id,
    COUNT(*) AS clean_result_rows,
    COUNT(DISTINCT st.product_id) AS staging_product_match
FROM search_discovery.search_results_clean s
LEFT JOIN search_discovery.search_results_staging st
    ON TRIM(s.product_id) = TRIM(st.product_id)
LEFT JOIN search_discovery.`products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL
GROUP BY s.product_id
ORDER BY clean_result_rows DESC
LIMIT 20;

SELECT
    x.product_id,
    x.clean_result_rows,
    CASE
        WHEN st.product_id IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS exists_in_staging,
    CASE
        WHEN p.`ï»¿product_id` IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS exists_in_catalogue
FROM (
    SELECT
        product_id,
        COUNT(*) AS clean_result_rows
    FROM search_discovery.search_results_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY product_id
) x
LEFT JOIN (
    SELECT DISTINCT TRIM(product_id) AS product_id
    FROM search_discovery.search_results_staging
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) st
    ON TRIM(x.product_id) = st.product_id
LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(x.product_id) = p.product_id
WHERE p.product_id IS NULL
ORDER BY x.clean_result_rows DESC
LIMIT 20;

SELECT
    x.product_id,
    x.clean_result_rows,
    CASE
        WHEN st.product_id IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS exists_in_staging,
    CASE
        WHEN p.product_id IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS exists_in_catalogue
FROM (
    SELECT
        product_id,
        COUNT(*) AS clean_result_rows
    FROM search_discovery.search_results_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY product_id
) x
LEFT JOIN (
    SELECT DISTINCT TRIM(product_id) AS product_id
    FROM search_discovery.search_results_staging
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) st
    ON TRIM(x.product_id) = st.product_id
LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(x.product_id) = p.product_id
WHERE p.product_id IS NULL
ORDER BY x.clean_result_rows DESC
LIMIT 20;

SHOW TABLES FROM search_discovery;

DESCRIBE search_discovery.`products clean`;

SELECT
    s.product_id,
    COUNT(DISTINCT s.result_id) AS clean_result_count,
    COUNT(c.product_id) AS click_record_count
FROM search_discovery.search_results_clean s
LEFT JOIN search_discovery.search_clicks_clean c
    ON TRIM(s.product_id) = TRIM(c.product_id)
LEFT JOIN search_discovery.`products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL
GROUP BY s.product_id
ORDER BY click_record_count DESC
LIMIT 20;

SELECT
    c.product_id,
    COUNT(*) AS click_records,
    COUNT(DISTINCT c.query_id) AS distinct_queries,
    COUNT(DISTINCT c.rank) AS distinct_ranks
FROM search_discovery.search_clicks_clean c
LEFT JOIN search_discovery.`products clean` p
    ON TRIM(c.product_id) = TRIM(p.`ï»¿product_id`)
WHERE c.product_id IS NOT NULL
  AND TRIM(c.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL
GROUP BY c.product_id
ORDER BY click_records DESC
LIMIT 20;

SELECT
    c.product_id,
    COUNT(*) AS clean_click_records,
    CASE
        WHEN b.product_id IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS exists_in_backup
FROM search_discovery.search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT TRIM(product_id) AS product_id
    FROM search_discovery.search_clicks_backup
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) b
    ON TRIM(c.product_id) = b.product_id
LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(c.product_id) = p.product_id
WHERE c.product_id IS NOT NULL
  AND TRIM(c.product_id) <> ''
  AND p.product_id IS NULL
GROUP BY
    c.product_id,
    b.product_id
ORDER BY clean_click_records DESC
LIMIT 20;

SELECT
    s.product_id,
    COUNT(*) AS clean_result_rows,
    CASE
        WHEN b.product_id IS NOT NULL THEN 'YES'
        ELSE 'NO'
    END AS exists_in_search_backup
FROM search_discovery.search_results_clean s
LEFT JOIN (
    SELECT DISTINCT TRIM(product_id) AS product_id
    FROM search_discovery.search_results_backup
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) b
    ON TRIM(s.product_id) = b.product_id
LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(s.product_id) = p.product_id
WHERE s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
  AND p.product_id IS NULL
GROUP BY s.product_id, b.product_id
ORDER BY clean_result_rows DESC
LIMIT 20;

SELECT
    COUNT(DISTINCT s.product_id) AS distinct_clean_product_ids,
    COUNT(DISTINCT CASE
        WHEN p.product_id IS NOT NULL THEN s.product_id
    END) AS matched_catalogue_ids,
    COUNT(DISTINCT CASE
        WHEN p.product_id IS NULL THEN s.product_id
    END) AS unmatched_catalogue_ids,
    COUNT(DISTINCT CASE
        WHEN b.product_id IS NOT NULL THEN s.product_id
    END) AS ids_in_search_backup
FROM search_discovery.search_results_clean s
LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM search_discovery.`products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(s.product_id) = p.product_id
LEFT JOIN (
    SELECT DISTINCT TRIM(product_id) AS product_id
    FROM search_discovery.search_results_backup
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) b
    ON TRIM(s.product_id) = b.product_id
WHERE s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> '';
  
  
  USE search_discovery;

DESCRIBE `search queries clean`;
DESCRIBE search_results_clean;
DESCRIBE search_clicks_clean;
DESCRIBE orders_clean;
DESCRIBE `customers clean`;
DESCRIBE `products clean`;
DESCRIBE `query quality clean`;
DESCRIBE `experiemnt clean`;

USE search_discovery;

DESCRIBE search_queries_clean;

DESCRIBE search_results_clean;
SELECT DISTINCT s.product_id
FROM search_results_clean s
LEFT JOIN products_clean p
    ON TRIM(s.product_id) = TRIM(p.product_id)
WHERE p.product_id IS NULL
  AND s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
LIMIT 50;


USE search_discovery;

SELECT DISTINCT s.product_id
FROM search_results_clean s
LEFT JOIN `products clean` p
    ON TRIM(s.product_id) = TRIM(p.product_id)
WHERE p.product_id IS NULL
  AND s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
LIMIT 50;


DESCRIBE `products clean`;
USE search_discovery;

SELECT DISTINCT s.product_id
FROM search_results_clean s
LEFT JOIN `products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE p.`ï»¿product_id` IS NULL
  AND s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
LIMIT 50;

SELECT COUNT(DISTINCT s.product_id) AS total_unmatched_ids
FROM search_results_clean s
LEFT JOIN `products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE p.`ï»¿product_id` IS NULL
  AND s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> '';
  SELECT
    COUNT(*) AS total_catalogue_rows,
    COUNT(DISTINCT TRIM(`ï»¿product_id`)) AS unique_product_ids,
    SUM(`ï»¿product_id` IS NULL) AS null_ids,
    SUM(TRIM(`ï»¿product_id`) = '') AS blank_ids
FROM `products clean`;

SELECT
    TRIM(`ï»¿product_id`) AS product_id,
    COUNT(*) AS occurrences
FROM `products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY TRIM(`ï»¿product_id`)
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;
SELECT
    p.`ï»¿product_id`,
    p.category,
    p.price,
    p.rating,
    p.stock
FROM `products clean` p
INNER JOIN (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(*) > 1
) d
    ON TRIM(p.`ï»¿product_id`) = d.product_id
ORDER BY p.`ï»¿product_id`
LIMIT 1000;

SELECT
    COUNT(*) AS duplicate_product_groups,
    SUM(record_count) AS total_rows_in_duplicate_groups,
    SUM(record_count - 1) AS extra_duplicate_rows
FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id,
        COUNT(*) AS record_count
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY TRIM(`ï»¿product_id`)
    HAVING COUNT(*) > 1
) AS duplicate_summary;

SELECT
    COUNT(*) AS duplicate_product_ids,

    SUM(category_count > 1) AS category_conflicts,

    SUM(price_count > 1) AS price_conflicts,

    SUM(rating_count > 1) AS rating_conflicts,

    SUM(stock_count > 1) AS stock_conflicts

FROM (
    SELECT
        TRIM(`ï»¿product_id`) AS product_id,

        COUNT(DISTINCT category) AS category_count,
        COUNT(DISTINCT price) AS price_count,
        COUNT(DISTINCT rating) AS rating_count,
        COUNT(DISTINCT stock) AS stock_count

    FROM `products clean`

    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''

    GROUP BY TRIM(`ï»¿product_id`)

    HAVING COUNT(*) > 1
) AS conflicts;

SELECT
    COUNT(*) AS total_rows,

    SUM(category IS NULL OR TRIM(category) = '') AS missing_category,

    SUM(price IS NULL) AS null_price,
    SUM(price = -999) AS invalid_price,

    SUM(rating IS NULL) AS null_rating,
    SUM(rating = -999) AS invalid_rating,

    SUM(stock IS NULL) AS null_stock,
    SUM(stock < 0) AS negative_stock

FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE category IS NULL
   OR TRIM(category) = ''
   OR price = -999
   OR rating = -999
ORDER BY `ï»¿product_id`;

SELECT
    COUNT(*) AS total_records,

    SUM(price <> -999 AND price IS NOT NULL) AS valid_prices,

    SUM(price = -999) AS invalid_prices,

    SUM(rating <> -999 AND rating IS NOT NULL) AS valid_ratings,

    SUM(rating = -999) AS invalid_ratings,

    SUM(category IS NOT NULL AND TRIM(category) <> '') AS valid_categories,

    SUM(category IS NULL OR TRIM(category) = '') AS missing_categories

FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE price = -999
   OR rating = -999
ORDER BY `ï»¿product_id`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE TRIM(`ï»¿product_id`) IN (
    'P00060',
    'P00411',
    'P00842',
    'P00919',
    'P01243',
    'P01490',
    'P01529',
    'P01547',
    'P01633',
    'P01865'
)
ORDER BY `ï»¿product_id`;

SELECT DISTINCT
    TRIM(s.product_id) AS unmatched_product_id
FROM search_results_clean s
LEFT JOIN `products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`)
WHERE p.`ï»¿product_id` IS NULL
  AND s.product_id IS NOT NULL
  AND TRIM(s.product_id) <> ''
ORDER BY unmatched_product_id
LIMIT 30;

SELECT
    TRIM(`ï»¿product_id`) AS product_id,
    COUNT(*) AS record_count
FROM `products clean`
WHERE TRIM(`ï»¿product_id`) IN (
    'P00008', 'P00009', 'P00013', 'P00017',
    'P00018', 'P00022', 'P00024', 'P00026',
    'P00027', 'P00028', 'P00030', 'P00031',
    'P00033', 'P00035', 'P00049', 'P00050',
    'P00052', 'P00054', 'P00056', 'P00057',
    'P00058', 'P00065', 'P00066', 'P00067',
    'P00068', 'P00070', 'P00071', 'P00072',
    'P00073', 'P00074'
)
GROUP BY TRIM(`ï»¿product_id`);

SELECT
    COUNT(*) AS total_search_result_rows,

    COUNT(DISTINCT s.product_id) AS total_distinct_product_ids,

    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN TRIM(s.product_id)
    END) AS unmatched_product_ids,

    SUM(CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN 1 ELSE 0
    END) AS unmatched_search_result_rows

FROM search_results_clean s

LEFT JOIN `products clean` p
    ON TRIM(s.product_id) = TRIM(p.`ï»¿product_id`);
    
    SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT result_id) AS unique_result_ids,
    COUNT(*) - COUNT(DISTINCT result_id) AS duplicate_result_ids
FROM search_results_clean;

SELECT
    COUNT(*) AS total_search_result_rows,

    SUM(
        CASE
            WHEN p.product_id IS NULL THEN 1
            ELSE 0
        END
    ) AS unmatched_search_result_rows

FROM search_results_clean s

LEFT JOIN (
    SELECT DISTINCT
        TRIM(`ï»¿product_id`) AS product_id
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(s.product_id) = p.product_id;
    
    SELECT
    result_id,
    COUNT(*) AS occurrences
FROM search_results_clean
GROUP BY result_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT *
FROM search_results_clean
WHERE result_id = '-999';

SELECT
    MIN(`rank`) AS minimum_rank,
    MAX(`rank`) AS maximum_rank,

    SUM(`rank` < 1) AS rank_below_1,

    SUM(`rank` BETWEEN 1 AND 100) AS valid_rank_range,

    SUM(`rank` > 100) AS rank_above_100

FROM search_results_clean;

SELECT
    CASE
        WHEN `rank` = -999 THEN 'Invalid (-999)'
        WHEN `rank` < 1 THEN 'Below 1'
        WHEN `rank` BETWEEN 1 AND 10 THEN '1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN '11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN '51-100'
        WHEN `rank` BETWEEN 101 AND 500 THEN '101-500'
        WHEN `rank` BETWEEN 501 AND 999 THEN '501-999'
        ELSE 'Other'
    END AS rank_category,

    COUNT(*) AS record_count

FROM search_results_clean
GROUP BY rank_category
ORDER BY MIN(`rank`);

SELECT
    COUNT(*) AS total_search_result_rows,

    COUNT(DISTINCT s.query_id) AS distinct_query_ids,

    COUNT(DISTINCT CASE
        WHEN q.query_id IS NULL THEN s.query_id
    END) AS unmatched_query_ids,

    SUM(
        CASE
            WHEN q.query_id IS NULL THEN 1
            ELSE 0
        END
    ) AS unmatched_query_rows

FROM search_results_clean s

LEFT JOIN search_queries_clean q
    ON TRIM(s.query_id) = TRIM(q.query_id);
    
    SHOW TABLES;
    
    SELECT
    COUNT(*) AS total_search_result_rows,

    COUNT(DISTINCT s.query_id) AS distinct_query_ids,

    COUNT(DISTINCT CASE
        WHEN q.query_id IS NULL THEN s.query_id
    END) AS unmatched_query_ids,

    SUM(
        CASE
            WHEN q.query_id IS NULL THEN 1
            ELSE 0
        END
    ) AS unmatched_query_rows

FROM search_results_clean s

LEFT JOIN `search queries clean` q
    ON TRIM(s.query_id) = TRIM(q.query_id);
    
    
    SELECT
    TRIM(query_id) AS query_id,
    COUNT(*) AS occurrences
FROM `search queries clean`
GROUP BY TRIM(query_id)
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT
    COUNT(*) AS duplicate_query_groups,
    SUM(record_count) AS rows_in_duplicate_groups,
    SUM(record_count - 1) AS extra_duplicate_rows
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        COUNT(*) AS record_count
    FROM `search queries clean`
    GROUP BY TRIM(query_id)
    HAVING COUNT(*) > 1
) AS duplicate_summary;

SELECT *
FROM `search queries clean`
WHERE query_id IS NULL
   OR TRIM(query_id) = '';
   
   
   SELECT
    COUNT(*) AS total_query_rows,
    SUM(query_id IS NULL OR TRIM(query_id) = '') AS missing_query_ids,
    SUM(query_id IS NOT NULL AND TRIM(query_id) <> '') AS valid_query_ids
FROM `search queries clean`;


SELECT
    COUNT(*) AS duplicate_query_groups,
    SUM(record_count) AS rows_in_duplicate_groups,
    SUM(record_count - 1) AS extra_duplicate_rows
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        COUNT(*) AS record_count
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
    GROUP BY TRIM(query_id)
    HAVING COUNT(*) > 1
) AS duplicate_summary;

SELECT
    TRIM(query_id) AS query_id,
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS different_customers
FROM `search queries clean`
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
GROUP BY TRIM(query_id)
HAVING COUNT(*) > 1
   AND COUNT(DISTINCT customer_id) > 1
ORDER BY different_customers DESC
LIMIT 20;

SELECT *
FROM `search queries clean`
WHERE TRIM(query_id) = 'Q011548'
ORDER BY timestamp;

SELECT
    TRIM(query_id) AS query_id,
    COUNT(*) AS total_records,
    COUNT(DISTINCT query_text) AS different_search_texts
FROM `search queries clean`
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
GROUP BY TRIM(query_id)
HAVING COUNT(*) > 1
ORDER BY different_search_texts DESC
LIMIT 20;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT CONCAT(
        TRIM(customer_id), '|',
        TRIM(query_text), '|',
        TRIM(CAST(timestamp AS CHAR))
    )) AS unique_combinations
FROM `search queries clean`
WHERE customer_id IS NOT NULL
  AND query_text IS NOT NULL
  AND timestamp IS NOT NULL;
  
  SELECT
    COUNT(*) AS total_search_result_rows,
    SUM(q.query_id IS NULL) AS unmatched_result_rows,
    COUNT(*) - SUM(q.query_id IS NULL) AS matched_result_rows
FROM search_results_clean s
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON TRIM(s.query_id) = q.query_id;
    
    
    SELECT
    COUNT(*) AS total_click_rows,
    SUM(q.query_id IS NULL) AS unmatched_click_rows,
    COUNT(*) - SUM(q.query_id IS NULL) AS matched_click_rows
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT TRIM(query_id) AS query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
) q
    ON TRIM(c.query_id) = q.query_id;
    
    
    SELECT
    COUNT(*) AS total_clicks,
    SUM(s.query_id IS NOT NULL) AS matched_clicks,
    SUM(s.query_id IS NULL) AS unmatched_clicks
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT
        TRIM(query_id) AS query_id,
        TRIM(product_id) AS product_id
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND product_id IS NOT NULL
) s
    ON TRIM(c.query_id) = s.query_id
   AND TRIM(c.product_id) = s.product_id;
   
   DESCRIBE search_clicks_clean;
   
   SELECT
    quality_status,
    quality_issue,
    COUNT(*) AS total_records
FROM search_clicks_clean
GROUP BY quality_status, quality_issue
ORDER BY total_records DESC;


SELECT
    COUNT(*) AS total_clicks,
    SUM(rank = dwell_seconds) AS same_rank_and_dwell,
    SUM(rank <> dwell_seconds) AS different_rank_and_dwell,
    SUM(rank IS NULL OR dwell_seconds IS NULL) AS missing_values
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE WHEN `rank` = dwell_seconds THEN 1 ELSE 0 END) AS same_rank_and_dwell,
    SUM(CASE WHEN `rank` <> dwell_seconds THEN 1 ELSE 0 END) AS different_rank_and_dwell,
    SUM(CASE WHEN `rank` IS NULL OR dwell_seconds IS NULL THEN 1 ELSE 0 END) AS missing_values
FROM search_clicks_clean;



SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT click_id) AS unique_click_ids,
    COUNT(*) - COUNT(DISTINCT click_id) AS duplicate_click_id_rows
FROM search_clicks_clean;

SELECT
    click_id,
    COUNT(*) AS occurrences
FROM search_clicks_clean
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT *
FROM search_clicks_clean
WHERE click_id = -999;

SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE WHEN p.product_id IS NOT NULL THEN 1 ELSE 0 END) AS matched_product_rows,
    SUM(CASE WHEN p.product_id IS NULL THEN 1 ELSE 0 END) AS unmatched_product_rows
FROM search_clicks_clean c
LEFT JOIN (
    SELECT DISTINCT TRIM(`ï»¿product_id`) AS product_id
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON TRIM(c.product_id) = p.product_id;
    
    SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_ids,
    SUM(CASE WHEN TRIM(product_id) = '' THEN 1 ELSE 0 END) AS blank_product_ids,
    SUM(CASE WHEN TRIM(product_id) = '-999' THEN 1 ELSE 0 END) AS invalid_product_ids
FROM search_clicks_clean;


SELECT
    CASE
        WHEN `rank` IS NULL THEN 'Missing rank'
        WHEN `rank` < 1 THEN 'Below 1'
        WHEN `rank` BETWEEN 1 AND 10 THEN '1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN '11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN '51-100'
        WHEN `rank` > 100 THEN 'Above 100'
    END AS rank_category,
    COUNT(*) AS total_records
FROM search_clicks_clean
GROUP BY rank_category
ORDER BY MIN(`rank`);

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_issue
FROM search_clicks_clean
WHERE `rank` <> dwell_seconds
ORDER BY click_id;

SELECT
    MIN(dwell_seconds) AS minimum_dwell,
    MAX(dwell_seconds) AS maximum_dwell,
    AVG(dwell_seconds) AS average_dwell,
    COUNT(DISTINCT dwell_seconds) AS unique_dwell_values,
    COUNT(*) AS total_clicks
FROM search_clicks_clean;

SELECT
    Query_ID_Check,
    Product_ID_Check,
    Query_Product_Check,
    Query_Only_Check,
    COUNT(*) AS total_records
FROM search_clicks_clean
GROUP BY
    Query_ID_Check,
    Product_ID_Check,
    Query_Product_Check,
    Query_Only_Check
ORDER BY total_records DESC
LIMIT 20;

SELECT *
FROM search_clicks_clean
WHERE
    (Query_ID_Check = 'Query ID Found'
     AND Product_ID_Check = 'Product ID Found')
    OR Query_Only_Check = ']';
    
    
    SELECT
    quality_status,
    COUNT(*) AS total_records,
    SUM(CASE WHEN click_id = -999 THEN 1 ELSE 0 END) AS invalid_click_ids,
    SUM(CASE WHEN `rank` = -999 THEN 1 ELSE 0 END) AS invalid_ranks
FROM search_clicks_clean
GROUP BY quality_status;

DESCRIBE search_results_clean;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN result_id IS NULL OR result_id = -999 THEN 1 ELSE 0 END) AS invalid_result_ids,
    SUM(CASE WHEN query_id IS NULL OR TRIM(query_id) = '' THEN 1 ELSE 0 END) AS missing_query_ids,
    SUM(CASE WHEN product_id IS NULL OR TRIM(product_id) = '' THEN 1 ELSE 0 END) AS missing_product_ids,
    SUM(CASE WHEN `rank` IS NULL OR `rank` = -999 OR `rank` < 1 THEN 1 ELSE 0 END) AS invalid_ranks,
    SUM(CASE WHEN relevance_score IS NULL OR relevance_score = -999 THEN 1 ELSE 0 END) AS invalid_relevance_scores,
    SUM(CASE WHEN sponsored IS NULL THEN 1 ELSE 0 END) AS missing_sponsored_values
FROM search_results_clean;

SELECT
    result_id,
    COUNT(*) AS occurrences
FROM search_results_clean
GROUP BY result_id
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT
    MIN(relevance_score) AS minimum_score,
    MAX(relevance_score) AS maximum_score,
    AVG(relevance_score) AS average_score,
    COUNT(DISTINCT relevance_score) AS unique_scores,
    SUM(CASE WHEN relevance_score < 0 THEN 1 ELSE 0 END) AS negative_scores,
    SUM(CASE WHEN relevance_score > 1 THEN 1 ELSE 0 END) AS scores_above_1
FROM search_results_clean;

SELECT
    sponsored,
    COUNT(*) AS total_records
FROM search_results_clean
GROUP BY sponsored
ORDER BY sponsored;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT result_id) AS unique_result_ids,
    SUM(result_id = -999) AS invalid_result_ids,
    SUM(query_id IS NULL OR TRIM(query_id) = '') AS missing_query_ids,
    SUM(product_id IS NULL OR TRIM(product_id) = '') AS missing_product_ids,
    SUM(`rank` IS NULL OR `rank` < 1) AS invalid_ranks,
    SUM(relevance_score < 0 OR relevance_score > 1) AS invalid_relevance_scores,
    SUM(sponsored NOT IN (0, 1)) AS invalid_sponsored_values
FROM search_results_clean;

SELECT
    TRIM(query_id) AS query_id,
    TRIM(product_id) AS product_id,
    COUNT(*) AS occurrences
FROM search_results_clean
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
  AND product_id IS NOT NULL
  AND TRIM(product_id) <> ''
GROUP BY
    TRIM(query_id),
    TRIM(product_id)
HAVING COUNT(*) > 1
ORDER BY occurrences DESC
LIMIT 20;

SELECT
    query_id,
    product_id,
    result_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_results_clean
WHERE TRIM(query_id) = 'Q025287'
  AND TRIM(product_id) = 'P00646'
ORDER BY `rank`;

SELECT
    COUNT(*) AS repeated_combinations,
    SUM(occurrences) AS total_records_in_repeated_groups,
    SUM(occurrences - 1) AS extra_occurrences,
    MAX(occurrences) AS maximum_occurrences
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        TRIM(product_id) AS product_id,
        COUNT(*) AS occurrences
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY TRIM(query_id), TRIM(product_id)
    HAVING COUNT(*) > 1
) AS duplicate_groups;

SELECT
    COUNT(*) AS repeated_combinations,
    SUM(CASE WHEN min_rank = max_rank THEN 1 ELSE 0 END) AS same_rank_combinations,
    SUM(CASE WHEN min_rank <> max_rank THEN 1 ELSE 0 END) AS different_rank_combinations
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        TRIM(product_id) AS product_id,
        MIN(`rank`) AS min_rank,
        MAX(`rank`) AS max_rank
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY TRIM(query_id), TRIM(product_id)
    HAVING COUNT(*) > 1
) AS repeated_groups;

SELECT
    COUNT(*) AS repeated_combinations,
    SUM(CASE WHEN min_score = max_score THEN 1 ELSE 0 END) AS same_score_combinations,
    SUM(CASE WHEN min_score <> max_score THEN 1 ELSE 0 END) AS different_score_combinations
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        TRIM(product_id) AS product_id,
        MIN(relevance_score) AS min_score,
        MAX(relevance_score) AS max_score
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY TRIM(query_id), TRIM(product_id)
    HAVING COUNT(*) > 1
) AS repeated_groups;

SELECT
    COUNT(*) AS repeated_combinations,
    SUM(CASE WHEN min_score = max_score THEN 1 ELSE 0 END) AS same_score_combinations,
    SUM(CASE WHEN min_score <> max_score THEN 1 ELSE 0 END) AS different_score_combinations
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        TRIM(product_id) AS product_id,
        MIN(relevance_score) AS min_score,
        MAX(relevance_score) AS max_score
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY TRIM(query_id), TRIM(product_id)
    HAVING COUNT(*) > 1
) AS repeated_groups;


SELECT
    COUNT(*) AS repeated_combinations,
    SUM(CASE WHEN min_sponsored = max_sponsored THEN 1 ELSE 0 END) AS same_sponsored_status,
    SUM(CASE WHEN min_sponsored <> max_sponsored THEN 1 ELSE 0 END) AS different_sponsored_status
FROM (
    SELECT
        TRIM(query_id) AS query_id,
        TRIM(product_id) AS product_id,
        MIN(sponsored) AS min_sponsored,
        MAX(sponsored) AS max_sponsored
    FROM search_results_clean
    WHERE query_id IS NOT NULL
      AND TRIM(query_id) <> ''
      AND product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY TRIM(query_id), TRIM(product_id)
    HAVING COUNT(*) > 1
) AS repeated_groups;

SELECT
    TRIM(query_id) AS query_id,
    TRIM(product_id) AS product_id,
    COUNT(*) AS occurrences,
    MIN(sponsored) AS first_sponsored_status,
    MAX(sponsored) AS second_sponsored_status,
    MIN(`rank`) AS minimum_rank,
    MAX(`rank`) AS maximum_rank
FROM search_results_clean
WHERE query_id IS NOT NULL
  AND TRIM(query_id) <> ''
  AND product_id IS NOT NULL
  AND TRIM(product_id) <> ''
GROUP BY
    TRIM(query_id),
    TRIM(product_id)
HAVING COUNT(*) = 2
   AND MIN(sponsored) <> MAX(sponsored)
ORDER BY query_id;

SELECT
    COUNT(*) AS total_search_results,
    COUNT(DISTINCT query_id) AS unique_queries,
    COUNT(DISTINCT product_id) AS unique_products
FROM search_results_clean;

SELECT
    product_id,
    COUNT(*) AS total_impressions
FROM search_results_clean
GROUP BY product_id
ORDER BY total_impressions DESC
LIMIT 10;

SELECT
    product_id,
    COUNT(*) AS total_clicks
FROM search_clicks_clean
GROUP BY product_id
ORDER BY total_clicks DESC
LIMIT 10;

SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE
        WHEN product_id IS NULL OR TRIM(product_id) = ''
        THEN 1 ELSE 0
    END) AS missing_product_ids,
    SUM(CASE
        WHEN product_id IS NOT NULL AND TRIM(product_id) <> ''
        THEN 1 ELSE 0
    END) AS valid_product_ids
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN query_id IS NULL OR TRIM(query_id) = ''
        THEN 1 ELSE 0
    END) AS missing_query_id,

    SUM(CASE
        WHEN product_id IS NULL OR TRIM(product_id) = ''
        THEN 1 ELSE 0
    END) AS missing_product_id,

    SUM(CASE
        WHEN rank IS NULL
        THEN 1 ELSE 0
    END) AS missing_rank

FROM search_clicks_clean;


SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN query_id IS NULL OR TRIM(query_id) = '' THEN 1 ELSE 0 END) AS missing_query_id,
    SUM(CASE WHEN product_id IS NULL OR TRIM(product_id) = '' THEN 1 ELSE 0 END) AS missing_product_id,
    SUM(CASE WHEN `rank` IS NULL THEN 1 ELSE 0 END) AS missing_rank
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_clicks,

    SUM(CASE
        WHEN sr.query_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS matched_clicks,

    SUM(CASE
        WHEN sr.query_id IS NULL
        THEN 1 ELSE 0
    END) AS unmatched_clicks

FROM search_clicks_clean sc

LEFT JOIN search_results_clean sr
    ON sc.query_id = sr.query_id
    AND sc.product_id = sr.product_id
    AND sc.rank = sr.rank;
    
    SELECT
    COUNT(*) AS total_clicks,

    SUM(CASE
        WHEN EXISTS (
            SELECT 1
            FROM search_results_clean sr
            WHERE sr.query_id = sc.query_id
              AND sr.product_id = sc.product_id
        )
        THEN 1 ELSE 0
    END) AS matched_clicks,

    SUM(CASE
        WHEN NOT EXISTS (
            SELECT 1
            FROM search_results_clean sr
            WHERE sr.query_id = sc.query_id
              AND sr.product_id = sc.product_id
        )
        THEN 1 ELSE 0
    END) AS unmatched_clicks

FROM search_clicks_clean sc;

SELECT
    COUNT(*) AS total_clicks,
    SUM(CASE
        WHEN sr.query_id IS NOT NULL THEN 1
        ELSE 0
    END) AS matched_clicks,
    SUM(CASE
        WHEN sr.query_id IS NULL THEN 1
        ELSE 0
    END) AS unmatched_clicks
FROM search_clicks_clean sc
LEFT JOIN (
    SELECT DISTINCT query_id, product_id
    FROM search_results_clean
) 
ON sc.query_id = sr.query_id
AND sc.product_id = sr.product_id;

SELECT
    COUNT(*) AS total_clicks,

    SUM(CASE
        WHEN q.query_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS query_id_matches,

    SUM(CASE
        WHEN p.product_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS product_id_matches,

    SUM(CASE
        WHEN q.query_id IS NOT NULL
         AND p.product_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS both_match

FROM search_clicks_clean sc

LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
) q
ON sc.query_id = q.query_id

LEFT JOIN (
    SELECT DISTINCT product_id
    FROM search_results_clean
) p
ON sc.product_id = p.product_id;

SELECT
    sc.query_id,
    sc.product_id,
    sc.rank
FROM search_clicks_clean sc
LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
) sr
ON sc.query_id = sr.query_id
WHERE sr.query_id IS NULL
LIMIT 20;

SELECT
    COUNT(*) AS total_clicks,

    SUM(CASE
        WHEN sq.query_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS queries_found,

    SUM(CASE
        WHEN sq.query_id IS NULL
        THEN 1 ELSE 0
    END) AS queries_not_found

FROM search_clicks_clean sc

LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_queries_clean
) sq
ON sc.query_id = sq.query_id;

SHOW TABLES;


SELECT
    COUNT(*) AS total_clicks,

    SUM(CASE
        WHEN sq.query_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS queries_found,

    SUM(CASE
        WHEN sq.query_id IS NULL
        THEN 1 ELSE 0
    END) AS queries_not_found

FROM search_clicks_clean sc

LEFT JOIN (
    SELECT DISTINCT query_id
    FROM `search queries clean`
) sq
ON sc.query_id = sq.query_id;


SELECT
    COUNT(*) AS total_search_queries,

    SUM(CASE
        WHEN sr.query_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS queries_found_in_results,

    SUM(CASE
        WHEN sr.query_id IS NULL
        THEN 1 ELSE 0
    END) AS queries_not_in_results

FROM (
    SELECT DISTINCT query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
) sq

LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
) sr
ON sq.query_id = sr.query_id;

SELECT
    sq.query_id
FROM (
    SELECT DISTINCT query_id
    FROM `search queries clean`
    WHERE query_id IS NOT NULL
) sq

LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
) sr
ON sq.query_id = sr.query_id

WHERE sr.query_id IS NULL
LIMIT 20;

DESCRIBE `query quality clean`;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT query_id) AS unique_queries,

    SUM(CASE
        WHEN zero_result = 1 THEN 1 ELSE 0
    END) AS zero_result_count,

    SUM(CASE
        WHEN reformulated = 1 THEN 1 ELSE 0
    END) AS reformulated_count,

    SUM(CASE
        WHEN abandoned = 1 THEN 1 ELSE 0
    END) AS abandoned_count,

    ROUND(AVG(satisfaction), 2) AS avg_satisfaction

FROM `query quality clean`;


SELECT
    COUNT(*) AS zero_result_records,

    SUM(CASE
        WHEN sr.query_id IS NOT NULL
        THEN 1 ELSE 0
    END) AS found_in_search_results,

    SUM(CASE
        WHEN sr.query_id IS NULL
        THEN 1 ELSE 0
    END) AS not_found_in_search_results

FROM `query quality clean` q

LEFT JOIN (
    SELECT DISTINCT query_id
    FROM search_results_clean
) sr
ON q.query_id = sr.query_id

WHERE q.zero_result = 1;


SELECT
    COUNT(*) AS zero_result_records,
    COUNT(DISTINCT query_id) AS unique_zero_result_queries,
    COUNT(*) - COUNT(DISTINCT query_id) AS duplicate_records
FROM `query quality clean`
WHERE zero_result = 1;

SELECT
    COUNT(*) AS total_reformulated_records,
    COUNT(DISTINCT query_id) AS unique_reformulated_queries,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM `query quality clean`),
        2
    ) AS reformulation_percentage
FROM `query quality clean`
WHERE reformulated = 1;


SELECT
    COUNT(*) AS total_abandoned_records,

    COUNT(DISTINCT query_id) AS unique_abandoned_queries,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM `query quality clean`),
        2
    ) AS abandonment_percentage

FROM `query quality clean`
WHERE abandoned = 1;

SELECT
    CASE
        WHEN satisfaction < 0.3 THEN 'Low Satisfaction'
        WHEN satisfaction < 0.7 THEN 'Medium Satisfaction'
        ELSE 'High Satisfaction'
    END AS satisfaction_level,

    COUNT(*) AS total_records,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM `query quality clean`),
        2
    ) AS percentage

FROM `query quality clean`
GROUP BY satisfaction_level
ORDER BY total_records DESC;

DESCRIBE search_results_clean;

DESCRIBE search_clicks_clean;

DESCRIBE search_results_clean;

SELECT
    (SELECT COUNT(*)
     FROM search_results_clean) AS total_impressions,

    (SELECT COUNT(*)
     FROM search_clicks_clean) AS total_clicks,

    ROUND(
        (SELECT COUNT(*) FROM search_clicks_clean) * 100.0 /
        (SELECT COUNT(*) FROM search_results_clean),
        2
    ) AS overall_ctr_percentage;
    
    
    90000	24000	26.67
    
    
    
    
    SELECT
    product_id,
    COUNT(*) AS total_impressions
FROM search_results_clean
GROUP BY product_id
ORDER BY total_impressions DESC
LIMIT 10;

SELECT
    product_id,
    COUNT(*) AS total_impressions
FROM search_results_clean
GROUP BY product_id
ORDER BY total_impressions DESC
LIMIT 10;

SELECT
    product_id,
    COUNT(*) AS total_clicks
FROM search_clicks_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
GROUP BY product_id
ORDER BY total_clicks DESC
LIMIT 10;

SELECT
    sc.product_id,
    COUNT(*) AS total_clicks,
    sr.total_impressions
FROM search_clicks_clean sc
JOIN (
    SELECT
        product_id,
        COUNT(*) AS total_impressions
    FROM search_results_clean
    GROUP BY product_id
) sr
    ON sc.product_id = sr.product_id
WHERE sc.product_id IS NOT NULL
  AND TRIM(sc.product_id) <> ''
GROUP BY sc.product_id, sr.total_impressions
ORDER BY total_clicks DESC
LIMIT 10;

SELECT
    sc.product_id,
    COUNT(*) AS total_clicks,
    sr.total_impressions,
    ROUND(
        COUNT(*) * 100.0 / sr.total_impressions,
        2
    ) AS preliminary_ctr_percentage
FROM search_clicks_clean sc
JOIN (
    SELECT
        product_id,
        COUNT(*) AS total_impressions
    FROM search_results_clean
    GROUP BY product_id
) sr
    ON sc.product_id = sr.product_id
WHERE sc.product_id IS NOT NULL
  AND TRIM(sc.product_id) <> ''
GROUP BY sc.product_id, sr.total_impressions
ORDER BY preliminary_ctr_percentage DESC
LIMIT 10;

SELECT
    quality_status,
    COUNT(*) AS total_clicks,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM search_clicks_clean),
        2
    ) AS percentage
FROM search_clicks_clean
GROUP BY quality_status
ORDER BY total_clicks DESC;

SELECT
    quality_issue,
    COUNT(*) AS total_records,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM search_clicks_clean),
        2
    ) AS percentage
FROM search_clicks_clean
GROUP BY quality_issue
ORDER BY total_records DESC;


SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN dwell_seconds = `rank` THEN 1
            ELSE 0
        END
    ) AS dwell_equals_rank,
    SUM(
        CASE
            WHEN dwell_seconds <> `rank` THEN 1
            ELSE 0
        END
    ) AS dwell_not_equal_rank
FROM search_clicks_clean;

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_issue
FROM search_clicks_clean
WHERE dwell_seconds <> `rank`
LIMIT 20;

SELECT
    `rank`,
    COUNT(*) AS total_records
FROM search_clicks_clean
GROUP BY `rank`
ORDER BY `rank`;

DESCRIBE search_results_clean;

SELECT
    COUNT(*) AS total_impressions,
    MIN(`rank`) AS minimum_rank,
    MAX(`rank`) AS maximum_rank,
    SUM(CASE WHEN `rank` = -999 THEN 1 ELSE 0 END) AS placeholder_rank,
    SUM(CASE WHEN `rank` = 0 THEN 1 ELSE 0 END) AS zero_rank,
    SUM(CASE WHEN `rank` BETWEEN 1 AND 100 THEN 1 ELSE 0 END) AS rank_1_to_100,
    SUM(CASE WHEN `rank` > 100 THEN 1 ELSE 0 END) AS rank_above_100
FROM search_results_clean;

SELECT
    'Search Results' AS table_name,
    COUNT(*) AS total_records,
    SUM(CASE WHEN `rank` = -999 THEN 1 ELSE 0 END) AS placeholder_rank,
    SUM(CASE WHEN `rank` = 0 THEN 1 ELSE 0 END) AS zero_rank,
    SUM(CASE WHEN `rank` BETWEEN 1 AND 100 THEN 1 ELSE 0 END) AS rank_1_to_100,
    SUM(CASE WHEN `rank` > 100 THEN 1 ELSE 0 END) AS rank_above_100
FROM search_results_clean

UNION ALL

SELECT
    'Search Clicks',
    COUNT(*),
    SUM(CASE WHEN `rank` = -999 THEN 1 ELSE 0 END),
    SUM(CASE WHEN `rank` = 0 THEN 1 ELSE 0 END),
    SUM(CASE WHEN `rank` BETWEEN 1 AND 100 THEN 1 ELSE 0 END),
    SUM(CASE WHEN `rank` > 100 THEN 1 ELSE 0 END)
FROM search_clicks_clean;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT click_id) AS unique_click_ids,
    COUNT(*) - COUNT(DISTINCT click_id) AS duplicate_click_ids
FROM search_clicks_clean;

SELECT
    click_id,
    COUNT(*) AS occurrence_count
FROM search_clicks_clean
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT
    click_id,
    query_id,
    product_id,
    `rank`,
    dwell_seconds,
    quality_issue
FROM search_clicks_clean
WHERE click_id = -999;

SELECT
    click_id,
    COUNT(*) AS occurrence_count
FROM search_clicks_clean
WHERE click_id <> -999
GROUP BY click_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT
    query_id,
    product_id,
    `rank`,
    COUNT(*) AS occurrence_count
FROM search_clicks_clean
GROUP BY
    query_id,
    product_id,
    `rank`
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC
LIMIT 20;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT result_id) AS unique_result_ids,
    COUNT(*) - COUNT(DISTINCT result_id) AS duplicate_result_ids
FROM search_results_clean;

SELECT
    result_id,
    COUNT(*) AS occurrence_count
FROM search_results_clean
GROUP BY result_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT
    result_id,
    COUNT(*) AS occurrence_count
FROM search_results_clean
WHERE result_id <> -999
GROUP BY result_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

SELECT
    result_id,
    query_id,
    product_id,
    `rank`,
    relevance_score,
    sponsored
FROM search_results_clean
WHERE result_id = -999;

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN query_id IS NULL OR TRIM(query_id) = ''
        THEN 1 ELSE 0
    END) AS missing_query_id,

    SUM(CASE
        WHEN product_id IS NULL OR TRIM(product_id) = ''
        THEN 1 ELSE 0
    END) AS missing_product_id,

    SUM(CASE
        WHEN `rank` IS NULL
        THEN 1 ELSE 0
    END) AS missing_rank,

    SUM(CASE
        WHEN relevance_score IS NULL
        THEN 1 ELSE 0
    END) AS missing_relevance_score,

    SUM(CASE
        WHEN sponsored IS NULL
        THEN 1 ELSE 0
    END) AS missing_sponsored

FROM search_results_clean;

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN (query_id IS NULL OR TRIM(query_id) = '')
         AND (product_id IS NULL OR TRIM(product_id) = '')
        THEN 1 ELSE 0
    END) AS both_missing,

    SUM(CASE
        WHEN (query_id IS NULL OR TRIM(query_id) = '')
         AND product_id IS NOT NULL
         AND TRIM(product_id) <> ''
        THEN 1 ELSE 0
    END) AS only_query_missing,

    SUM(CASE
        WHEN query_id IS NOT NULL
         AND TRIM(query_id) <> ''
         AND (product_id IS NULL OR TRIM(product_id) = '')
        THEN 1 ELSE 0
    END) AS only_product_missing

FROM search_results_clean;

SELECT
    MIN(relevance_score) AS minimum_score,
    MAX(relevance_score) AS maximum_score,

    SUM(CASE
        WHEN relevance_score < 0 OR relevance_score > 1
        THEN 1 ELSE 0
    END) AS invalid_scores,

    ROUND(AVG(relevance_score), 3) AS average_score

FROM search_results_clean;

SELECT
    sponsored,
    COUNT(*) AS total_records
FROM search_results_clean
GROUP BY sponsored
ORDER BY sponsored;

SELECT
    sponsored,
    COUNT(*) AS total_records,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    MIN(relevance_score) AS minimum_score,
    MAX(relevance_score) AS maximum_score
FROM search_results_clean
GROUP BY sponsored
ORDER BY sponsored;

SELECT
    CASE
        WHEN relevance_score < 0.3 THEN 'Low Relevance'
        WHEN relevance_score < 0.7 THEN 'Medium Relevance'
        ELSE 'High Relevance'
    END AS relevance_category,
    COUNT(*) AS total_records,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM search_results_clean),
        2
    ) AS percentage
FROM search_results_clean
GROUP BY relevance_category
ORDER BY total_records DESC;

SELECT
    sponsored,
    CASE
        WHEN relevance_score < 0.3 THEN 'Low Relevance'
        WHEN relevance_score < 0.7 THEN 'Medium Relevance'
        ELSE 'High Relevance'
    END AS relevance_category,
    COUNT(*) AS total_records,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY sponsored),
        2
    ) AS percentage
FROM search_results_clean
GROUP BY sponsored, relevance_category
ORDER BY sponsored, relevance_category;

SELECT
    CASE
        WHEN `rank` BETWEEN 1 AND 10 THEN 'Top 1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN 'Rank 11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN 'Rank 51-100'
        WHEN `rank` > 100 THEN 'Rank Above 100'
        ELSE 'Invalid or Placeholder Rank'
    END AS rank_category,
    COUNT(*) AS total_records,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score
FROM search_results_clean
GROUP BY rank_category
ORDER BY
    CASE rank_category
        WHEN 'Top 1-10' THEN 1
        WHEN 'Rank 11-50' THEN 2
        WHEN 'Rank 51-100' THEN 3
        WHEN 'Rank Above 100' THEN 4
        ELSE 5
    END;
    
    SELECT
    ROUND(
        (
            COUNT(*) * SUM(`rank` * relevance_score)
            - SUM(`rank`) * SUM(relevance_score)
        ) /
        SQRT(
            (
                COUNT(*) * SUM(`rank` * `rank`)
                - POW(SUM(`rank`), 2)
            ) *
            (
                COUNT(*) * SUM(relevance_score * relevance_score)
                - POW(SUM(relevance_score), 2)
            )
        ),
        4
    ) AS rank_relevance_correlation
FROM search_results_clean
WHERE `rank` BETWEEN 1 AND 999
  AND relevance_score IS NOT NULL;
  
  SELECT
    sponsored,
    COUNT(*) AS total_records,
    ROUND(AVG(`rank`), 2) AS average_rank,
    MIN(`rank`) AS minimum_rank,
    MAX(`rank`) AS maximum_rank
FROM search_results_clean
WHERE `rank` BETWEEN 1 AND 999
GROUP BY sponsored
ORDER BY sponsored;

SELECT
    sponsored,
    COUNT(*) AS total_valid_records,

    SUM(CASE WHEN `rank` BETWEEN 1 AND 10
        THEN 1 ELSE 0 END) AS top_10,

    SUM(CASE WHEN `rank` BETWEEN 1 AND 50
        THEN 1 ELSE 0 END) AS top_50,

    SUM(CASE WHEN `rank` BETWEEN 1 AND 100
        THEN 1 ELSE 0 END) AS top_100,

    ROUND(
        SUM(CASE WHEN `rank` BETWEEN 1 AND 100
        THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS top_100_percentage

FROM search_results_clean
WHERE `rank` BETWEEN 1 AND 999
GROUP BY sponsored
ORDER BY sponsored;

SELECT
    sponsored,
    COUNT(*) AS top_100_records,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    ROUND(MIN(relevance_score), 3) AS minimum_score,
    ROUND(MAX(relevance_score), 3) AS maximum_score
FROM search_results_clean
WHERE `rank` BETWEEN 1 AND 100
GROUP BY sponsored
ORDER BY sponsored;

SELECT
    CASE
        WHEN `rank` BETWEEN 1 AND 10 THEN 'Top 1-10'
        WHEN `rank` BETWEEN 11 AND 50 THEN 'Rank 11-50'
        WHEN `rank` BETWEEN 51 AND 100 THEN 'Rank 51-100'
        WHEN `rank` BETWEEN 101 AND 500 THEN 'Rank 101-500'
        WHEN `rank` BETWEEN 501 AND 999 THEN 'Rank 501-999'
        ELSE 'Invalid or Placeholder'
    END AS rank_category,

    COUNT(*) AS total_records,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM search_results_clean),
        2
    ) AS percentage

FROM search_results_clean
GROUP BY rank_category
ORDER BY
    CASE rank_category
        WHEN 'Top 1-10' THEN 1
        WHEN 'Rank 11-50' THEN 2
        WHEN 'Rank 51-100' THEN 3
        WHEN 'Rank 101-500' THEN 4
        WHEN 'Rank 501-999' THEN 5
        ELSE 6
    END;
    
    SELECT
    product_id,
    COUNT(*) AS total_appearances,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    SUM(CASE WHEN sponsored = 1 THEN 1 ELSE 0 END) AS sponsored_appearances,
    SUM(CASE WHEN sponsored = 0 THEN 1 ELSE 0 END) AS organic_appearances
FROM search_results_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
GROUP BY product_id
ORDER BY total_appearances DESC
LIMIT 10;

SELECT
    product_id,
    COUNT(*) AS total_appearances,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    SUM(CASE WHEN sponsored = 1 THEN 1 ELSE 0 END) AS sponsored_appearances,
    SUM(CASE WHEN sponsored = 0 THEN 1 ELSE 0 END) AS organic_appearances
FROM search_results_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
GROUP BY product_id
HAVING COUNT(*) >= 20
ORDER BY average_relevance_score DESC
LIMIT 10;

SELECT
    product_id,
    COUNT(*) AS total_appearances,
    ROUND(AVG(relevance_score), 3) AS average_relevance_score,
    ROUND(AVG(`rank`), 2) AS average_rank
FROM search_results_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
  AND `rank` BETWEEN 1 AND 999
GROUP BY product_id
HAVING COUNT(*) >= 20
ORDER BY average_relevance_score DESC
LIMIT 10;

SELECT
    COUNT(DISTINCT sr.product_id) AS search_result_products,
    COUNT(DISTINCT p.product_id) AS products_found_in_master,
    COUNT(DISTINCT CASE
        WHEN p.product_id IS NULL THEN sr.product_id
    END) AS products_missing_from_master
FROM search_results_clean sr
LEFT JOIN `products clean` p
    ON sr.product_id = p.product_id
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> '';
  
  DESCRIBE `products clean`;
  
  SELECT
    COUNT(DISTINCT sr.product_id) AS search_result_products,

    COUNT(DISTINCT p.`ï»¿product_id`) AS products_found_in_master,

    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL THEN sr.product_id
    END) AS products_missing_from_master

FROM search_results_clean sr

LEFT JOIN `products clean` p
    ON sr.product_id = p.`ï»¿product_id`

WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> '';
  
  SELECT DISTINCT
    sr.product_id
FROM search_results_clean sr
LEFT JOIN `products clean` p
    ON sr.product_id = p.`ï»¿product_id`
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> ''
  AND p.`ï»¿product_id` IS NULL
ORDER BY sr.product_id
LIMIT 20;

SELECT
    'Search Results' AS table_name,
    COUNT(DISTINCT product_id) AS unique_products
FROM search_results_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''

UNION ALL

SELECT
    'Product Master',
    COUNT(DISTINCT `ï»¿product_id`)
FROM `products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> '';
  
  SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT `ï»¿product_id`) AS unique_product_ids,
    COUNT(*) - COUNT(DISTINCT `ï»¿product_id`) AS duplicate_records
FROM `products clean`;

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN `ï»¿product_id` IS NULL
          OR TRIM(`ï»¿product_id`) = ''
        THEN 1 ELSE 0
    END) AS missing_product_ids,

    COUNT(DISTINCT `ï»¿product_id`) AS distinct_product_ids,

    COUNT(*) - COUNT(DISTINCT `ï»¿product_id`) AS extra_records

FROM `products clean`;

SELECT
    `ï»¿product_id`,
    COUNT(*) AS occurrence_count
FROM `products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY `ï»¿product_id`
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC
LIMIT 20;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE `ï»¿product_id` IN (
    'P00061',
    'P00633',
    'P01186'
)
ORDER BY `ï»¿product_id`;

SELECT
    `ï»¿product_id`,
    COUNT(*) AS total_records,
    COUNT(DISTINCT category) AS different_categories,
    COUNT(DISTINCT price) AS different_prices,
    COUNT(DISTINCT rating) AS different_ratings,
    COUNT(DISTINCT stock) AS different_stock_values
FROM `products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
GROUP BY `ï»¿product_id`
HAVING COUNT(*) > 1
ORDER BY different_categories DESC, total_records DESC
LIMIT 20;

SELECT
    COUNT(*) AS total_product_ids,

    SUM(CASE
        WHEN different_categories > 1 THEN 1 ELSE 0
    END) AS category_conflicts,

    SUM(CASE
        WHEN different_prices > 1 THEN 1 ELSE 0
    END) AS price_conflicts,

    SUM(CASE
        WHEN different_ratings > 1 THEN 1 ELSE 0
    END) AS rating_conflicts,

    SUM(CASE
        WHEN different_stock > 1 THEN 1 ELSE 0
    END) AS stock_conflicts

FROM (
    SELECT
        `ï»¿product_id`,
        COUNT(DISTINCT category) AS different_categories,
        COUNT(DISTINCT price) AS different_prices,
        COUNT(DISTINCT rating) AS different_ratings,
        COUNT(DISTINCT stock) AS different_stock
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
    GROUP BY `ï»¿product_id`
) AS product_check;

SELECT
    category,
    COUNT(*) AS total_records,
    COUNT(DISTINCT `ï»¿product_id`) AS unique_products,
    ROUND(AVG(price), 2) AS average_price,
    ROUND(AVG(rating), 3) AS average_rating
FROM `products clean`
WHERE category IS NOT NULL
  AND TRIM(category) <> ''
GROUP BY category
ORDER BY total_records DESC;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN rating < 0 THEN 1 ELSE 0 END) AS negative_ratings,
    SUM(CASE WHEN rating = 0 THEN 1 ELSE 0 END) AS zero_ratings,
    SUM(CASE WHEN rating BETWEEN 1 AND 5 THEN 1 ELSE 0 END) AS ratings_1_to_5,
    SUM(CASE WHEN rating > 5 THEN 1 ELSE 0 END) AS ratings_above_5,
    MIN(rating) AS minimum_rating,
    MAX(rating) AS maximum_rating
FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE rating < 0
ORDER BY rating;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS null_ratings,
    SUM(CASE WHEN rating = -999 THEN 1 ELSE 0 END) AS placeholder_ratings,
    SUM(CASE WHEN rating = 0 THEN 1 ELSE 0 END) AS zero_ratings,
    SUM(CASE
        WHEN rating > 0 AND rating <= 1
        THEN 1 ELSE 0
    END) AS valid_ratings
FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE rating = 0;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS null_prices,
    SUM(CASE WHEN price = 0 THEN 1 ELSE 0 END) AS zero_prices,
    SUM(CASE WHEN price < 0 THEN 1 ELSE 0 END) AS negative_prices,
    SUM(CASE WHEN price > 0 THEN 1 ELSE 0 END) AS positive_prices,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE price < 0
ORDER BY price;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN stock IS NULL THEN 1 ELSE 0 END) AS null_stock,
    SUM(CASE WHEN stock = 0 THEN 1 ELSE 0 END) AS zero_stock,
    SUM(CASE WHEN stock < 0 THEN 1 ELSE 0 END) AS negative_stock,
    SUM(CASE WHEN stock > 0 THEN 1 ELSE 0 END) AS positive_stock,
    MIN(stock) AS minimum_stock,
    MAX(stock) AS maximum_stock
FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE stock = 0;

SELECT
    COUNT(*) AS total_records,
    SUM(CASE
        WHEN category IS NULL OR TRIM(category) = ''
        THEN 1 ELSE 0
    END) AS missing_categories,
    COUNT(DISTINCT category) AS unique_categories
FROM `products clean`;

SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE category IS NULL
   OR TRIM(category) = '';
   
   SELECT
    `ï»¿product_id`,
    category,
    price,
    rating,
    stock
FROM `products clean`
WHERE `ï»¿product_id` IS NULL
   OR TRIM(`ï»¿product_id`) = '';
   
   SELECT
    category,
    COUNT(*) AS total_records,
    ROUND(AVG(price), 2) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    SUM(stock) AS total_stock,
    ROUND(AVG(stock), 2) AS average_stock
FROM `products clean`
WHERE category IS NOT NULL
  AND TRIM(category) <> ''
  AND price > 0
GROUP BY category
ORDER BY total_stock DESC;

SELECT
    COUNT(*) AS total_product_ids,
    SUM(CASE
        WHEN category_count > 1 THEN 1
        ELSE 0
    END) AS products_in_multiple_categories,
    SUM(CASE
        WHEN category_count = 1 THEN 1
        ELSE 0
    END) AS products_in_one_category
FROM (
    SELECT
        `ï»¿product_id`,
        COUNT(DISTINCT category) AS category_count
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
      AND category IS NOT NULL
      AND TRIM(category) <> ''
    GROUP BY `ï»¿product_id`
) AS category_check;

SELECT
    `ï»¿product_id`,
    COUNT(DISTINCT category) AS category_count,
    GROUP_CONCAT(
        DISTINCT category
        ORDER BY category
        SEPARATOR ', '
    ) AS categories
FROM `products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> ''
  AND category IS NOT NULL
  AND TRIM(category) <> ''
GROUP BY `ï»¿product_id`
HAVING COUNT(DISTINCT category) > 1
ORDER BY category_count DESC, `ï»¿product_id`
LIMIT 20;

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT CONCAT_WS(
        '|',
        COALESCE(`ï»¿product_id`, 'NULL'),
        COALESCE(category, 'NULL'),
        COALESCE(CAST(price AS CHAR), 'NULL'),
        COALESCE(CAST(rating AS CHAR), 'NULL'),
        COALESCE(CAST(stock AS CHAR), 'NULL')
    )) AS unique_complete_records,
    COUNT(*) - COUNT(DISTINCT CONCAT_WS(
        '|',
        COALESCE(`ï»¿product_id`, 'NULL'),
        COALESCE(category, 'NULL'),
        COALESCE(CAST(price AS CHAR), 'NULL'),
        COALESCE(CAST(rating AS CHAR), 'NULL'),
        COALESCE(CAST(stock AS CHAR), 'NULL')
    )) AS repeated_complete_records
FROM `products clean`;

SELECT
    COUNT(DISTINCT sr.product_id) AS search_result_products,
    COUNT(DISTINCT p.`ï»¿product_id`) AS matched_products,
    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN sr.product_id
    END) AS unmatched_products
FROM search_results_clean sr
LEFT JOIN (
    SELECT DISTINCT `ï»¿product_id`
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
ON sr.product_id = p.`ï»¿product_id`
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> '';
  
  SELECT
    COUNT(DISTINCT sc.product_id) AS clicked_products,
    COUNT(DISTINCT p.`ï»¿product_id`) AS matched_products,
    COUNT(DISTINCT CASE
        WHEN p.`ï»¿product_id` IS NULL
        THEN sc.product_id
    END) AS unmatched_products
FROM search_clicks_clean sc
LEFT JOIN (
    SELECT DISTINCT `ï»¿product_id`
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
ON sc.product_id = p.`ï»¿product_id`
WHERE sc.product_id IS NOT NULL
  AND TRIM(sc.product_id) <> '';
  
  SELECT
    'Search Results' AS source_table,
    COUNT(DISTINCT product_id) AS unique_products
FROM search_results_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''

UNION ALL

SELECT
    'Search Clicks',
    COUNT(DISTINCT product_id)
FROM search_clicks_clean
WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''

UNION ALL

SELECT
    'Product Master',
    COUNT(DISTINCT `ï»¿product_id`)
FROM `products clean`
WHERE `ï»¿product_id` IS NOT NULL
  AND TRIM(`ï»¿product_id`) <> '';
  
  SELECT
    COUNT(*) AS products_in_both_tables
FROM (
    SELECT DISTINCT product_id
    FROM search_results_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) sr
INNER JOIN (
    SELECT DISTINCT product_id
    FROM search_clicks_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
) sc
ON sr.product_id = sc.product_id;

SELECT
    COUNT(DISTINCT sr.product_id) AS unmatched_product_ids
FROM search_results_clean sr
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> ''
  AND NOT EXISTS (
      SELECT 1
      FROM `products clean` p
      WHERE p.`ï»¿product_id` = sr.product_id
  );
  
  SELECT
    sr.product_id,
    COUNT(*) AS total_search_appearances
FROM search_results_clean sr
WHERE sr.product_id IS NOT NULL
  AND TRIM(sr.product_id) <> ''
  AND NOT EXISTS (
      SELECT 1
      FROM `products clean` p
      WHERE p.`ï»¿product_id` = sr.product_id
  )
GROUP BY sr.product_id
ORDER BY total_search_appearances DESC
LIMIT 20;


SELECT
    sc.product_id,
    COUNT(*) AS total_clicks
FROM search_clicks_clean sc
WHERE sc.product_id IS NOT NULL
  AND TRIM(sc.product_id) <> ''
  AND NOT EXISTS (
      SELECT 1
      FROM `products clean` p
      WHERE p.`ï»¿product_id` = sc.product_id
  )
GROUP BY sc.product_id
ORDER BY total_clicks DESC
LIMIT 20;

SELECT
    sr.product_id,
    sr.total_impressions,
    sc.total_clicks
FROM (
    SELECT
        product_id,
        COUNT(*) AS total_impressions
    FROM search_results_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY product_id
) sr
INNER JOIN (
    SELECT
        product_id,
        COUNT(*) AS total_clicks
    FROM search_clicks_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY product_id
) sc
    ON sr.product_id = sc.product_id
WHERE NOT EXISTS (
    SELECT 1
    FROM `products clean` p
    WHERE p.`ï»¿product_id` = sr.product_id
)
ORDER BY sc.total_clicks DESC
LIMIT 20;

SELECT
    sr.product_id,
    sr.total_impressions,
    sc.total_clicks,
    ROUND(
        sc.total_clicks * 100.0 /
        NULLIF(sr.total_impressions, 0),
        2
    ) AS preliminary_click_ratio
FROM (
    SELECT
        product_id,
        COUNT(*) AS total_impressions
    FROM search_results_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY product_id
) sr
INNER JOIN (
    SELECT
        product_id,
        COUNT(*) AS total_clicks
    FROM search_clicks_clean
    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
    GROUP BY product_id
) sc
    ON sr.product_id = sc.product_id
WHERE NOT EXISTS (
    SELECT 1
    FROM `products clean` p
    WHERE p.`ï»¿product_id` = sr.product_id
)
ORDER BY preliminary_click_ratio DESC
LIMIT 20;
SELECT
    o.product_id,
    COUNT(*) AS total_orders
FROM orders_clean o
WHERE o.product_id IS NOT NULL
  AND TRIM(o.product_id) <> ''
  AND NOT EXISTS (
      SELECT 1
      FROM `products clean` p
      WHERE p.`ï»¿product_id` = o.product_id
  )
GROUP BY o.product_id
ORDER BY total_orders DESC
LIMIT 20;

SELECT
    COUNT(*) AS total_order_records,
    SUM(
        CASE
            WHEN p.`ï»¿product_id` IS NULL
            THEN 1 ELSE 0
        END
    ) AS orders_with_missing_products,
    ROUND(
        SUM(
            CASE
                WHEN p.`ï»¿product_id` IS NULL
                THEN 1 ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS missing_product_order_percentage
FROM orders_clean o
LEFT JOIN (
    SELECT DISTINCT `ï»¿product_id`
    FROM `products clean`
    WHERE `ï»¿product_id` IS NOT NULL
      AND TRIM(`ï»¿product_id`) <> ''
) p
    ON o.product_id = p.`ï»¿product_id`
WHERE o.product_id IS NOT NULL
  AND TRIM(o.product_id) <> '';
  
  SELECT
    COUNT(*) AS total_order_records,
    SUM(
        CASE
            WHEN product_id IS NULL
              OR TRIM(product_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_product_ids,
    SUM(
        CASE
            WHEN product_id IS NOT NULL
             AND TRIM(product_id) <> ''
            THEN 1 ELSE 0
        END
    ) AS valid_product_ids
FROM orders_clean;
  
  SELECT
    status,
    COUNT(*) AS total_orders
FROM orders_clean
GROUP BY status
ORDER BY total_orders DESC;
  

USE search_discovery;

DESCRIBE orders_clean;

SELECT
    source,
    COUNT(*) AS total_orders,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(gmv), 2) AS average_gmv,
    ROUND(SUM(margin), 2) AS total_margin
FROM orders_clean
GROUP BY source
ORDER BY total_gmv DESC;

SELECT
    COUNT(*) AS total_records,

    SUM(CASE WHEN gmv IS NULL THEN 1 ELSE 0 END) AS null_gmv,
    SUM(CASE WHEN gmv = 0 THEN 1 ELSE 0 END) AS zero_gmv,
    SUM(CASE WHEN gmv < 0 THEN 1 ELSE 0 END) AS negative_gmv,

    SUM(CASE WHEN margin IS NULL THEN 1 ELSE 0 END) AS null_margin,
    SUM(CASE WHEN margin = 0 THEN 1 ELSE 0 END) AS zero_margin,
    SUM(CASE WHEN margin < 0 THEN 1 ELSE 0 END) AS negative_margin

FROM orders_clean;

SELECT
    order_id,
    customer_id,
    product_id,
    source,
    gmv,
    margin
FROM orders_clean
WHERE gmv < 0
ORDER BY gmv;

SELECT
    order_id,
    customer_id,
    product_id,
    source,
    gmv,
    margin
FROM orders_clean
WHERE margin = 0;

SELECT
    order_id,
    customer_id,
    product_id,
    source,
    gmv,
    margin
FROM orders_clean
WHERE margin < 0
ORDER BY margin;

SELECT
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN source IS NULL
              OR TRIM(source) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_sources,
    COUNT(DISTINCT source) AS distinct_sources
FROM orders_clean;

SELECT
    source,
    COUNT(*) AS valid_order_records,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(gmv), 2) AS average_gmv
FROM orders_clean
WHERE gmv > 0
  AND source IS NOT NULL
  AND TRIM(source) <> ''
GROUP BY source
ORDER BY total_gmv DESC;

SELECT
    source,
    COUNT(*) AS valid_margin_records,
    ROUND(SUM(margin), 2) AS total_margin,
    ROUND(AVG(margin), 4) AS average_margin
FROM orders_clean
WHERE margin <> -999
  AND margin IS NOT NULL
  AND source IS NOT NULL
  AND TRIM(source) <> ''
GROUP BY source
ORDER BY total_margin DESC;

SELECT
    COUNT(*) AS total_records,
    MIN(margin) AS minimum_margin,
    MAX(margin) AS maximum_margin,
    SUM(CASE
        WHEN margin >= 0 AND margin <= 1
        THEN 1 ELSE 0
    END) AS values_between_0_and_1,
    SUM(CASE
        WHEN margin < 0 AND margin <> -999
        THEN 1 ELSE 0
    END) AS other_negative_values,
    SUM(CASE
        WHEN margin > 1
        THEN 1 ELSE 0
    END) AS values_above_1
FROM orders_clean
WHERE margin IS NOT NULL
  AND margin <> -999;
  
  SELECT
    source,
    COUNT(*) AS valid_orders,
    ROUND(AVG(gmv), 2) AS average_gmv,
    ROUND(AVG(margin), 4) AS average_margin_ratio,
    ROUND(AVG(margin) * 100, 2) AS average_margin_percentage
FROM orders_clean
WHERE gmv > 0
  AND margin <> -999
  AND margin IS NOT NULL
  AND source IS NOT NULL
  AND TRIM(source) <> ''
GROUP BY source
ORDER BY average_gmv DESC;

SELECT
    COUNT(*) AS total_order_records,

    SUM(CASE
        WHEN gmv > 0 THEN 1 ELSE 0
    END) AS valid_gmv_records,

    ROUND(SUM(
        CASE WHEN gmv > 0 THEN gmv ELSE 0 END
    ), 2) AS total_valid_gmv,

    ROUND(AVG(
        CASE WHEN gmv > 0 THEN gmv END
    ), 2) AS average_order_gmv,

    ROUND(AVG(
        CASE WHEN margin <> -999 THEN margin END
    ) * 100, 2) AS overall_average_margin_percentage

FROM orders_clean;

SELECT
    COUNT(*) AS total_order_records,

    SUM(CASE
        WHEN gmv > 0 THEN 1 ELSE 0
    END) AS valid_gmv_records,

    ROUND(SUM(
        CASE WHEN gmv > 0 THEN gmv ELSE 0 END
    ), 2) AS total_valid_gmv,

    ROUND(AVG(
        CASE WHEN gmv > 0 THEN gmv END
    ), 2) AS average_order_gmv,

    ROUND(AVG(
        CASE WHEN margin <> -999 THEN margin END
    ) * 100, 2) AS overall_average_margin_percentage

FROM orders_clean;

SELECT
    CASE
        WHEN source IS NULL OR TRIM(source) = ''
        THEN 'Missing / Unknown'
        ELSE source
    END AS sales_source,

    COUNT(*) AS valid_orders,

    ROUND(SUM(gmv), 2) AS total_gmv,

    ROUND(
        SUM(gmv) * 100.0 /
        (SELECT SUM(gmv)
         FROM orders_clean
         WHERE gmv > 0),
        2
    ) AS gmv_contribution_percentage

FROM orders_clean
WHERE gmv > 0
GROUP BY
    CASE
        WHEN source IS NULL OR TRIM(source) = ''
        THEN 'Missing / Unknown'
        ELSE source
    END
ORDER BY total_gmv DESC;

SELECT
    CASE
        WHEN source IS NULL OR TRIM(source) = ''
        THEN 'Missing / Unknown'
        ELSE source
    END AS sales_source,

    COUNT(*) AS valid_orders,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM orders_clean
         WHERE gmv > 0),
        2
    ) AS order_contribution_percentage,

    ROUND(AVG(gmv), 2) AS average_order_gmv,

    ROUND(
        SUM(gmv) * 100.0 /
        (SELECT SUM(gmv)
         FROM orders_clean
         WHERE gmv > 0),
        2
    ) AS gmv_contribution_percentage

FROM orders_clean
WHERE gmv > 0
GROUP BY
    CASE
        WHEN source IS NULL OR TRIM(source) = ''
        THEN 'Missing / Unknown'
        ELSE source
    END
ORDER BY gmv_contribution_percentage DESC;

SELECT
    COUNT(*) AS total_order_records,

    COUNT(DISTINCT customer_id) AS unique_customers,

    SUM(
        CASE
            WHEN customer_id IS NULL
              OR TRIM(customer_id) = ''
            THEN 1 ELSE 0
        END
    ) AS missing_customer_ids,

    COUNT(*) - COUNT(DISTINCT customer_id) AS records_beyond_unique_customer_count

FROM orders_clean;

SELECT
    customer_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(gmv), 2) AS total_gmv,
    ROUND(AVG(gmv), 2) AS average_order_gmv

FROM orders_clean

WHERE customer_id IS NOT NULL
  AND TRIM(customer_id) <> ''
  AND gmv > 0

GROUP BY customer_id

HAVING COUNT(*) > 1

ORDER BY total_orders DESC

LIMIT 20;

SELECT
    order_frequency,
    COUNT(*) AS number_of_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(DISTINCT customer_id)
         FROM orders_clean
         WHERE customer_id IS NOT NULL
           AND TRIM(customer_id) <> ''),
        2
    ) AS customer_percentage

FROM (
    SELECT
        customer_id,
        COUNT(*) AS order_frequency
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_orders

GROUP BY order_frequency
ORDER BY order_frequency;


SELECT
    customer_id,
    COUNT(*) AS total_order_records,

    SUM(
        CASE WHEN gmv > 0
        THEN 1 ELSE 0 END
    ) AS valid_gmv_orders,

    SUM(
        CASE WHEN gmv <= 0
        THEN 1 ELSE 0 END
    ) AS non_positive_gmv_orders

FROM orders_clean

WHERE customer_id IS NOT NULL
  AND TRIM(customer_id) <> ''

GROUP BY customer_id

HAVING SUM(
    CASE WHEN gmv > 0
    THEN 1 ELSE 0 END
) = 0;

SELECT
    COUNT(DISTINCT customer_id) AS distinct_customer_ids,

    COUNT(DISTINCT CASE
        WHEN TRIM(customer_id) <> ''
        THEN customer_id
    END) AS valid_unique_customers,

    SUM(CASE
        WHEN customer_id IS NULL
          OR TRIM(customer_id) = ''
        THEN 1 ELSE 0
    END) AS missing_customer_records

FROM orders_clean;

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN order_count = 1 THEN 1
        ELSE 0
    END) AS one_time_customers,

    SUM(CASE
        WHEN order_count > 1 THEN 1
        ELSE 0
    END) AS repeat_customers,

    ROUND(
        SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS repeat_customer_percentage,

    ROUND(AVG(order_count), 2) AS average_orders_per_customer

FROM (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_summary;

SELECT
    customer_id,

    COUNT(*) AS total_orders,

    ROUND(SUM(gmv), 2) AS total_customer_gmv,

    ROUND(AVG(gmv), 2) AS average_order_gmv

FROM orders_clean

WHERE customer_id IS NOT NULL
  AND TRIM(customer_id) <> ''
  AND gmv > 0

GROUP BY customer_id

ORDER BY total_customer_gmv DESC

LIMIT 20;

SELECT
    customer_id,

    COUNT(*) AS total_orders,

    ROUND(SUM(gmv), 2) AS total_customer_gmv,

    ROUND(AVG(gmv), 2) AS average_order_gmv,

    CASE
        WHEN COUNT(*) >= 8
         AND SUM(gmv) >= 15000
            THEN 'High Frequency - High Value'

        WHEN COUNT(*) >= 8
            THEN 'High Frequency'

        WHEN SUM(gmv) >= 15000
            THEN 'High Value'

        ELSE 'Regular Customer'
    END AS customer_segment

FROM orders_clean

WHERE customer_id IS NOT NULL
  AND TRIM(customer_id) <> ''
  AND gmv > 0

GROUP BY customer_id

HAVING COUNT(*) >= 8
    OR SUM(gmv) >= 15000

ORDER BY total_customer_gmv DESC

LIMIT 30;

SELECT
    customer_segment,

    COUNT(*) AS total_customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage,

    SUM(total_orders) AS total_orders,

    ROUND(SUM(total_customer_gmv), 2) AS total_gmv,

    ROUND(AVG(total_customer_gmv), 2) AS average_customer_gmv

FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        SUM(gmv) AS total_customer_gmv,

        CASE
            WHEN COUNT(*) >= 8
             AND SUM(gmv) >= 15000
                THEN 'High Frequency - High Value'

            WHEN COUNT(*) >= 8
                THEN 'High Frequency'

            WHEN SUM(gmv) >= 15000
                THEN 'High Value'

            ELSE 'Regular Customer'
        END AS customer_segment

    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_segments

GROUP BY customer_segment
ORDER BY total_gmv DESC;

SELECT
    customer_segment,

    COUNT(*) AS total_customers,

    ROUND(SUM(total_customer_gmv), 2) AS total_gmv,

    ROUND(
        SUM(total_customer_gmv) * 100.0 /
        SUM(SUM(total_customer_gmv)) OVER (),
        2
    ) AS gmv_contribution_percentage,

    ROUND(AVG(total_customer_gmv), 2) AS average_gmv_per_customer,

    ROUND(AVG(total_orders), 2) AS average_orders_per_customer

FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        SUM(gmv) AS total_customer_gmv,

        CASE
            WHEN COUNT(*) >= 8 AND SUM(gmv) >= 15000
                THEN 'High Frequency - High Value'
            WHEN COUNT(*) >= 8
                THEN 'High Frequency'
            WHEN SUM(gmv) >= 15000
                THEN 'High Value'
            ELSE 'Regular Customer'
        END AS customer_segment

    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_segments

GROUP BY customer_segment
ORDER BY gmv_contribution_percentage DESC;

SELECT
    COUNT(*) AS top_10_customers,

    ROUND(SUM(total_customer_gmv), 2) AS top_10_total_gmv,

    ROUND(AVG(total_customer_gmv), 2) AS average_gmv_per_customer,

    ROUND(
        SUM(total_customer_gmv) * 100.0 /
        (SELECT SUM(gmv)
         FROM orders_clean
         WHERE gmv > 0),
        2
    ) AS percentage_of_overall_gmv

FROM (
    SELECT
        customer_id,
        SUM(gmv) AS total_customer_gmv
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
    ORDER BY total_customer_gmv DESC
    LIMIT 10
) AS top_customers;

WITH customer_gmv AS (
    SELECT
        customer_id,
        SUM(gmv) AS total_customer_gmv
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        total_customer_gmv,
        ROW_NUMBER() OVER (
            ORDER BY total_customer_gmv DESC, customer_id
        ) AS customer_rank,
        COUNT(*) OVER () AS total_customers
    FROM customer_gmv
)
SELECT
    COUNT(*) AS top_10_percent_customers,

    ROUND(SUM(total_customer_gmv), 2) AS top_10_percent_gmv,

    ROUND(
        SUM(total_customer_gmv) * 100.0 /
        (SELECT SUM(gmv)
         FROM orders_clean
         WHERE gmv > 0),
        2
    ) AS overall_gmv_contribution_percentage

FROM ranked_customers
WHERE customer_rank <= CEIL(total_customers * 0.10);

WITH customer_gmv AS (
    SELECT
        customer_id,
        SUM(gmv) AS total_customer_gmv
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        customer_id,
        total_customer_gmv,
        ROW_NUMBER() OVER (
            ORDER BY total_customer_gmv DESC, customer_id
        ) AS customer_rank,
        COUNT(*) OVER () AS total_customers
    FROM customer_gmv
)
SELECT
    CASE
        WHEN customer_rank <= CEIL(total_customers * 0.10)
        THEN 'Top 10% Customers'
        ELSE 'Remaining 90% Customers'
    END AS customer_group,

    COUNT(*) AS total_customers,

    ROUND(SUM(total_customer_gmv), 2) AS total_gmv,

    ROUND(AVG(total_customer_gmv), 2) AS average_gmv_per_customer,

    ROUND(
        SUM(total_customer_gmv) * 100.0 /
        (SELECT SUM(gmv)
         FROM orders_clean
         WHERE gmv > 0),
        2
    ) AS gmv_contribution_percentage

FROM ranked_customers

GROUP BY customer_group
ORDER BY total_gmv DESC;

SELECT
    customer_value_segment,
    COUNT(*) AS total_customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage,

    ROUND(SUM(total_customer_gmv), 2) AS total_gmv,

    ROUND(AVG(total_customer_gmv), 2) AS average_gmv_per_customer

FROM (
    SELECT
        customer_id,
        SUM(gmv) AS total_customer_gmv,

        CASE
            WHEN SUM(gmv) < 5000
                THEN 'Low Value'
            WHEN SUM(gmv) < 15000
                THEN 'Medium Value'
            ELSE 'High Value'
        END AS customer_value_segment

    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_values

GROUP BY customer_value_segment
ORDER BY total_gmv DESC;

SELECT
    customer_value_segment,

    COUNT(*) AS total_customers,

    ROUND(AVG(total_orders), 2) AS average_orders_per_customer,

    ROUND(AVG(total_customer_gmv), 2) AS average_gmv_per_customer,

    ROUND(AVG(average_order_gmv), 2) AS average_order_value

FROM (
    SELECT
        customer_id,

        COUNT(*) AS total_orders,

        SUM(gmv) AS total_customer_gmv,

        AVG(gmv) AS average_order_gmv,

        CASE
            WHEN SUM(gmv) < 5000
                THEN 'Low Value'
            WHEN SUM(gmv) < 15000
                THEN 'Medium Value'
            ELSE 'High Value'
        END AS customer_value_segment

    FROM orders_clean

    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0

    GROUP BY customer_id
) AS customer_analysis

GROUP BY customer_value_segment

ORDER BY average_gmv_per_customer DESC;

SELECT
    COUNT(*) AS total_customers,

    ROUND(MIN(total_customer_gmv), 2) AS minimum_customer_gmv,

    ROUND(MAX(total_customer_gmv), 2) AS maximum_customer_gmv,

    ROUND(AVG(total_customer_gmv), 2) AS average_customer_gmv,

    ROUND(
        SUM(total_customer_gmv),
        2
    ) AS total_customer_gmv

FROM (
    SELECT
        customer_id,
        SUM(gmv) AS total_customer_gmv
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_spending;

WITH customer_spending AS (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        ROUND(SUM(gmv), 2) AS total_customer_gmv,
        ROUND(AVG(gmv), 2) AS average_order_gmv
    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY total_customer_gmv DESC
        ) AS highest_rank,
        ROW_NUMBER() OVER (
            ORDER BY total_customer_gmv ASC
        ) AS lowest_rank
    FROM customer_spending
)
SELECT
    customer_id,
    total_orders,
    total_customer_gmv,
    average_order_gmv,
    CASE
        WHEN highest_rank = 1 THEN 'Highest Spending'
        WHEN lowest_rank = 1 THEN 'Lowest Spending'
    END AS spending_category
FROM ranked_customers
WHERE highest_rank = 1
   OR lowest_rank = 1;
   
   SELECT
    customer_value_segment,

    COUNT(*) AS total_customers,

    SUM(total_orders) AS total_orders,

    ROUND(AVG(total_orders), 2) AS average_orders_per_customer,

    ROUND(SUM(total_customer_gmv), 2) AS total_gmv,

    ROUND(
        SUM(total_orders) * 100.0 /
        SUM(SUM(total_orders)) OVER (),
        2
    ) AS order_contribution_percentage

FROM (
    SELECT
        customer_id,
        COUNT(*) AS total_orders,
        SUM(gmv) AS total_customer_gmv,

        CASE
            WHEN SUM(gmv) < 5000 THEN 'Low Value'
            WHEN SUM(gmv) < 15000 THEN 'Medium Value'
            ELSE 'High Value'
        END AS customer_value_segment

    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
) AS customer_analysis

GROUP BY customer_value_segment
ORDER BY total_orders DESC;

WITH customer_segments AS (
    SELECT
        customer_id,
        SUM(gmv) AS customer_gmv,

        CASE
            WHEN SUM(gmv) < 5000 THEN 'Low Value'
            WHEN SUM(gmv) < 15000 THEN 'Medium Value'
            ELSE 'High Value'
        END AS customer_segment

    FROM orders_clean
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0
    GROUP BY customer_id
)

SELECT
    cs.customer_segment,

    COUNT(*) AS valid_orders,

    ROUND(SUM(o.gmv), 2) AS total_gmv,

    ROUND(AVG(o.margin) * 100, 2)
        AS average_margin_percentage,

    ROUND(
        SUM(o.gmv * o.margin) * 100.0 /
        SUM(o.gmv),
        2
    ) AS weighted_margin_percentage

FROM orders_clean o

INNER JOIN customer_segments cs
    ON o.customer_id = cs.customer_id

WHERE o.gmv > 0
  AND o.margin <> -999
  AND o.margin IS NOT NULL

GROUP BY cs.customer_segment

ORDER BY weighted_margin_percentage DESC;

WITH customer_segments AS (
    SELECT
        customer_id,

        CASE
            WHEN SUM(gmv) < 5000 THEN 'Low Value'
            WHEN SUM(gmv) < 15000 THEN 'Medium Value'
            ELSE 'High Value'
        END AS customer_segment

    FROM orders_clean

    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
      AND gmv > 0

    GROUP BY customer_id
)

SELECT
    cs.customer_segment,

    COUNT(*) AS valid_orders,

    ROUND(SUM(o.gmv), 2) AS total_gmv,

    ROUND(SUM(o.gmv * o.margin), 2)
        AS estimated_margin_amount,

    ROUND(
        SUM(o.gmv * o.margin) * 100.0 / SUM(o.gmv),
        2
    ) AS weighted_margin_percentage

FROM orders_clean o

INNER JOIN customer_segments cs
    ON o.customer_id = cs.customer_id

WHERE o.gmv > 0
  AND o.margin <> -999
  AND o.margin IS NOT NULL

GROUP BY cs.customer_segment

ORDER BY estimated_margin_amount DESC;

SELECT
    product_id,

    COUNT(*) AS total_orders,

    ROUND(SUM(gmv), 2) AS total_gmv,

    ROUND(AVG(gmv), 2) AS average_order_gmv,

    ROUND(AVG(margin) * 100, 2) AS average_margin_percentage

FROM orders_clean

WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
  AND gmv > 0
  AND margin <> -999

GROUP BY product_id

ORDER BY total_gmv DESC

LIMIT 20;

SELECT
    product_id,

    COUNT(*) AS total_orders,

    ROUND(SUM(gmv), 2) AS total_gmv,

    ROUND(AVG(gmv), 2) AS average_order_gmv,

    ROUND(AVG(margin) * 100, 2) AS average_margin_percentage

FROM orders_clean

WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
  AND gmv > 0
  AND margin <> -999

GROUP BY product_id

HAVING SUM(gmv) > 20000
   AND AVG(margin) < 0.40

ORDER BY total_gmv DESC

LIMIT 20;
SELECT
    product_id,

    COUNT(*) AS total_orders,

    ROUND(SUM(gmv), 2) AS total_gmv,

    ROUND(AVG(gmv), 2) AS average_order_gmv,

    ROUND(AVG(margin) * 100, 2)
        AS average_margin_percentage

FROM orders_clean

WHERE product_id IS NOT NULL
  AND TRIM(product_id) <> ''
  AND gmv > 0
  AND margin <> -999

GROUP BY product_id

HAVING AVG(margin) >= 0.55
   AND SUM(gmv) > 10000

ORDER BY average_margin_percentage DESC

LIMIT 20;

SELECT
    CASE
        WHEN average_margin < 0.40 THEN 'Low Margin'
        WHEN average_margin < 0.55 THEN 'Medium Margin'
        ELSE 'High Margin'
    END AS margin_category,

    COUNT(*) AS total_products,

    ROUND(AVG(total_gmv), 2) AS average_product_gmv,

    ROUND(SUM(total_gmv), 2) AS total_gmv,

    ROUND(AVG(average_margin) * 100, 2)
        AS average_margin_percentage

FROM (
    SELECT
        product_id,
        SUM(gmv) AS total_gmv,
        AVG(margin) AS average_margin

    FROM orders_clean

    WHERE product_id IS NOT NULL
      AND TRIM(product_id) <> ''
      AND gmv > 0
      AND margin <> -999

    GROUP BY product_id
) AS product_analysis

GROUP BY margin_category

ORDER BY total_products DESC;

SHOW TABLES;

DESCRIBE orders_clean;

DESCRIBE `products clean`;

DESCRIBE `customers clean`;

SELECT
    device,
    COUNT(*) AS total_customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage

FROM `customers clean`

WHERE device IS NOT NULL
  AND TRIM(device) <> ''

GROUP BY device

ORDER BY total_customers DESC;

SELECT
    city,

    COUNT(*) AS total_customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage

FROM `customers clean`

WHERE city IS NOT NULL
  AND TRIM(city) <> ''

GROUP BY city

ORDER BY total_customers DESC;

SELECT
    segment,

    COUNT(*) AS total_customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage

FROM `customers clean`

WHERE segment IS NOT NULL
  AND TRIM(segment) <> ''

GROUP BY segment

ORDER BY total_customers DESC;


SELECT
    segment,
    device,

    COUNT(*) AS total_customers,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY segment),
        2
    ) AS percentage_within_segment

FROM `customers clean`

WHERE segment IS NOT NULL
  AND TRIM(segment) <> ''
  AND device IS NOT NULL
  AND TRIM(device) <> ''

GROUP BY segment, device

ORDER BY segment, total_customers DESC;

SELECT
    (SELECT COUNT(DISTINCT customer_id)
     FROM `customers clean`
     WHERE customer_id IS NOT NULL
       AND TRIM(customer_id) <> '') AS total_customers,

    (SELECT COUNT(*)
     FROM orders_clean) AS total_order_records,

    (SELECT COUNT(*)
     FROM orders_clean
     WHERE gmv > 0) AS valid_gmv_orders,

    (SELECT ROUND(SUM(gmv), 2)
     FROM orders_clean
     WHERE gmv > 0) AS total_gmv,

    (SELECT ROUND(AVG(gmv), 2)
     FROM orders_clean
     WHERE gmv > 0) AS average_order_gmv,

    (SELECT COUNT(DISTINCT product_id)
     FROM orders_clean
     WHERE product_id IS NOT NULL
       AND TRIM(product_id) <> '') AS unique_ordered_products,

    (SELECT COUNT(DISTINCT customer_id)
     FROM orders_clean
     WHERE customer_id IS NOT NULL
       AND TRIM(customer_id) <> '') AS unique_ordering_customers;
       
       SELECT
    COUNT(DISTINCT o.customer_id) AS ordering_customers,

    COUNT(DISTINCT c.customer_id) AS matched_customers,

    COUNT(DISTINCT CASE
        WHEN c.customer_id IS NULL
        THEN o.customer_id
    END) AS unmatched_customers,

    ROUND(
        COUNT(DISTINCT c.customer_id) * 100.0 /
        COUNT(DISTINCT o.customer_id),
        2
    ) AS customer_match_percentage

FROM orders_clean o

LEFT JOIN (
    SELECT DISTINCT customer_id
    FROM `customers clean`
    WHERE customer_id IS NOT NULL
      AND TRIM(customer_id) <> ''
) c
    ON o.customer_id = c.customer_id

WHERE o.customer_id IS NOT NULL
  AND TRIM(o.customer_id) <> '';
  
  
  SELECT
    'Orders' AS table_name,

    COUNT(*) AS total_records,

    SUM(CASE
        WHEN gmv = -999 THEN 1
        ELSE 0
    END) AS invalid_records

FROM orders_clean

UNION ALL

SELECT
    'Products',

    COUNT(*),

    SUM(CASE
        WHEN `ï»¿product_id` IS NULL
          OR TRIM(`ï»¿product_id`) = ''
          OR price = -999
          OR rating = -999
        THEN 1
        ELSE 0
    END)

FROM `products clean`

UNION ALL

SELECT
    'Customers',

    COUNT(*),

    SUM(CASE
        WHEN customer_id IS NULL
          OR TRIM(customer_id) = ''
        THEN 1
        ELSE 0
    END)

FROM `customers clean`

UNION ALL

SELECT
    'Search Results',

    COUNT(*),

    SUM(CASE
        WHEN query_id IS NULL
          OR TRIM(query_id) = ''
          OR product_id IS NULL
          OR TRIM(product_id) = ''
          OR rank = -999
        THEN 1
        ELSE 0
    END)

FROM search_results_clean

UNION ALL

SELECT
    'Search Clicks',

    COUNT(*),

    SUM(CASE
        WHEN query_id IS NULL
          OR TRIM(query_id) = ''
          OR product_id IS NULL
          OR TRIM(product_id) = ''
          OR rank = -999
        THEN 1
        ELSE 0
    END)

FROM search_clicks_clean;


SELECT
    'Orders' AS table_name,
    COUNT(*) AS total_records,
    SUM(CASE WHEN gmv = -999 THEN 1 ELSE 0 END) AS invalid_records
FROM orders_clean

UNION ALL

SELECT
    'Products',
    COUNT(*),
    SUM(CASE
        WHEN `ï»¿product_id` IS NULL
        OR TRIM(`ï»¿product_id`) = ''
        OR price = -999
        OR rating = -999
        THEN 1 ELSE 0
    END)
FROM `products clean`

UNION ALL

SELECT
    'Customers',
    COUNT(*),
    SUM(CASE
        WHEN customer_id IS NULL
        OR TRIM(customer_id) = ''
        THEN 1 ELSE 0
    END)
FROM `customers clean`

UNION ALL

SELECT
    'Search Results',
    COUNT(*),
    SUM(CASE
        WHEN query_id IS NULL
        OR TRIM(query_id) = ''
        OR product_id IS NULL
        OR TRIM(product_id) = ''
        OR `rank` = -999
        THEN 1 ELSE 0
    END)
FROM search_results_clean

UNION ALL

SELECT
    'Search Clicks',
    COUNT(*),
    SUM(CASE
        WHEN query_id IS NULL
        OR TRIM(query_id) = ''
        OR product_id IS NULL
        OR TRIM(product_id) = ''
        OR `rank` = -999
        THEN 1 ELSE 0
    END)
FROM search_clicks_clean;