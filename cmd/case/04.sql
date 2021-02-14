SELECT
    CASE
        WHEN sex = '1' THEN '男'
        WHEN sex = '2' THEN '女'
        ELSE NULL END AS '性別',
    CASE
        WHEN sex = '1' THEN SUM(CASE WHEN sex = '1' THEN population ELSE 0 END)
        WHEN sex = '2' THEN SUM(CASE WHEN sex = '2' THEN population ELSE 0 END)
        ELSE 0 END AS '全国',
    CASE
        WHEN sex = '1' THEN SUM(CASE WHEN sex = '1' AND pref_name = '徳島' THEN population ELSE 0 END)
        WHEN sex = '2' THEN SUM(CASE WHEN sex = '2' AND pref_name = '徳島' THEN population ELSE 0 END)
        ELSE 0 END AS '徳島'
FROM PopTbl2
GROUP BY sex;