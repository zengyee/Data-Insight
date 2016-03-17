CREATE VIEW [dbo].[vw_SubscriptionCustomer]
	AS 
SELECT        s.SubscriptionName, s.SubscriptionCreatedDate, s.DataSource, s.AnniversaryDate, s.AI_FirstUseDate, s.AI_FirstInvoiceDate, s.AI_SubscriptionCanceledDate, s.PaymentMethodType, s.IsAutoRenew, 
                         s.NonRenewalReasonName, s.HasTransitioned, s.IncludedQuantity, s.AllowedOverageQuantity, s.BillingCycle, s.ChannelType, s.AI_IsSupport, s.AI_IsTest, s.AI_BillingType, s.AI_AccountType, s.AI_PassStatus, 
                         s.AI_CreatedAsTrial, s.AI_TrialToPaidConversion, s.AI_TrialToPaidConversionDate, s.AI_SubscriptionStatus, s.Location, s.OfferName, s.AI_OfferType, c.isHMC, c.isActive, c.isTop20, c.CustomerId, 
                         c.BillingSystemAccountType, c.CurrentBillingSystemName, c.OrganizationName, c.CommunicationCulture, c.IsTaxExempt, c.TPName, s.SubscriptionGUID
FROM            dbo.vw_Subscription AS s LEFT OUTER JOIN
                         dbo.AI_FactSubscriptionLifeCycle AS m ON m.DimSubscriptionKey = s.DimSubscriptionKey LEFT OUTER JOIN
                         dbo.vw_Customer AS c ON c.DimAccountKey = m.DimAccountKey