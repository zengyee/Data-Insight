CREATE VIEW [dbo].[vw_Customer_Top20]
	AS 
	SELECT        a.DimAccountKey, t.CustomerId, t.BurndownConsumption, t.RawConsumption
FROM            dbo.V_RawConsumptionCommitment_Top20 AS t LEFT OUTER JOIN
                         dbo.vw_Account AS a ON t.CustomerId = a.CustomerId