CREATE TABLE [dbo].[Velocity_EnrollmentParticipants]
(
		OrganizationId		int,
	EDWExtractGrouping		int,
	StatusId		int	,
	ParticipantTypeCode		char(3),
	ModifiedOn		datetime2,
	Id		int	,
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
	EDWSourceExtractID		varchar	(40)
)
