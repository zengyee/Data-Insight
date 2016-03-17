CREATE PROCEDURE [dbo].[sp_Populate_IssueCodeTree]
AS
	TRUNCATE TABLE [IssueCodes]
	TRUNCATE TABLE [IssueCodeTree]

	INSERT [IssueCodes]([IssueCode],[ParentIssueCode])
	SELECT DISTINCT [IssueCode],[ParentIssueCode] From [dbo].[v_CSS_Data_Detail]
	WHERE [IssueCode] IS NOT NULL AND ([ParentIssueCode] <> [IssueCode] OR [ParentIssueCode] IS NULL)
	
	-- Insert the known issue codes, which not exists in tickets
	INSERT [IssueCodes]([IssueCode],[ParentIssueCode])
	VALUES ('Service Impacting Event','Azure WATS')


	-- Add some parent issue code that never appear in issue code
	INSERT [IssueCodes]([IssueCode],[ParentIssueCode])
	SELECT DISTINCT PARENTISSUECODE,NULL FROM [DBO].[ISSUECODES] WHERE (PARENTISSUECODE NOT IN (SELECT ISSUECODE FROM ISSUECODES))
	
	--INSERT [IssueCodeTree]([Level1],[Level2],[Level3],[Level4],[Level5],[Level6])
	--SELECT L1.[IssueCode],L2.[IssueCode],L3.IssueCode,L4.IssueCode,L5.IssueCode,L6.IssueCode
	--FROM [dbo].[IssueCodes] L1 
	--	LEFT JOIN [dbo].[IssueCodes] L2 ON  L2.ParentIssueCode=L1.IssueCode 
	--	LEFT JOIN [dbo].[IssueCodes] L3 ON L3.ParentIssueCode = L2.IssueCode
	--	LEFT JOIN [dbo].[IssueCodes] L4 ON L4.ParentIssueCode = L3.IssueCode
	--	LEFT JOIN [dbo].[IssueCodes] L5 ON L5.ParentIssueCode = L4.IssueCode
	--	LEFT JOIN [dbo].[IssueCodes] L6 ON L6.ParentIssueCode = L5.IssueCode
	--WHERE L1.ParentIssueCode IS NULL


	Update [dbo].[IssueCodes]
		SET IssueCodeFullPath = f.IssueCodeFullPath
		FROM issuecodes i CROSS APPLY [dbo].[fn_GetIssueCodeFullPath](i.IssueCode, i.ParentIssueCode) f

	INSERT INTO [dbo].[IssueCodeTree]([IssueCodeFullPath],[Level0],[Level1],[Level2],[Level3],[Level4],[Level5])
		SELECT f.[IssueCodeFullPath],f.[Level0],f.[Level1],f.[Level2],f.[Level3],f.[Level4],f.[Level5] 
		FROM issuecodes i CROSS APPLY [dbo].[fn_GetIssueCodeFullPath](i.IssueCode, i.ParentIssueCode) f


RETURN 0
