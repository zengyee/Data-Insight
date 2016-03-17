CREATE VIEW [dbo].[v_SubAccountLatest]
	AS
	SELECT s.* 
	,a.[OrganizationName] AS Account_OrganizationName
	,o.[OfferName]
	,ss.[SubscriptionStatusName]
	FROM [dbo].[v_DimSubscriptionLatestbyKey] s 
		LEFT JOIN [dbo].[FactSubscriptionLifeCycle] f on s.[DimSubscriptionKey]=f.[DimSubscriptionKey]
		LEFT JOIN [dbo].[v_DimAccountLatest] a on f.[DimAccountKey] = a.[DimAccountKey]
		LEFT JOIN [dbo].[DimOffer] o on  f.[DimOfferKey] = o.[DimOfferKey]
		LEFT JOIN [dbo].[DimSubscriptionStatus] ss on f.[DimSubscriptionStatusKey] = ss.[DimSubscriptionStatusKey]
	WHERE f.[DimDateKey] = 20160109