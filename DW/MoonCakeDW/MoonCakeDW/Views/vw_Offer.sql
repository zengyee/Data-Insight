CREATE VIEW [dbo].[vw_Offer]
	AS 
	SELECT        DataSource, AIMeta_UpdatedAt, SubscriptionGUID, SubscriptionID, SubscriptionStartDate, SubscriptionEndDate, AI_SubscriptionStatus, AI_TrialToPaidConversion, AI_TrialToPaidConversionDate, 
                         AI_AccountType
FROM            dbo.AI_DimSubscription
WHERE        (DimBillingSystemKey = 2) AND (AIMeta_SCDIsCurrent = 1)
