CREATE TABLE [dbo].[Velocity_PurchaseOrders]
(
	EDWSourceExtractID		varchar(40),
	EDWExtractGrouping		int,
	EDWFirstInserted		datetime,
	PurchaseOrderKey		nvarchar(36),
	CurrencyId		int	,
	PriceSheetId		int	,
	ModifiedBy		int	,
	CreatedOn		datetime2,
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime	,
	PurchaseOrderNumber		nvarchar(30),
	CreatedBy		int,
	Version		int,
	EnrollmentId		int	,
	EDWProcessID		int	,
	OverrideCommitmentPurchase		bit,
	Id		int,
	StatusId		int,
	EDWIsDeletedFlag		bit	,
	StartsOn		datetime2	,
	SourceModifiedDate		datetime2	,
	ModifiedOn		datetime2	

)
