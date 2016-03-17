CREATE PROCEDURE [dbo].[ETL_Initial_Log]
AS
	
	DECLARE @LastModifiedDate datetime

	INSERT INTO [dbo].[ETL_Log]([Status]) VALUES('Starting')

	SELECT @@IDENTITY

RETURN 0
