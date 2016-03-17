CREATE VIEW [dbo].[v_RawConsumptionCommitment]
	AS SELECT E.EnrollmentNumber, E.EndCustomerName, S.EnrollmentId, CONVERT(NVARCHAR(7), S.Month, 126) + '-01' AS BillingMonth, SUM(S.Utilized + S.Overage) AS RawConsumption, 
            SUM(S.Utilized - S.SIECredit - S.PromoCredit) AS BurndownConsumption, SUM(S.NewPurchases) AS NewPurchase, SUM(S.BeginBalance) AS BeginBalance, SUM(S.EndBalance) AS EndBalance, SUM(S.SIECredit) 
            AS SIECredit, SUM(S.PromoCredit) AS PromoCredit, SUM(S.Overage) AS Overage
		FROM [v_QuarterlyUsageSummary_Latest] AS S INNER JOIN Enrollments AS E ON S.EnrollmentId = E.Id
		GROUP BY E.EnrollmentNumber, E.EndCustomerName, S.EnrollmentId, CONVERT(NVARCHAR(7), S.Month, 126)

