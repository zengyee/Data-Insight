﻿CREATE TABLE [dbo].[Velocity_PurchaseOrderLineItems_temp]
(
	EDWIsDeletedFlag		bit,
	POLineItemStatusCode		nchar(3),
	ExtendedLineItemAmount		numeric(15,4),
	EDWProcessID		int	,
	StatusId		int	,
	SalesOrderLineItemKey		nvarchar(36	),
	Id		int	,
	SourceModifiedDate		datetime2,
	OfferingLevelCode		char(3),
	BillingMultiplierPrice		numeric	(15,4),
	CreatedBy		int	,
	QuantityOrdered		int	,
	EDWSourceExtractID		varchar(40),
	CoveragePeriodStartDate		datetime2,
	Comments		nvarchar(1000),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int,
	BillingOptionCode		char(3),
	Version		int,
	PurchaseOrderId		int,
	ProgramId		int	,
	PartNumber		nvarchar(16),
	PricingPeriodDate		datetime2,
	PurchaseUnitQuantity		int,
	EDWSourceSystemID		int,
	CoveragePeriodEndDate		datetime2,
	ModifiedOn		datetime2,
	EDWLastUpdated		datetime,
	ProgramOfferingCode		char(3),
	AdjustmentType		int	,
	CurrencyId		int	,
	BillableItemId		int,
	ModifiedBy		int	,
	CreatedOn		datetime2 ,
	UsedPrice		numeric(15,4),
	POLineItemKey		int	

)
