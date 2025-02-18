-- Combining and standardizing financial statements with different formats formats continued:
SELECT
	Date,  -- Include other necessary columns
	Description,
	Credit,
	Debit,
	-- Consolidate both Credit (positive) and Debit (negative) into one column
	COALESCE(Credit, 0) - COALESCE(Debit, 0) AS normalized_amount
FROM `big-query1-.amex.venture_credit_card`