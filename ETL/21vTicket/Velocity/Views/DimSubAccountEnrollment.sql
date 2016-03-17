CREATE VIEW [dbo].[DimSubAccountEnrollment]
	AS 
	SELECT distinct sub.MOCPSubscriptionGuid AS SubscriptionId,sub.MOCPSubscriptionGuid,sub.EndDate As Sub_EndDate,sub.CreatedOn AS Sub_CreatedOn, sub.StartDate AS Sub_StartDate, 
		sub.OfferName AS Sub_OfferName,ss.Name AS Sub_Status,
		a.id as AccountId,a.WindowsLiveId AS OrgId, a.WindowsLiveId AS Account_WindowsLiveId,a.ModifiedOn AS Account_ModifiedOn, a.IsOrgIdPUID AS Account_IsOrgIdPUID, sa.Name AS Account_Status,
		e.EndCustomerName,e.EndCustomerName AS Enrollment_EndCustomerName, e.CreatedOn AS Enrollment_CreatedOn,e.ModifiedOn AS Enrollment_ModifiedOn,e.EnrollmentKey,
		e.EnrollmentNumber,e.EnrollmentKey AS CustmerId,
		--ais.AnniversaryDate,ais.BillingCycle AS AI_Subscription_BillingCycle, ais.SubscriptionStartDate AS AI_SubscriptionStartDate, ais.SubscriptionEndDate AS AI_SubscriptionEndDate,
		e.BillingCycle AS EnrollmentBillingCycle
	FROM [v_DimSubscriptionLatest] sub
		LEFT JOIN [Status] ss on sub.StatusId = ss.Id
		LEFT JOIN [v_AccountsSubscriptionsLatest] ass ON ass.SubscriptionId = sub.Id
		LEFT JOIN [Accounts] a ON ass.AccountId = a.Id
		LEFT JOIN [Status] sa ON a.StatusId = sa.id
		LEFT JOIN [v_EnrollmentsAccountsLatest] ea on a.id=ea.AccountId
		LEFT JOIN [Enrollments] e on e.Id = ea.EnrollmentId
		LEFT JOIN [Status] se on e.StatusId = se.id
		--LEFT JOIN [$(AI)].[dbo].DimSubscription ais on ais.SubscriptionGUID = sub.MOCPSubscriptionGuid

	-- a.StatusId = 10

