CREATE PROCEDURE [dbo].[ETL_sp_Customer_MergeFromTemp]
	@ETLId INT
AS
	
	SET NOCOUNT ON;
	-- Temp table to record changes
	CREATE TABLE #MyTempTable
	(  
		[ActionTaken] nvarchar(10),
		[Id] int
	)

	-- Merge by Insert and Update
    MERGE [dbo].[CCIC_Customer] AS target
    USING 
	(SELECT * FROM [CCIC_Customer_Temp]) 
	AS source (	[Id],
				[EnglishName],
				[Name],
				[HMC],
				[CAT],
				[Scenario],
				[CreatedBy],
				[CreatedDate],
				[UpdatedBy],
				[UpdatedDate],
				[HiPo],
				[PSS],
				[CSA])
    ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[EnglishName]=source.[EnglishName],
					[Name]=source.[Name],
					[HMC]=source.[HMC],
					[CAT]=source.[CAT],
					[Scenario]=source.[Scenario],
					[CreatedBy]=source.[CreatedBy],
					[CreatedDate]=source.[CreatedDate],
					[UpdatedBy]=source.[UpdatedBy],
					[UpdatedDate]=source.[UpdatedDate],
					[HiPo]=source.[HiPo],
					[PSS]=source.[PSS],
					[CSA]=source.[CSA]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([Id],
			[EnglishName],
			[Name],
			[HMC],
			[CAT],
			[Scenario],
			[CreatedBy],
			[CreatedDate],
			[UpdatedBy],
			[UpdatedDate],
			[HiPo],
			[PSS],
			[CSA])
    VALUES (source.[Id],
			source.[EnglishName],
			source.[Name],
			source.[HMC],
			source.[CAT],
			source.[Scenario],
			source.[CreatedBy],
			source.[CreatedDate],
			source.[UpdatedBy],
			source.[UpdatedDate],
			source.[HiPo],
			source.[PSS],
			source.[CSA])

	--OUTPUT Parameters
    OUTPUT $action, inserted.[Id] INTO #MyTempTable;

	DECLARE	@InsertedRows INT
	DECLARE @UpdatedRows INT
	SELECT @InsertedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'INSERT'
	SELECT @UpdatedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'UPDATE'
	
	-- Update Log
	UPDATE ETL_Log
		SET [InsertedRows] = @InsertedRows,
			[UpdatedRows] = @UpdatedRows
		WHERE [id] = @ETLId

 	DROP TABLE #MyTempTable

RETURN 0
