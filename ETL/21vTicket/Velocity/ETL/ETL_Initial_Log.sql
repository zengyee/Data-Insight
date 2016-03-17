﻿CREATE PROCEDURE [dbo].[ETL_Initial_Log]
	@EndModifiedDate datetime
AS
	
	DECLARE @LastModifiedDate datetime

	IF EXISTS (SELECT * FROM [dbo].ETL_Log WHERE [Status]='Completed')
		SELECT TOP 1  @LastModifiedDate = ISNULL([LastModifiedDate],'2000-01-01 00:00:00') FROM ETL_Log WHERE [Status]='Completed' ORDER BY ID DESC
	ELSE
		SELECT @LastModifiedDate = '2000-01-01 00:00:00'

	INSERT INTO [dbo].[ETL_Log]([Status],[LastModifiedDate]) VALUES('Starting',@EndModifiedDate)

	SELECT @@IDENTITY, DateAdd(day, -7, @LastModifiedDate) -- Assuming 1 week delay, make sure no gaps

RETURN 0