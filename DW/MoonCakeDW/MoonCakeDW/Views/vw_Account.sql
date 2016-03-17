CREATE VIEW [dbo].[vw_Account]
	AS 

SELECT        *
FROM            (SELECT        ROW_NUMBER() OVER (partition BY CustomerId
                          ORDER BY DimAccountKey DESC) AS rid, *
FROM            dbo.AI_DimAccount
WHERE        AIMeta_SCDIsCurrent = 1 AND DimBillingSystemKey = 2) t
WHERE        t .rid = 1
