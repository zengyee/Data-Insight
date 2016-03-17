CREATE PROCEDURE [dbo].[ETL_MergeTemp_All]
	@ETLId INT,
	@LastModifiedTime DateTime
AS

	EXEC [dbo].[ETL_MergeTemp_TopTables] @ETLId
	EXEC [dbo].[ETL_MergeTemp_BigTables] @ETLId,@LastModifiedTime
	-- At last, Merge rest of tables
	EXEC [dbo].[ETL_MergeTemp_RestAll]
RETURN 0
