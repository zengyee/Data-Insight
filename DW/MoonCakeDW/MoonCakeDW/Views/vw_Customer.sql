CREATE VIEW [dbo].[vw_Customer]
	AS 
	SELECT        hmc.HMC AS isHMC, CASE WHEN a.DimAccountKey IS NULL THEN 0 ELSE 1 END AS isActive, CASE WHEN t .DimAccountKey IS NULL THEN 0 ELSE t .BurndownConsumption END AS isTop20, c.CustomerId, 
                         c.BillingSystemAccountType, c.CurrentBillingSystemName, RIGHT(c.OrganizationName, LEN(c.OrganizationName) - CHARINDEX(':', c.OrganizationName)) AS OrganizationName, c.CommunicationCulture, 
                         c.IsTaxExempt, c.OptOutUseOfEmail, c.OptOutUseOfPhone, c.TPName, enrollment.EndCustomerName, c.DimAccountKey
FROM            dbo.vw_Account AS c LEFT OUTER JOIN
                         dbo.Velocity_Enrollments AS enrollment ON enrollment.EnrollmentNumber = c.CustomerId LEFT OUTER JOIN
                         dbo.HMC AS hmc ON c.OrganizationName = hmc.Name OR c.TPName = hmc.Name LEFT OUTER JOIN
                         dbo.vw_Customer_Active AS a ON a.DimAccountKey = c.DimAccountKey LEFT OUTER JOIN
                         dbo.vw_Customer_Top20 AS t ON t.DimAccountKey = c.DimAccountKey
