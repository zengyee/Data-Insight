CREATE TABLE [dbo].[agreementParticipants_temp]
(
	Id		int NOT NULL,
	EDWExtractGrouping		int,
	AgreementParticipantKey		nvarchar(36),
		EDWFirstInserted		datetime,
	EmailContact		nvarchar	(129),
		[Version]		int,
			StartsOn		datetime2,
	ModifiedOn		datetime2,
		EDWSourceSystemID		int,
	ParticipantType		nvarchar(31),
	EDWLastUpdated		datetime,
		EnrollmentId		int,
	EndsOn		datetime2,
		StatusId		int,
	CreatedOn		datetime2,
		EDWProcessID		int,
	EDWIsDeletedFlag		bit,
		ModifiedBy		int,
	OrganizationId		int,
	PriceListCustomerTypeCode		nvarchar(10),
	Email		nvarchar(129),
	CreatedBy		int,
	EDWSourceExtractID		varchar(40),
	SourceModifiedDate		datetime2, 
    CONSTRAINT [PK_agreementParticipants_temp] PRIMARY KEY ([Id])


)
