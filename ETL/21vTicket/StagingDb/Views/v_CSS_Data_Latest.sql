CREATE VIEW [v_CSS_Data_Latest] AS
	SELECT d.[Case_ID]
		,d.[CurrentOwner_ID] AS [AssignedTo]
		,d.[FromQueue]
		,d.[ToQueue] AS [AssignedTeam]
		,d.[CreateDate] AS [CreatedTime]
		,d.[ClosedDate] AS [ClosedTime]
		,d.[SolutionDeliveredDate] AS [SolutionDeliveredTime]
		,d.[LastUpdateDate] AS [LastUpdatedTime]
		,d.[IssueCode]
		,d.[ParentIssueCode]
		,d.[Title]
		,d.[IssueDescription] AS [Description]
		,d.[InquiryType]
		,d.[CaseStatus]
		,d.[Open/Close] AS [OpenClose]
		,CASE d.[CaseStatus] WHEN 'Solution Delivered' THEN 'SolutionDelivered' ELSE d.[Open/Close] END AS [ExternalStatus]
		,d.[CaseStatus] AS [Stage]
		,d.[ProductType]
		,d.[ProductName]
		,d.[OrgID]
		,RIGHT(d.[OrgID],LEN(d.[OrgID])- CHARINDEX('@',d.[OrgID])) AS [CreatedBy]
		,d.[SubscriptionID]
		,d.[Severity]
		,d.[CustomerType]
		,d.[FeedBack]
		,d.[LaborTime] AS [TotalLaborMinutes]
		,d.[ReactiveCount] AS [ReactivationCount]
		,d.[EscalatetoMS]
		,d.[MSLed]
		,d.[CaseSource]
		,d.[ReferenceID]
		,d.[MssolveID]
		,d.[TfsID]
		,d.[CorreCaseID]
		,d.[InitialResponseDate]
		,d.[SupportType]
		,d.[SolutionOfferedTime]
		,d.[SolutionConfirmedTime]
		,TRY_CONVERT(uniqueidentifier,d.[SubscriptionID]) AS [SubscriptionGUID]
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]>=8 THEN 'TB' WHEN d.[FeedBack] <=4 THEN 'BB' ELSE 'MB' END AS CPERank
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]>=8 THEN 1 ELSE 0 END AS TBCount
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]<=4 THEN 1 ELSE 0 END AS BBCount
		,CASE WHEN d.[FeedBack] IS NULL THEN 0 ELSE 1 END AS SurveyResponseCount
		,DATEPART(YEAR,d.[CreateDate]) AS  [YearofCreate]
		,DATEPART(MONTH,d.[CreateDate]) AS  [MonthofCreate]
		,CONVERT(char(7),d.[CreateDate],126) AS [YearMonthofCreate]
		,DATEPART(YEAR,d.[ClosedDate]) AS  [YearofClose]
		,DATEPART(MONTH,d.[ClosedDate]) AS  [MonthofClose]
		,CONVERT(char(7),d.[ClosedDate],126) AS [YearMonthofClose]
		,CONVERT(INT,d.[EscalatetoMS]) AS [EscalationCount]
		,CONVERT(FLOAT, DATEDIFF(minute, d.[CreateDate], d.[ClosedDate]))/1440.0 AS DTC
		,CONVERT(FLOAT, DATEDIFF(minute, d.[CreateDate], d.[SolutionDeliveredDate]))/1440.0 AS DTS
		,CASE WHEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreateDate], d.[SolutionDeliveredDate]))/1440.0 <=1.0 THEN 1 ELSE 0 END AS [FirstDayResolution]
		,CASE d.[Open/Close] WHEN 'Open' THEN 
								CASE WHEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreateDate], GETDATE()))/1440.0 >=7.0 THEN 1 
									ELSE 0 END 
							ELSE NULL END AS [OpenningMoreThan7Days]
		,CASE d.[Open/Close] WHEN 'Open' THEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreateDate], GETDATE()))/1440.0
							ELSE NULL END AS [OpenningDays]
		,CASE d.[Open/Close] WHEN 'Open' THEN 1 ELSE 0 END AS OpeningCount
		,CASE d.[Open/Close] WHEN 'Closed' THEN 1 ELSE 0 END AS ClosedCount
		,CASE d.[Open/Close] WHEN 'Closed' THEN RIGHT([CaseStatus], LEN([CaseStatus])-7) ELSE NULL END AS [Resolution]
		,d.[LaborTime] AS TMPI
		,hop.[OwnershipChanges]
		,CONVERT(date, d.[CreateDate]) AS DateOfCreate
		,CONVERT(date, d.[ClosedDate]) AS DateOfClosed
	FROM [dbo].[v_CSS_Data_Detail] d LEFT JOIN [v_CSS_Hop_Count_Latest] hop ON d.Case_ID=hop.Case_ID
	WHERE d.ROWNUMBER=1