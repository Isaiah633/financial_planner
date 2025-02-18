
-- Combining and standardizing financial statements with different formats:

WITH chase_merge AS 
( SELECT Date, Description, amount, CASE WHEN amount < 0 THEN amount -- Debit (negative) ELSE amount 
-- Credit (positive) END AS normalized_amount, 'CHASE' AS Source FROM big-query1-447223.amex.chase ), 
amex_merge AS ( SELECT Date, Description, amount, CASE WHEN amount > 0 THEN -amount -- Debit (positive, convert to negative)
 ELSE -amount -- Credit (negative, convert to positive) END AS normalized_amount, 'AMEX' AS Source FROM big-query1.amex.amex ), 
 discover_merge AS ( SELECT Date, Description, amount, CASE WHEN amount > 0 THEN -amount -- Debit (positive, convert to negative
 ELSE -amount -- Credit (negative, convert to positive) END AS normalized_amount, 'DISCOVER' AS Source FROM big-query1.amex.discover ), delta_merge AS ( SELECT Date, Description, amount, CASE WHEN amount > 0 THEN -amount -- Debit (positive, convert to negative) ELSE -amount -- Credit (negative, convert to positive) END AS normalized_amount, 'DELTA' AS Source FROM big-query1.amex.delta ), WF_merge AS ( SELECT Date, Description, amount, CASE WHEN amount < 0 THEN amount -- Debit (negative) ELSE amount -- Credit (positive) END AS normalized_amount, 'WFchecking' AS Source FROM big-query1.amex.WFchecking ), checking_merge AS ( SELECT Date, Description, amount, CASE WHEN Transaction = 'Debit' THEN -amount -- Debit (positive, convert to negative) WHEN Transaction = 'Credit' THEN amount -- Credit (leave as positive) ELSE NULL -- Optional: Handle unexpected Transaction values END AS normalized_amount, 'CHECKING' AS Source FROM big-query1.amex.checking )

-- Combine all transactions 
SELECT * FROM chase_merge UNION ALL SELECT * FROM amex_merge UNION ALL SELECT * FROM discover_merge UNION ALL SELECT * FROM 
delta_merge UNION ALL SELECT * FROM WF_merge UNION ALL SELECT * FROM checking_merge;


