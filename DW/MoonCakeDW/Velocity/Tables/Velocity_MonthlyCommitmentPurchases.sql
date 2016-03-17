CREATE TABLE [dbo].[Velocity_MonthlyCommitmentPurchases]
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
	Id		int,
	PurchaseOrderLineItemId		int

)
