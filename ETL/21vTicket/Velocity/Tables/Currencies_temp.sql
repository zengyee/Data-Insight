CREATE TABLE [dbo].[Currencies_temp]
(
		Id		int NOT NULL	,
	EDWFirstInserted		datetime	,
	EDWExtractGrouping		int,
	EDWSourceExtractID		varchar(40),
	EDWSourceSystemID		int	,
	CurrencyCode		nchar(5),
	EDWLastUpdated		datetime,
	CurrencyName		nvarchar(35),
	EDWProcessID		int	,
	EDWIsDeletedFlag		bit, 
    CONSTRAINT [PK_Currencies_temp] PRIMARY KEY ([Id])	

)
