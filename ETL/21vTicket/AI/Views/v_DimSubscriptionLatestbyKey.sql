﻿CREATE VIEW [dbo].[v_DimSubscriptionLatestbyKey]
	AS 
	SELECT k.* FROM 
		(SELECT ROW_NUMBER() OVER (PARTITION BY [SUBSCRIPTIONGUID] ORDER BY DIMSUBSCRIPTIONKEY DESC) AS rowid,* FROM [DIMSUBSCRIPTION]) k 
		WHERE k.rowid = 1