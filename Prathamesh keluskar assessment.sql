SELECT TOP 5 b.name AS brand, COUNT(r.id) AS total_receipts_scanned
FROM receipt_table_new r
INNER JOIN brand_table b ON r.id = b.id
INNER JOIN user_table u ON r.userId = u.id
WHERE MONTH(r.dateScanned) = MONTH(GETDATE()) -- Filter for the current month
AND YEAR(r.dateScanned) = YEAR(GETDATE()) -- Filter for the current year
GROUP BY b.name
ORDER BY total_receipts_scanned DESC;
