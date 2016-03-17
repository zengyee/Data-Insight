CREATE TABLE [dbo].[ExternalAccounts]
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
	Id		int NOT NULL,
	MintAccountId		nvarchar(50	), 
    CONSTRAINT [PK_ExternalAccounts] PRIMARY KEY ([Id])
)
