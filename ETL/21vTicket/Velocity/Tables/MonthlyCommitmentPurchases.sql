CREATE TABLE [dbo].[MonthlyCommitmentPurchases]
(
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int,
	ActualQuantityOrdered		int,
	Month		datetime2,
	EDWLastUpdated		datetime,
	EDWSourceSystemID		int	,
	BillableItemPriceId		int	,
	EDWProcessID		int	,
	MonthlyPurchase		numeric	(19,10),
	EDWIsDeletedFlag		bit,
	Id		int NOT NULL,
	PurchaseOrderLineItemId		int, 
    CONSTRAINT [PK_MonthlyCommitmentPurchases] PRIMARY KEY ([Id])

)

GO
