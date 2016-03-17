CREATE PROCEDURE [dbo].[sp_GetActive]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	truncate table [dbo].[v_Customer_Active]
	insert into [dbo].[v_Customer_Active]
	select [CustomerId]
	from [dbo].[v_Account]
	where [DimAccountKey] in (
	SELECT DISTINCT DimAccountKey
	FROM           [dbo].[v_FactUsageDaily]
	WHERE        (DimDateKey >= CONVERT(char(8), DATEADD(day, - 30, GETDATE()), 112))
	)

END

