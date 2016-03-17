CREATE TABLE [dbo].[EnrollmentDepartments]
(
		EDWExtractGrouping		int	,
	EndsOn		datetime2	,
	DepartmentId		int	,
	ModifiedOn		datetime2	,
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime	,
	EnrollmentId		int,
	ModifiedBy		int,
	CreatedOn		datetime2,
	EDWProcessID		int	,
	EDWIsDeletedFlag		bit	,
	Id		int NOT NULL	,
	CreatedBy		int,
	StartsOn		datetime2	,
	EDWFirstInserted		datetime	,
	EDWSourceExtractID		varchar(40), 
    CONSTRAINT [PK_EnrollmentDepartments] PRIMARY KEY ([Id])

)
