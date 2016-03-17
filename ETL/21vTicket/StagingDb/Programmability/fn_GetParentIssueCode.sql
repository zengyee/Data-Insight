Create FUNCTION [dbo].[fn_GetParentIssueCode]
(	
	@IssueCode nvarchar(255)
	,@ParentIssueCode nvarchar(255)
)
RETURNS TABLE 
AS
RETURN 
(

	With CTE
	As
	(
		Select [IssueCode], [ParentIssueCode],  0 as lvl
		From [dbo].[IssueCodes]
		Where [IssueCode] = @IssueCode and (@ParentIssueCode is null or ParentIssueCode=@ParentIssueCode)
 
		Union All
 
		Select p.[IssueCode], p.[ParentIssueCode], C.lvl+1
		From CTE as C Join [dbo].[IssueCodes] as P on c.[ParentIssueCode] = p.[IssueCode]
	)

	select top 100 percent [IssueCode], lvl from CTE order by lvl
)
