CREATE TABLE [dbo].[Velocity_PriceAdjustment]
(
	WorkflowStatus		int	,
	ReviewComments		nvarchar(1000),
	ModifiedOn		datetime2,
	EDWProcessID		int,
	Id		int	,
	EnrollmentNumber		nvarchar(36	),
	CreatedBy		int	,
	EndsOn		datetime2	,
	BillableItemId		int	,
	EDWSourceExtractID		varchar(40	),
	EDWIsDeletedFlag		bit	,
	EDWFirstInserted		datetime,
	WorkflowInstanceId		uniqueidentifier,
	AdjustmentType		nvarchar(25	),
	DiscountRate		decimal	(15,6),
	Name		nvarchar	(127),	
	CreatedOn		datetime2,
	ModifiedBy		int	,
	EDWExtractGrouping		int,
	EDWLastUpdated		datetime	,
	ReviewedBy		int,
	PartNumber		nvarchar(16	),
	EDWSourceSystemID		int	,
	PriceOverrideComments		nvarchar(1000),
	StartsOn		datetime2 

)
