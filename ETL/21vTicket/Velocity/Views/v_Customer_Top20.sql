CREATE VIEW [dbo].[v_Customer_Top20]
	AS 
	SELECT t.BillingMonth, e.EnrollmentKey, t.CustomerId, t.BurndownConsumption, t.RawConsumption
	FROM dbo.v_RawconsumptionCommitment_Rank_BurndownConsumption AS t LEFT JOIN
                         dbo.Enrollments AS e ON t.CustomerId = e.EnrollmentKey
	WHERE t.Ranking<=20