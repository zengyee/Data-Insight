﻿CREATE TABLE [dbo].[MonthlyItemCharges]
(
		[StatusId] [int] NOT NULL,
	[EDWLastUpdated] [datetime] NULL,
	[CommitmentResourceQty] [numeric](15, 2) NULL,
	[ItemCharges] [numeric](15, 2) NOT NULL,
	[CommitmentPriceId] [int] NULL,
	[PriceType] [nvarchar](50) NOT NULL,
	[EDWIsDeletedFlag] [bit] NULL,
	[EDWProcessID] [int] NULL,
	[Id] [int] NOT NULL,
	[ConsumptionPriceId] [int] NULL,
	[BillingMonth] [datetime2](7) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ConsumptionUnitsQty] [int] NULL,
	[EDWFirstInserted] [datetime] NULL,
	[InvoiceId] [int] NOT NULL,
	[EDWExtractGrouping] [int] NOT NULL,
	[EDWSourceExtractID] [nvarchar](40) NULL,
	[BillableItemId] [int] NOT NULL,
	[CommitmentUnitsQty] [numeric](15, 2) NULL,
	[ConsumptionResourceQty] [numeric](15, 2) NULL,
	[EDWSourceSystemID] [int] NULL,
	[ModifiedOn] [datetime2](7) NULL, 
    CONSTRAINT [PK_MonthlyItemCharges] PRIMARY KEY ([Id])
)

GO

CREATE INDEX [IX_MonthlyItemCharges_ModifiedOn] ON [dbo].[MonthlyItemCharges] ([ModifiedOn])