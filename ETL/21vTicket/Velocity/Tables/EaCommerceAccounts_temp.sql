CREATE TABLE [dbo].[EaCommerceAccounts_temp]
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
	Id		int NOT NULL	,
	EDWFirstInserted		datetime	,
	OrgObjectId		uniqueidentifier	,
	CreatedOn		datetime2	,
	ModifiedBy		int	,
	EDWLastUpdated		datetime,
	EDWSourceSystemID		int	,
	AccountId		int, 
    CONSTRAINT [PK_EaCommerceAccounts_temp] PRIMARY KEY ([Id])	 

)
