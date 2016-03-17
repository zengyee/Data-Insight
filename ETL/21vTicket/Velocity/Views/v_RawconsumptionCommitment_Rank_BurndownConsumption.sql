CREATE VIEW [dbo].[v_RawconsumptionCommitment_Rank_BurndownConsumption]
	AS
	SELECT RANK() OVER (PARTiTION BY BillingMonth ORDER BY BurndownConsumption DESC) AS [Ranking],  
		BillingMonth, EnrollmentNumber AS CustomerId, EndCustomerName, RawConsumption, BurndownConsumption, 
		NewPurchase, BeginBalance, EndBalance, SIECredit, PromoCredit, Overage
	FROM dbo.v_RawConsumptionCommitment
