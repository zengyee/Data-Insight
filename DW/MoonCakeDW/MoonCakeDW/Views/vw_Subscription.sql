CREATE VIEW [dbo].[vw_Subscription]
	AS 
SELECT        *
FROM            (SELECT        ROW_NUMBER() OVER (partition BY SubscriptionGUID
                          ORDER BY s.DimSubscriptionKey DESC) AS rid, s.DimSubscriptionKey, SubscriptionGUID, SubscriptionName, s.SubscriptionCreatedDate, SubscriptionStartDate, SubscriptionEndDate, DataSource, 
                         AnniversaryDate, s.AI_FirstUseDate, s.AI_FirstInvoiceDate, AI_SubscriptionCanceledDate, PaymentMethodType, IsAutoRenew, NonRenewalReasonName, HasTransitioned, IncludedQuantity, 
                         AllowedOverageQuantity, s.BillingCycle, ChannelType, CustomerId, EndCustomerSubAccount, FriendlySubscriptionName, SubscriptionStatusModifier, AI_IsSupport, AI_IsTest, AI_BillingType, AI_AccountType, 
                         AI_PassStatus, AI_CreatedAsTrial, AI_TrialToPaidConversion, AI_TrialToPaidConversionDate, s.AI_SubscriptionStatus, enrollment.EndCustomerName, g.CountryName AS Location, offer.OfferName, 
                         offer.AI_OfferType
FROM            dbo.AI_DimSubscription s LEFT JOIN
                         [dbo].[Velocity_Enrollments] enrollment ON enrollment.EnrollmentNumber = s.CustomerId LEFT JOIN
                         [dbo].[AI_FactSubscriptionLifeCycle] m ON s.DimSubscriptionKey = m.DimSubscriptionKey LEFT JOIN
                             (SELECT        [DimGeographyKey], [CurrencyCode], [CountryName]
                               FROM            [dbo].[AI_DimGeography]) g ON g.[DimGeographyKey] = m.[ServiceUseDimGeographyKey] LEFT JOIN
                         [dbo].[AI_DimOffer] offer ON offer.DimOfferKey = m.DimOfferKey
WHERE        (s.DimBillingSystemKey = 2) AND (s.AIMeta_SCDIsCurrent = 1)) t
WHERE        t .rid = 1