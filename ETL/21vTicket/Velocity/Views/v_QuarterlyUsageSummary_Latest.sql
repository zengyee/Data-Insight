CREATE VIEW [dbo].[v_QuarterlyUsageSummary_Latest]
	AS SELECT * FROM v_QuarterlyUsageSummary_RowNumber WHERE RowNumber = 1
