CREATE TABLE [dbo].[BillableItemPrice_temp]
(
		PartNumber		nvarchar(16),
	OriginalPrice		numeric(12,4),
	NormalizedPrice		numeric(12,4),
	StartsOn		datetime2,
	EDWSourceSystemID		int	,
	BillableItemId		int,
	EDWLastUpdated		datetime,
	ModifiedOn		datetime2,
	Price		numeric(12,4),
	AdjustmentType		nvarchar(50),
	Comments		nvarchar(1000),
	SourceTypeId		int,
	EDWIsDeletedFlag		bit,
	EnrollmentId		int,
	CreatedOn		datetime2,
	EndsOn		datetime2,
	EDWProcessID		int,
	TierType		nvarchar(25),
	ModifiedBy		int	,
	Id		int NOT NULL,
	EDWFirstInserted		datetime,
	CurrencyId		int,
	EDWSourceExtractID		varchar	(40),
	SourceKey		bigint,
	BillableItemType		nvarchar(20),
	EDWExtractGrouping		int,
	CreatedBy		int, 
    CONSTRAINT [PK_BillableItemPrice_temp] PRIMARY KEY ([Id])

)

GO

CREATE INDEX [IX_BillableItemPrice_temp_ModifiedOn] ON [dbo].[BillableItemPrice_temp] ([ModifiedOn])
