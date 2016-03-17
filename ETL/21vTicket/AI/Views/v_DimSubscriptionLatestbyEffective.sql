CREATE VIEW [dbo].[v_DimSubscriptionLatestbyEffective]
	AS 
	SELECT e.* FROM 
		(SELECT ROW_NUMBER() OVER (PARTITION BY [SUBSCRIPTIONGUID] ORDER BY [AIMeta_SCDEffectiveFrom] DESC) AS rowid,* FROM [DIMSUBSCRIPTION]) e  
		WHERE e.rowid = 1


