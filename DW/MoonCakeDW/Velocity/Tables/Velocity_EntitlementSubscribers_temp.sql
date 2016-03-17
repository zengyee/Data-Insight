CREATE TABLE [dbo].[Velocity_EntitlementSubscribers_temp]
(
		Id		int	,
	PUID		nvarchar(200),
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	EDWSourceExtractID		varchar(40),
	WindowsLiveId		nvarchar(255),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceSystemID		int	,
	CreatedOn		datetime2	,
	EDWLastUpdated		datetime

)
