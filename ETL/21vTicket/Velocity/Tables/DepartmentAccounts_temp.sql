CREATE TABLE [dbo].[DepartmentAccounts_temp]
(
		ModifiedOn		datetime2,
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime	,
	CreatedOn		datetime2,
	AccountId		int,
	EDWProcessID		int,
	EDWIsDeletedFlag		bit,
	ModifiedBy		int	,
	Id		int NOT NULL	,
	StartsOn		date	,
	EDWSourceExtractID		varchar(40),
	CreatedBy		int	,
	EDWExtractGrouping		int,
	EDWFirstInserted		datetime,
	DepartmentId		int,
	EndsOn		date, 
    CONSTRAINT [PK_DepartmentAccounts_temp] PRIMARY KEY ([Id])

)
