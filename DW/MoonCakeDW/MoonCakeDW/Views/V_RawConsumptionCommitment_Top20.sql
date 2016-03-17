CREATE VIEW [dbo].[V_RawConsumptionCommitment_Top20]
	AS

	SELECT        TOP (20) EnrollmentNumber AS CustomerId, EndCustomerName, RawConsumption, BurndownConsumption, NewPurchase, BeginBalance, EndBalance, SIECredit, PromoCredit, Overage
FROM            dbo.V_RawConsumptionCommitment_0
WHERE        (BillingMonth = '2015-12-01')
ORDER BY BurndownConsumption DESC
