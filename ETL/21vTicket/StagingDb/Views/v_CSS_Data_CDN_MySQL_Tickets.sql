CREATE VIEW [dbo].[v_CSS_Data_CDN_MySQL_Tickets]
	AS SELECT *, CASE WHEN [ParentIssueCode]='MySql Database On Azure' THEN 'MySql' ELSE 'CDN' END AS [ServiceType] 
		FROM [v_CSS_Data_Mooncake_KPI] 
		WHERE [ParentIssueCode]='MySql Database On Azure' 
			OR [IssueCode] LIKE '%CDN%' 
			OR [ParentIssueCode] LIKE '%CDN%' 
			OR [Title] LIKE '%CDN%' 
			OR InquiryType LIKE '%CDN%'
