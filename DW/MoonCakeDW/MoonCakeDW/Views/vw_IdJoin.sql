CREATE VIEW [dbo].[vw_IdJoin]
	AS 
	SELECT        e.Id AS EnrollmentId, c.CustomerId, c.TPID, s.SubscriptionGUID
FROM            dbo.Velocity_Enrollments AS e LEFT OUTER JOIN
                         dbo.vw_Account AS c ON c.CustomerId = e.EnrollmentNumber LEFT OUTER JOIN
                         dbo.vw_Subscription AS s ON s.CustomerId = c.CustomerId