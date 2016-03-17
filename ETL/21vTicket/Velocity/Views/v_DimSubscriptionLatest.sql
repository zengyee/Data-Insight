CREATE VIEW [dbo].[v_DimSubscriptionLatest]
	AS 
	SELECT sub.* FROM 
		(SELECT ROW_NUMBER() OVER (PARTITION BY [MOCPSubscriptionGuid] ORDER BY [CreatedOn] DESC ) as rowid, * FROM [Subscription]) sub
	WHERE sub.rowid = 1 