CREATE PROCEDURE [dbo].[ETL_Update_Log]
	@id int,
	@Status NVARCHAR (50)
AS

	UPDATE [dbo].[ETL_Log]
		SET [Status] = @Status,
			[EndTime] = GETDATE()
	WHERE [Id]  = @id

RETURN 0
