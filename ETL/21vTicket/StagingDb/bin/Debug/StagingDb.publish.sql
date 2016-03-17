﻿/*
Deployment script for StagingDb

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "StagingDb"
:setvar DefaultFilePrefix "StagingDb"
:setvar DefaultDataPath "D:\MSSQL\DATA\"
:setvar DefaultLogPath "D:\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[v_CSS_Initial_Response_Time]...';


GO
CREATE VIEW [dbo].[v_CSS_Initial_Response_Time]
	AS SELECT [Case_ID], MIN([LastUpdatedTime]) AS [InitialResponseTime]
		FROM [v_CSS_Data_Detail]
	    GROUP BY [Case_ID]
GO
PRINT N'Altering [dbo].[v_CSS_Data_Latest]...';


GO
ALTER VIEW [v_CSS_Data_Latest] AS
	SELECT d.*
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]>=8 THEN 'TB' WHEN d.[FeedBack] <=4 THEN 'BB' ELSE 'MB' END AS CPERank
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]>=8 THEN 1 ELSE 0 END AS TBCount
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]<=4 THEN 1 ELSE 0 END AS BBCount
		,CASE WHEN d.[FeedBack] IS NULL THEN 0 ELSE 1 END AS SurveyResponseCount
		,DATEPART(YEAR,d.[CreatedTime]) AS  [YearofCreate]
		,DATEPART(MONTH,d.[CreatedTime]) AS  [MonthofCreate]
		,CONVERT(char(7),d.[CreatedTime],126) AS [Year-MonthofCreate]
		,DATEPART(YEAR,d.[ClosedTime]) AS  [YearofClose]
		,DATEPART(MONTH,d.[ClosedTime]) AS  [MonthofClose]
		,CONVERT(char(7),d.[ClosedTime],126) AS [Year-MonthofClose]
		,CONVERT(INT,d.[EscalatetoMS]) AS [EscalationCount]
		,CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], d.[ClosedTime]))/1440.0 AS DTC
		,CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], d.[SolutionDeliveredTime]))/1440.0 AS DTS
		,CASE WHEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], d.[SolutionDeliveredTime]))/1440.0 <=1.0 THEN 1 ELSE 0 END AS [First Day Resolution]
		,CASE [Open/Close] WHEN 'Open' THEN 
								CASE WHEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], GETDATE()))/1440.0 >=7.0 THEN 1 
									ELSE 0 END 
							ELSE NULL END AS [Open >7 Days]
		,CASE [Open/Close] WHEN 'Open' THEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], GETDATE()))/1440.0
							ELSE NULL END AS [Openning Days]
		,CASE [Open/Close] WHEN 'Open' THEN 1 ELSE 0 END AS OpeningCount
		,CASE [Open/Close] WHEN 'Closed' THEN 1 ELSE 0 END AS ClosedCount
		,CASE [Open/Close] WHEN 'Closed' THEN RIGHT([CaseStatus], LEN([CaseStatus])-7) ELSE NULL END AS [Resolution]
		,d.[TotalLaborMinutes] AS TMPI
		,hop.[OwnershipChanges]
		,CONVERT(date, d.[CreatedTime]) AS DateOfCreate
		,CONVERT(date, d.[ClosedTime]) AS DateOfClosed
		,res.InitialResponseTime
	FROM [dbo].[v_CSS_Data_Detail] d LEFT JOIN [v_CSS_Hop_Count_Latest] hop ON d.Case_ID=hop.Case_ID
			LEFT JOIN [v_CSS_Initial_Response_Time] res on d.Case_ID=res.Case_ID 
	WHERE d.ROWNUMBER=1
GO
PRINT N'Refreshing [dbo].[v_CSS_Data_Mooncake]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[v_CSS_Data_Mooncake]';


GO
PRINT N'Altering [dbo].[v_Mooncake_Support_Tickets]...';


GO
ALTER VIEW [dbo].[v_Mooncake_Support_Tickets]
	AS SELECT 'Mooncake Support System' AS [SourceName] 
		, *
		,-1 AS [PlanId]
		,'' AS [InitialTopic]
		,'' AS [CurrentTopic]
		,'' AS [RootCause]
		,'' AS [Symptom]
		,'' AS [ResourceId]
		,[CreatedTime] AS [ScopeDeliveredTime]
		,0 AS [OutageRelated]
		,'' AS [CustomerLocation]
		,'' AS [IncidentType]
	FROM [v_CSS_Data_Mooncake]
GO
PRINT N'Refreshing [dbo].[ETL_sp_Insert_CSS_Data_Detail_by_Changes]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[ETL_sp_Insert_CSS_Data_Detail_by_Changes]';


GO
PRINT N'Update complete.';


GO
