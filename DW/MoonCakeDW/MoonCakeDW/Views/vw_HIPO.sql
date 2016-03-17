CREATE VIEW [dbo].[vw_HIPO]
	AS 
	SELECT        dbo.HIPO.[End Customer Name], dbo.HIPO.[Enrollment Number], dbo.HIPO.[EA Status], s.SubscriptionGUID, s.AI_SubscriptionStatus
FROM            dbo.HIPO LEFT OUTER JOIN
                         dbo.vw_Subscription AS s ON s.CustomerId = dbo.HIPO.[Enrollment Number]
