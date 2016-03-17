CREATE VIEW [dbo].[v_QuarterlyUsageSummary_RowNumber]
	AS SELECT ROW_NUMBER() OVER (Partition By [EnrollmentId],[Month] Order by [CreatedOn] desc) AS RowNumber, * FROM [QuarterlyUsageSummary]
