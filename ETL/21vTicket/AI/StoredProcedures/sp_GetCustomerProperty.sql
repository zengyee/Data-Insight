CREATE PROCEDURE [dbo].[sp_GetCustomerProperty]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * into #temp
from (
SELECT        E.EnrollmentNumber, E.EndCustomerName, S.EnrollmentId, CONVERT(NVARCHAR(7), S.Month, 126) + '-01' AS BillingMonth, SUM(S.Utilized + S.Overage) AS RawConsumption, 
                         SUM(S.Utilized - S.SIECredit - S.PromoCredit) AS BurndownConsumption, SUM(S.NewPurchases) AS NewPurchase, SUM(S.BeginBalance) AS BeginBalance, SUM(S.EndBalance) AS EndBalance, SUM(S.SIECredit) 
                         AS SIECredit, SUM(S.PromoCredit) AS PromoCredit, SUM(S.Overage) AS Overage
FROM            (SELECT        S1.Id, S1.EnrollmentId, S1.Month, S1.BeginBalance, S1.NewPurchases, S1.SIECredit, S1.PromoCredit, S1.Utilized, S1.EndBalance, S1.ChargesBilledSeparately, S1.Overage, S1.CreatedOn, 
                                                    S1.ModifiedOn
                          FROM            dbo.Velocity_QuarterlyUsageSummary AS S1 RIGHT OUTER JOIN
                                                        (SELECT        EnrollmentId, Month, MAX(CreatedOn) AS CreatedOn
                                                          FROM            dbo.Velocity_QuarterlyUsageSummary
                                                          GROUP BY EnrollmentId, Month) AS S2 ON S1.EnrollmentId = S2.EnrollmentId AND S1.CreatedOn = S2.CreatedOn AND S1.Month = S2.Month) AS S INNER JOIN
                         dbo.Velocity_Enrollments AS E ON S.EnrollmentId = E.Id
GROUP BY E.EnrollmentNumber, E.EndCustomerName, S.EnrollmentId, CONVERT(NVARCHAR(7), S.Month, 126)
) V_RawConsumptionCommitment_0



select * into #Customer_Top20
from(
SELECT        TOP (20) EnrollmentNumber AS CustomerId, EndCustomerName, a.DimAccountKey,RawConsumption, BurndownConsumption, NewPurchase, BeginBalance, EndBalance, SIECredit, PromoCredit, Overage
FROM           #temp AS t
LEFT OUTER JOIN
                         dbo.vw_Account AS a ON t.EnrollmentNumber = a.CustomerId
WHERE        (BillingMonth = '2015-10-01')
ORDER BY BurndownConsumption DESC
) V_RawConsumptionCommitment_Top20



select * into #Customer_Active
from (
SELECT DISTINCT DimAccountKey
FROM            dbo.vw_FactUsageDaily
WHERE        (DimDateKey >= CONVERT(char(8), DATEADD(day, - 30, GETDATE()), 112))
)  vw_Customer_Active


SELECT        hmc.HMC AS isHMC, CASE WHEN a.DimAccountKey IS NULL THEN 0 ELSE 1 END AS isActive, CASE WHEN t .DimAccountKey IS NULL THEN 0 ELSE t .BurndownConsumption END AS isTop20, c.CustomerId, 
                         c.BillingSystemAccountType, c.CurrentBillingSystemName, RIGHT(c.OrganizationName, LEN(c.OrganizationName) - CHARINDEX(':', c.OrganizationName)) AS OrganizationName, c.CommunicationCulture, 
                         c.IsTaxExempt, c.OptOutUseOfEmail, c.OptOutUseOfPhone, c.TPName, c.DimAccountKey
FROM            dbo.vw_Account AS c LEFT OUTER JOIN
                         dbo.HMC AS hmc ON c.OrganizationName = hmc.Name OR c.TPName = hmc.Name LEFT OUTER JOIN
                         #Customer_Active AS a ON a.DimAccountKey = c.DimAccountKey LEFT OUTER JOIN
                         #Customer_Top20 AS t ON t.DimAccountKey = c.DimAccountKey


drop table #temp
drop table #Customer_Top20
drop table #Customer_Active						 



END
