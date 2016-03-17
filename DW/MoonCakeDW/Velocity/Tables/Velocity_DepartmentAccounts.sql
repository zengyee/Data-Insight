CREATE TABLE [dbo].[Velocity_departmentAccounts]
(
		ModifiedOn		datetime2,
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime	,
	CreatedOn		datetime2,
	AccountId		int,
	EDWProcessID		int,
	EDWIsDeletedFlag		bit,
	ModifiedBy		int	,
	Id		int	,
	StartsOn		date	,
	EDWSourceExtractID		varchar(40),
	CreatedBy		int	,
	EDWExtractGrouping		int,
	EDWFirstInserted		datetime,
	DepartmentId		int,
	EndsOn		date
)
