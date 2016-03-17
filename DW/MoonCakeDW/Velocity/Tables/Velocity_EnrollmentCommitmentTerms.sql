CREATE TABLE [dbo].[Velocity_EnrollmentCommitmentTerms]
(
		EDWProcessID		int,
	EDWIsDeletedFlag		bit	,
	EnrollmentId		int,
	EDWSourceExtractID		varchar(40),
	FormattedTermDate		nvarchar(255),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int,
	TermStartDate		date,
	CreatedOn		datetime2	,
	EDWLastUpdated		datetime	,
	EDWSourceSystemID		int,
	TermEndDate		date	,
	ModifiedOn		datetime2	,
	Id		int	 
)
