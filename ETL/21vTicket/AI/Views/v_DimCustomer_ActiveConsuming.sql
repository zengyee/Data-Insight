CREATE VIEW [dbo].[v_DimCustomer_ActiveConsuming]
	AS SELECT DISTINCT DimAccountKey
		FROM  dbo.vw_FactUsageDaily
		WHERE (DimDateKey >= CONVERT(char(8), DATEADD(day, - 30, GETDATE()), 112))

