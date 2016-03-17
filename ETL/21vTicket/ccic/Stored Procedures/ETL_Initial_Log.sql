CREATE PROCEDURE [dbo].[ETL_Initial_Log]
--	@EndModifiedDate datetime
AS
	
	--DECLARE @LastModifiedDate datetime

	--IF EXISTS (SELECT * FROM [dbo].ETL_Log WHERE [Status]='Completed')
	--	SELECT TOP 1  @LastModifiedDate = ISNULL([LastModifiedDate],'2000-01-01 00:00:00') FROM ETL_Log WHERE [Status]='Completed' ORDER BY ID DESC
	--ELSE
	--	SELECT @LastModifiedDate = '2000-01-01 00:00:00'

	INSERT INTO [dbo].[ETL_Log]([Status]) VALUES('Starting')
	SELECT @@IDENTITY--, @LastModifiedDate

RETURN 0
