UPDATE [dbo].[CSS_DATA_Detail]
   SET [ClosedDate] = t.[ClosedDate]
      ,[SolutionDeliveredDate] = t.[SolutionDeliveredDate]
       ,[ReferenceID] = t.[ReferenceID]
      ,[MssolveID] = t.[MssolveID]
      ,[TfsID] =t.[TfsID]
      ,[CorreCaseID] = t.[CorreCaseID]
FROM [dbo].[CSS_DATA_Detail] d INNER JOIN [dbo].[CSS_DATA_Temp] t on d.Case_ID=t.Case_ID AND d.LastUpdateDate=t.LastUpdateDate

--	[InitialResponseDate] [datetime] NULL,
UPDATE [dbo].[CSS_DATA_Detail]
   SET [InitialResponseDate] = t.[InitialResponseDate]
FROM [dbo].[CSS_DATA_Detail] d INNER JOIN [dbo].[CSS_DATA_Temp] t on d.Case_ID=t.Case_ID AND d.LastUpdateDate=t.LastUpdateDate
