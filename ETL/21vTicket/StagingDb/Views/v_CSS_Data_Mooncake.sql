
CREATE VIEW [dbo].[v_CSS_Data_Mooncake]
AS
	SELECT l.* 
	, ic.IssueCodeFullPath
	,CASE WHEN l.[ParentIssueCode] = 'Service Impacting Event' THEN 1 ELSE 0 END AS [OutageRelated]
	FROM [DBO].[v_CSS_Data_Latest] l
	LEFT JOIN [DBO].[IssueCodes] ic on ic.IssueCode=l.IssueCode AND (ic.ParentIssueCode=l.ParentIssueCode OR (ic.ParentIssueCode is NULL AND l.ParentIssueCode is NULL))
	WHERE l.ProductType ='AZURE' 
		AND (l.[ProductName] IS NULL OR l.[ProductName] NOT LIKE '%365%') 
		AND (l.[AssignedTeam] IS NULL OR l.[AssignedTeam] NOT LIKE '%365%')