﻿CREATE VIEW [dbo].[v_CSS_Data_Mooncake_Correlation]
	AS
	SELECT m.* 
		,s.[SubscriptionGUID] AS [AI_SubscriptionGUID]
		,s.[SubscriptionName] AS [AI_SubscriptionName]
		,s.[SubscriptionCreatedDate] AS [AI_SubscriptionCreatedDate]
		,s.[AnniversaryDate] AS [AI_AnniversaryDate]
		,s.[PaymentMethodType] AS [AI_PaymentMethodType]
		,s.[CustomerId] AS [AI_CustomerId]
		,s.[AI_BillingType] AS [AI_AI_BillingType]
		,s.[AI_AccountType] AS [AI_AI_AccountType]
		,s.[TPID] AS [AI_TPID]
		,s.[Account_OrganizationName] AS [AI_Account_OrganizationName]
		,s.[OfferName] AS [AI_OfferName]
		,s.[SubscriptionStatusName] AS [AI_SubscriptionStatusName]
		,v.[CustmerId]  AS [Velocity_CustmerId]
		,v.[EndCustomerName] AS [Velocity_EndCustomerName]
		,v.[OrgId] AS [Velocity_OrgId]
		,v.[Sub_OfferName] AS [Velocity_Sub_OfferName]
		,CASE WHEN v.[EndCustomerName] is NULL THEN s.[Account_OrganizationName] ELSE v.[EndCustomerName] END AS [CustomerName]
	FROM [DBO].[v_CSS_Data_Mooncake] m
		LEFT JOIN [$(AI)].[dbo].[v_SubAccountLatest] s on s.[SubscriptionGUID]=m.[SubscriptionGUID]
		LEFT JOIN [$(Velocity)].[dbo].[DimSubAccountEnrollment] v on v.[MOCPSubscriptionGuid]=m.[SubscriptionGUID]
