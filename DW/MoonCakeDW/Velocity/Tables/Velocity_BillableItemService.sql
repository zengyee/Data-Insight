CREATE TABLE [dbo].[Velocity_BillableItemService]
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
	Id		int	,
	EDWExtractGrouping		int	,
	CreatedBy		int	,
	ModifiedOn		datetime2	,
	ServiceTypeId		int
)
