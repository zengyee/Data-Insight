CREATE FUNCTION [dbo].[fx_tb_GetActiveSubscriptionAccount]
(
	@EndDate Datetime
)
RETURNS @returntable TABLE
(
	DimSubscriptionKey int,
	DimAccountKey int
)
AS
BEGIN
	INSERT @returntable(DimSubscriptionKey,DimAccountKey)
	SELECT DISTINCT [DimSubscriptionKey],[DimAccountKey]
		FROM  dbo.FactMeteredUsageDaily
		WHERE DimDateKey >= CONVERT(char(8), DATEADD(month, - 1, @EndDate), 112) AND DimDateKey < CONVERT(char(8), @EndDate, 112)
		AND (AI_NormalizedUsage > 0) 
	RETURN

END
