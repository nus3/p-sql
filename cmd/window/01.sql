EXPLAIN SELECT shohin_id, shohin_mei, hanbai_tanka, AVG(hanbai_tanka) OVER W AS moving_avg FROM Shohin
WINDOW W AS (ORDER BY shohin_id ROWS BETWEEN 2 PRECEDING AND CURRENT ROW);
