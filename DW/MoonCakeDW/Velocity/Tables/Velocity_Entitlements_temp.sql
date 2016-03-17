CREATE TABLE [dbo].[Velocity_Entitlements_temp]
(
		EDWSourceSystemID		int,
	SubscriberId		int	,
	EDWLastUpdated		datetime,
	BenefitDetailGuid		uniqueidentifier	,
	Name		nvarchar(50),
	ExpirationDateReactivated		datetime2,
	EDWProcessID		int	,
	CreatedBy		int	,
	EDWIsDeletedFlag		bit	,
	Identifier		nvarchar(50),
	ModifiedBy		int,
	StartDate		datetime2,
	CreatedOn		datetime2	,
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceExtractID		varchar(40),
	Type		nvarchar(25	),
	Id		int,
	ExpirationDate		datetime2,
	ModifiedOn		datetime2,
	IsTempSupport		bit	

)
