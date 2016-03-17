CREATE PROCEDURE [dbo].[sp_GetTop20]
@YearMonth date --'2016-02-01'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(exists(select 1 from [dbo].[v_Customer_Top20] where YearMonth=@YearMonth))
	begin
	delete [dbo].[v_Customer_Top20] where YearMonth=@YearMonth
	end
	insert into [dbo].[v_Customer_Top20]
	SELECT   TOP (20) EnrollmentNumber AS CustomerId, @YearMonth, ROW_NUMBER() over (order by BurndownConsumption desc), BurndownConsumption,RawConsumption
FROM            dbo.V_RawConsumptionCommitment_0
WHERE        (BillingMonth = @YearMonth)
ORDER BY BurndownConsumption DESC


END
