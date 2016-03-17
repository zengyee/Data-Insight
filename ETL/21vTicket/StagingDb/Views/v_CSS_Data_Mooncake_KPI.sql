CREATE VIEW [dbo].[v_CSS_Data_Mooncake_KPI]
	AS SELECT * 
	,CASE [Severity] WHEN 'A' THEN 1 ELSE 0 END AS [Severity_A_Count]
	FROM [v_CSS_Data_Mooncake]
