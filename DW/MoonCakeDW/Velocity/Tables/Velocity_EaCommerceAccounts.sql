CREATE TABLE [dbo].[Velocity_EaCommerceAccounts]
(
		CreatedBy		int,
	CommerceAccountId		uniqueidentifier,
	Version		int	,
	EDWProcessID		int	,
	EDWIsDeletedFlag		bit	,
	StatusId		int	,
	TenantId		uniqueidentifier	,
	EDWSourceExtractID		varchar(40),
	ModifiedOn		datetime2,
	EDWExtractGrouping		int	,
	Id		int	,
	EDWFirstInserted		datetime	,
	OrgObjectId		uniqueidentifier	,
	CreatedOn		datetime2	,
	ModifiedBy		int	,
	EDWLastUpdated		datetime,
	EDWSourceSystemID		int	,
	AccountId		int	 
)
