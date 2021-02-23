-- NOTE: sample_dateが前のレコードを取得する
-- SELECT sample_date AS cur_date,
--         load_val AS cur_load,
--         MIN(sample_date) OVER W AS latest_Date,
--         MIN(load_val) OVER W AS latest_load
--     FROM LoadSample
-- WINDOW W AS (ORDER BY sample_date ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING);

-- NOTE: sample_dateが次のレコードを取得する
-- SELECT sample_date AS cur_date,
--         load_val AS cur_load,
--         MIN(sample_date) OVER W AS next_Date,
--         MIN(load_val) OVER W AS next_load
--     FROM LoadSample
-- WINDOW W AS (ORDER BY sample_date ASC ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING);

-- NOTE: フレームの範囲を1行にしてるのでmaxでも同じ値が変える
-- SELECT sample_date AS cur_date,
--         load_val AS cur_load,
--         MAX(sample_date) OVER W AS next_Date,
--         MAX(load_val) OVER W AS next_load
--     FROM LoadSample
-- WINDOW W AS (ORDER BY sample_date ASC ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING);

-- NOTE: 1日前や2日前のみに該当するデータも取れる
-- SELECT sample_date AS cur_date,
--         load_val AS cur_load,
--         MAX(sample_date) OVER W AS day1_before,
--         MAX(load_val) OVER W AS load_day1_before
--     FROM LoadSample
-- WINDOW W AS (ORDER BY sample_date ASC RANGE BETWEEN interval '1' day PRECEDING AND interval '1' day PRECEDING);

-- NOTE: 基準の列から1日前、2日前、3日前を同一行に取得する
SELECT sample_date AS cur_date,
    load_val AS cur_load,
    MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS latest_1,
    MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 2 PRECEDING AND 2 PRECEDING) AS latest_2,
    MIN(sample_date) OVER (ORDER BY sample_date ASC ROWS BETWEEN 3 PRECEDING AND 3 PRECEDING) AS latest_3
FROM LoadSample;
