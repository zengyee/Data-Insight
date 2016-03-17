CREATE TABLE [dbo].[EnrollmentCommitmentTerms]
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
	Id		int NOT NULL, 
    CONSTRAINT [PK_EnrollmentCommitmentTerms] PRIMARY KEY ([Id])	 
)
