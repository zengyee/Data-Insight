CREATE TABLE [dbo].[EnrollmentParticipants]
(
		OrganizationId		int,
	EDWExtractGrouping		int,
	StatusId		int	,
	ParticipantTypeCode		char(3),
	ModifiedOn		datetime2,
	Id		int NOT NULL	,
	EDWLastUpdated		datetime,
	EDWSourceSystemID		int,
	StartsOn		datetime2	,
	AgreementParticipantKey		nvarchar(36),
	EDWProcessID		int	,
	ModifiedBy		int	,
	CreatedOn		datetime2	,
	EnrollmentId		int	,
	EDWIsDeletedFlag		bit	,
	ParticipantType		nvarchar(31),
	CreatedBy		int,
	EndsOn		datetime2	,
	EDWFirstInserted		datetime	,
	EDWSourceExtractID		varchar	(40), 
    CONSTRAINT [PK_EnrollmentParticipants] PRIMARY KEY ([Id])
)
