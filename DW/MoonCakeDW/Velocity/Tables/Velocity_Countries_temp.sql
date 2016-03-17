CREATE TABLE [dbo].[Velocity_Countries_temp]
(
		EDWLastUpdated		datetime,
	Id		int,
	LanguageCode		nvarchar(15),
	EDWProcessID		int	,
	ISOCountryCode		nvarchar(15	),
	EDWIsDeletedFlag		bit	,
	Name		nvarchar(255),
	PriceListCountryCode		nvarchar(15),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceExtractID		varchar(40),
	EDWSourceSystemID		int	,
	CountryCode		nvarchar(15	),
	BillingCurrencyCode		nvarchar(15	)

)
