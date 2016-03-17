CREATE TABLE [dbo].[EntitlementSubscribers]
(
		Id		int NOT NULL	,
	PUID		nvarchar(200),
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	EDWSourceExtractID		varchar(40),
	WindowsLiveId		nvarchar(255),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceSystemID		int	,
	CreatedOn		datetime2	,
	EDWLastUpdated		datetime, 
    CONSTRAINT [PK_EntitlementSubscribers] PRIMARY KEY ([Id])

)
