CREATE VIEW [dbo].[v_CSS_Hop_Count_Latest]
	AS SELECT COUNT(*) - 1 AS [OwnershipChanges],[Case_ID] FROM [v_CSS_Hop_Base] GROUP BY [Case_ID] 
