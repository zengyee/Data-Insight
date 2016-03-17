CREATE TABLE [dbo].[Velocity_ExternalAccounts]
(
		ModifiedOn		datetime2,
	StatusId		int	,
	EDWProcessID		int	,
	EDWIsDeletedFlag		bit	,
	CreatedOn		datetime2	,
	AccountId		int	,
	EDWSourceExtractID		varchar(40),
	ModifiedBy		int	,
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	ExternalAccountId		bigint	,
	IsActive		bit,
	CreatedBy		int	,
	EDWLastUpdated		datetime	,
	EDWSourceSystemID		int,
	Id		int,
	MintAccountId		nvarchar(50	)
)
