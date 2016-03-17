CREATE TABLE [dbo].[Velocity_Currencies]
(
		Id		int	,
	EDWFirstInserted		datetime	,
	EDWExtractGrouping		int,
	EDWSourceExtractID		varchar(40),
	EDWSourceSystemID		int	,
	CurrencyCode		nchar(5),
	EDWLastUpdated		datetime,
	CurrencyName		nvarchar(35),
	EDWProcessID		int	,
	EDWIsDeletedFlag		bit	
)
