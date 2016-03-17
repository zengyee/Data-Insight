CREATE VIEW [v_CSS_Data_Latest] AS
	SELECT d.*
		,TRY_CONVERT(uniqueidentifier,d.[SubscriptionID]) AS [SubscriptionGUID]
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]>=8 THEN 'TB' WHEN d.[FeedBack] <=4 THEN 'BB' ELSE 'MB' END AS CPERank
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]>=8 THEN 1 ELSE 0 END AS TBCount
		,CASE WHEN d.[FeedBack] IS NULL THEN NULL WHEN d.[FeedBack]<=4 THEN 1 ELSE 0 END AS BBCount
		,CASE WHEN d.[FeedBack] IS NULL THEN 0 ELSE 1 END AS SurveyResponseCount
		,DATEPART(YEAR,d.[CreatedTime]) AS  [YearofCreate]
		,DATEPART(MONTH,d.[CreatedTime]) AS  [MonthofCreate]
		,CONVERT(char(7),d.[CreatedTime],126) AS [YearMonthofCreate]
		,DATEPART(YEAR,d.[ClosedTime]) AS  [YearofClose]
		,DATEPART(MONTH,d.[ClosedTime]) AS  [MonthofClose]
		,CONVERT(char(7),d.[ClosedTime],126) AS [YearMonthofClose]
		,CONVERT(INT,d.[EscalatetoMS]) AS [EscalationCount]
		,CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], d.[ClosedTime]))/1440.0 AS DTC
		,CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], d.[SolutionDeliveredTime]))/1440.0 AS DTS
		,CASE WHEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], d.[SolutionDeliveredTime]))/1440.0 <=1.0 THEN 1 ELSE 0 END AS [FirstDayResolution]
		,CASE [OpenClose] WHEN 'Open' THEN 
								CASE WHEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], GETDATE()))/1440.0 >=7.0 THEN 1 
									ELSE 0 END 
							ELSE NULL END AS [OpenningMoreThan7Days]
		,CASE [OpenClose] WHEN 'Open' THEN CONVERT(FLOAT, DATEDIFF(minute, d.[CreatedTime], GETDATE()))/1440.0
							ELSE NULL END AS [OpenningDays]
		,CASE [OpenClose] WHEN 'Open' THEN 1 ELSE 0 END AS OpeningCount
		,CASE [OpenClose] WHEN 'Closed' THEN 1 ELSE 0 END AS ClosedCount
		,CASE [OpenClose] WHEN 'Closed' THEN RIGHT([CaseStatus], LEN([CaseStatus])-7) ELSE NULL END AS [Resolution]
		,d.[TotalLaborMinutes] AS TMPI
		,hop.[OwnershipChanges]
		,CONVERT(date, d.[CreatedTime]) AS DateOfCreate
		,CONVERT(date, d.[ClosedTime]) AS DateOfClosed
	FROM [dbo].[v_CSS_Data_Detail] d LEFT JOIN [v_CSS_Hop_Count_Latest] hop ON d.Case_ID=hop.Case_ID
	WHERE d.ROWNUMBER=1