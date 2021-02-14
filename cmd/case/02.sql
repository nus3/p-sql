SELECT CASE WHEN population < 100 THEN '100人未満'
        WHEN population >= 100 AND population < 200 THEN '100人以上200人未満'
        WHEN population >= 200 AND population < 300 THEN '200人以上300人未満'
        WHEN population >= 300 THEN '300人以上'
    ELSE NULL END AS pop_class,
    COUNT(*) AS cnt
FROM Poptbl
GROUP BY pop_class;
