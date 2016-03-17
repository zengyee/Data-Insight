CREATE VIEW [dbo].[v_DimSubscriptionCurrent]
	AS 
	SELECT * FROM [DimSubscription] WHERE AIMeta_SCDIsCurrent = 1