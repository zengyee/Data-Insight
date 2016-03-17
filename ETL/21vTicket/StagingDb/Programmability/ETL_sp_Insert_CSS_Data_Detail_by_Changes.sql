CREATE PROCEDURE [dbo].[ETL_sp_Insert_CSS_Data_Detail_by_Changes]
AS
	INSERT INTO [dbo].[CSS_DATA_Detail]
		([Case_ID]
		,[CurrentOwner_ID]
		,[FromQueue]
		,[ToQueue]
		,[CreateDate]
		,[ClosedDate]
		,[SolutionDeliveredDate]
		,[LastUpdateDate]
		,[IssueCode]
		,[ParentIssueCode]
		,[Title]
		,[IssueDescription]
		,[InquiryType]
		,[CaseStatus]
		,[Open/Close]
		,[ProductType]
		,[ProductName]
		,[OrgID]
		,[SubscriptionID]
		,[Severity]
		,[CustomerType]
		,[FeedBack]
		,[LaborTime]
		,[ReactiveCount]
		,[EscalatetoMS]
		,[MSLed]
		,[CaseSource]
		,[ReferenceID]
		,[MssolveID]
		,[TfsID]
		,[CorreCaseID]
		,[InitialResponseDate]
		,[SupportType]
		,[SolutionOfferedTime] 
		,[SolutionConfirmedTime]
		)	
	SELECT t.[Case_ID],t.[CurrentOwner_ID],t.[FromQueue],t.[ToQueue],t.[CreateDate],t.[ClosedDate]
		,t.[SolutionDeliveredDate],t.[LastUpdateDate],t.[IssueCode],t.[ParentIssueCode]
		,t.[Title],t.[IssueDescription],t.[InquiryType],t.[CaseStatus],t.[Open/Close]
		,t.[ProductType],t.[ProductName],t.[OrgID],t.[SubscriptionID],t.[Severity]
		,t.[CustomerType],t.[FeedBack],t.[LaborTime],t.[ReactiveCount],t.[EscalatetoMS]
		,t.[MSLed],t.[CaseSource]
		,t.[ReferenceID]
		,t.[MssolveID]
		,t.[TfsID]
		,t.[CorreCaseID]
		,t.[InitialResponseDate]
		,t.[SupportType]
		,t.[SolutionOfferedTime]
		,t.[SolutionConfirmedTime]
	FROM [dbo].[CSS_DATA_Temp] t LEFT JOIN [dbo].[v_CSS_Data_Latest] d on t.[Case_ID]=d.Case_ID 
	WHERE t.LastUpdateDate > d.[LastUpdatedTime] or d.Case_ID is NULL

RETURN 0





		
		
		
