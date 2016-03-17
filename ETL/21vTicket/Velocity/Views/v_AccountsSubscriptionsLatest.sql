CREATE VIEW [dbo].[v_AccountsSubscriptionsLatest]
	AS 
	SELECT acs.* FROM 
		(SELECT ROW_NUMBER() OVER (PARTITION BY [SubscriptionId] ORDER BY [CreatedOn] DESC ) as rowid, * FROM [AccountsSubscriptions]) acs
	WHERE acs.rowid = 1 