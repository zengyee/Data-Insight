CREATE TABLE [dbo].[BillableItemService_temp]
(
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime,
	ServiceResourceId		int	,
	BillableItemId		int	,
	ResourceGUID		uniqueidentifier,
	EDWProcessID		int	,
	CreatedOn		datetime2	,
	EDWIsDeletedFlag		bit	,
	ServiceId		int	,
	ServiceRegionId		int	,
	EDWFirstInserted		datetime,
	ModifiedBy		int,
	EDWSourceExtractID		varchar	(40),
	Id		int NOT NULL	,
	EDWExtractGrouping		int	,
	CreatedBy		int	,
	ModifiedOn		datetime2	,
	ServiceTypeId		int, 
    CONSTRAINT [PK_BillableItemService_temp] PRIMARY KEY ([Id])

)
