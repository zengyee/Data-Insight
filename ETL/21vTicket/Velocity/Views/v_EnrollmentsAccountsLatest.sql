CREATE VIEW [dbo].[v_EnrollmentsAccountsLatest]
	AS 
	SELECT ea.* FROM 
		(SELECT ROW_NUMBER() OVER (PARTITION BY [AccountId] ORDER BY [CreatedOn] DESC ) as rowid, * FROM [EnrollmentsAccounts]) ea
	WHERE ea.rowid = 1 