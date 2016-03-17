CREATE VIEW [dbo].[v_DimOpenningCustomerSubscriptionTree]
	AS
	SELECT CONVERT(NVARCHAR(100),s.[SubscriptionGUID]) AS [SubscriptionId]      ,s.[SubscriptionName]
		,c.CustomerId,c.OrganizationName,c.TPName
		--,c.isActive AS IsAccountActive
		--,c.isTop20
		,s.[AI_SubscriptionStatus]
		,s.[SubscriptionCreatedDate]		,s.[SubscriptionStartDate]		,s.[SubscriptionEndDate]
		,(YEAR(DATEADD(MONTH, -6, s.[SubscriptionEndDate])) % 100) + 1 AS SubscriptionEndFiscalYear
		,DATEPART(quarter, DATEADD(MONTH, -6, s.[SubscriptionEndDate])) AS SubscriptionEndFiscalQuarter
		,s.[AnniversaryDate]
		,s.[AI_FirstUseDate]
		,s.[AI_FirstInvoiceDate]
		,s.[AI_SubscriptionCanceledDate]
		,s.[PaymentMethodType]
		,s.[IsAutoRenew]
		,s.[NonRenewalReasonName]
		,s.[HasTransitioned]
		,s.[IncludedQuantity]
		,s.[AllowedOverageQuantity]
		,s.[BillingCycle]
		,s.[AI_IsSupport]
		,s.[AI_IsTest]
		,s.[AI_BillingType] AS [BillingType]
		,s.[AI_AccountType]
		,s.[AI_PassStatus]
		,s.[AI_CreatedAsTrial]
		,s.[AI_TrialToPaidConversion]
		,s.[AI_TrialToPaidConversionDate]
		--,s.[Location]
		--,s.[OfferName]
		--,s.[AI_OfferType]
  FROM [$(AI)].[dbo].[DimSubscription] s LEFT JOIN [$(AI)].[DBO].[DimAccount] c on c.[CustomerId]=s.[CustomerId]
  --WHERE s.[AI_SubscriptionStatus] = 'Open'
