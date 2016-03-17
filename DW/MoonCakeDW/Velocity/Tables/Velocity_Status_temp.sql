CREATE TABLE [dbo].[Velocity_Status_temp]
(
	RelatedType		nvarchar(50),
	EDWProcessID		int,
	ExternalStatusCode		nvarchar(50	),
	EDWIsDeletedFlag		bit	,
	Name		nvarchar(50	),
	EDWExtractGrouping		int	,
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	Value		int	,
	Id		int	,
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime

)
