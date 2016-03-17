CREATE FUNCTION [dbo].[fn_GetIssueCodeFullPath]
(
	@IssueCode nvarchar(255),
	@ParentIssueCode nvarchar(255)
)
RETURNS @returntable TABLE
(
	[IssueCodeFullPath] [nvarchar](1024),
	[Level0] [nvarchar](255),
	[Level1] [nvarchar](255),
	[Level2] [nvarchar](255),
	[Level3] [nvarchar](255),
	[Level4] [nvarchar](255),
	[Level5] [nvarchar](255)
)
AS
BEGIN
	DECLARE @IssueCodeFullPath AS [nvarchar](1024)
	DECLARE @Level0 AS [nvarchar](255)
	DECLARE @Level1 AS [nvarchar](255)
	DECLARE @Level2 AS [nvarchar](255)
	DECLARE @Level3 AS [nvarchar](255)
	DECLARE @Level4 AS [nvarchar](255)
	DECLARE @Level5 AS [nvarchar](255)

	DECLARE @Code nvarchar(255)
	DECLARE @lvl INT
	DECLARE @maxLevel INT

	-- Cursor to loop level by level
	DECLARE cur_cte  CURSOR FOR 
	SELECT [IssueCode], lvl from [dbo].[fn_GetParentIssueCode](@IssueCode,@ParentIssueCode) order by lvl desc
	
	OPEN cur_cte
	
	FETCH NEXT FROM cur_cte INTO @Code, @lvl
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @IssueCodeFullPath IS NULL -- ROOT
		BEGIN
			SET @IssueCodeFullPath = @Code
			SET @maxLevel = @lvl
		END
		ELSE
		BEGIN
			SET @IssueCodeFullPath = @IssueCodeFullPath + '\' + @Code
		END 

		IF @maxLevel-@lvl = 0
			SET @Level0 =  @Code
		ELSE IF @maxLevel-@lvl = 1
			SET @Level1 =  @Code
		ELSE IF @maxLevel-@lvl = 2
			SET @Level2 =  @Code
		ELSE IF @maxLevel-@lvl = 3
			SET @Level3 =  @Code
		ELSE IF @maxLevel-@lvl = 4
			SET @Level4 =  @Code
		ELSE IF @maxLevel-@lvl = 5
			SET @Level5 =  @Code			
			
		FETCH NEXT FROM cur_cte INTO @Code, @lvl
	END
	CLOSE cur_cte;
	DEALLOCATE cur_cte;

	INSERT @returntable
	VALUES (@IssueCodeFullPath,@Level0,@Level1,@Level2,@Level3,@Level4,@Level5)
	RETURN
END


