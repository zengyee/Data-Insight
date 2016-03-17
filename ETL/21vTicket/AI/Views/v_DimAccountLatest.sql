CREATE VIEW [dbo].[v_DimAccountLatest]
	AS 

	SELECT t.* FROM
			(SELECT  ROW_NUMBER() OVER (partition BY CustomerId ORDER BY DimAccountKey DESC) AS rid, * 
				FROM   dbo.DimAccount
				WHERE AIMeta_SCDIsCurrent = 1 AND DimBillingSystemKey = 2
				) t
	WHERE t .rid = 1
