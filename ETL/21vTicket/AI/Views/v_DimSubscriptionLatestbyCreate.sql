﻿CREATE VIEW [dbo].[v_DimSubscriptionLatestbyCreate]
	AS 
	SELECT c.* FROM 
		(SELECT ROW_NUMBER() OVER (PARTITION BY [SUBSCRIPTIONGUID] ORDER BY [AIMeta_CreatedAt] DESC) AS rowid,* FROM [DIMSUBSCRIPTION]) c  
		WHERE c.rowid = 1