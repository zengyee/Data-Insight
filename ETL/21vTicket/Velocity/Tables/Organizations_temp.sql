CREATE TABLE [dbo].[Organizations_temp]
(
	EDWExtractGrouping		int,
	EDWFirstInserted		datetime,
	EDWSourceExtractID		varchar(40),
	Id		int NOT NULL	,
	CountryId		int	,
	CreatedBy		int,
	EDWSourceSystemID		int	,
	ModifiedOn		datetime2,
	EDWLastUpdated		datetime,
	SourceModifiedDate		datetime2,
	OrganizationPublicNumber		nvarchar(12),
	CreatedOn		datetime2,
	AuthLevelStatusId		int	,
	EDWProcessID		int	,
	BusinessName		nvarchar(150),
	EDWIsDeletedFlag		bit,
	ModifiedBy		int,
	Version		int, 
    CONSTRAINT [PK_Organizations_temp] PRIMARY KEY ([Id])	 

)
