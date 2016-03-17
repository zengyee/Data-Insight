CREATE VIEW [dbo].[V_RawConsumptionCommitment_0]
	AS 
SELECT        E.EnrollmentNumber, E.EndCustomerName, S.EnrollmentId, CONVERT(NVARCHAR(7), S.Month, 126) + '-01' AS BillingMonth, SUM(S.Utilized + S.Overage) AS RawConsumption, 
                         SUM(S.Utilized - S.SIECredit - S.PromoCredit) AS BurndownConsumption, SUM(S.NewPurchases) AS NewPurchase, SUM(S.BeginBalance) AS BeginBalance, SUM(S.EndBalance) AS EndBalance, SUM(S.SIECredit) 
                         AS SIECredit, SUM(S.PromoCredit) AS PromoCredit, SUM(S.Overage) AS Overage
FROM            (SELECT        S1.Id, S1.EnrollmentId, S1.Month, S1.BeginBalance, S1.NewPurchases, S1.SIECredit, S1.PromoCredit, S1.Utilized, S1.EndBalance, S1.ChargesBilledSeparately, S1.Overage, S1.CreatedOn, 
                                                    S1.ModifiedOn
                          FROM            [$(Velocity)].dbo.Velocity_QuarterlyUsageSummary AS S1 RIGHT OUTER JOIN
                                                        (SELECT        EnrollmentId, Month, MAX(CreatedOn) AS CreatedOn
                                                          FROM            [$(Velocity)].dbo.Velocity_QuarterlyUsageSummary
                                                          GROUP BY EnrollmentId, Month) AS S2 ON S1.EnrollmentId = S2.EnrollmentId AND S1.CreatedOn = S2.CreatedOn AND S1.Month = S2.Month) AS S INNER JOIN
                         [$(Velocity)].dbo.Velocity_Enrollments AS E ON S.EnrollmentId = E.Id
GROUP BY E.EnrollmentNumber, E.EndCustomerName, S.EnrollmentId, CONVERT(NVARCHAR(7), S.Month, 126)
