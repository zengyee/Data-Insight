CREATE TABLE [dbo].[Velocity_Invoices]
(
		[InvoiceType] [nvarchar](3) NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[OperationCenterId] [int] NULL,
	[BillingCycleStartDate] [datetime2](7) NULL,
	[EnrollmentId] [int] NULL,
	[Comments] [nvarchar](500) NULL,
	[CreatedOn] [datetime2](7) NULL,
	[AssignedTo] [int] NULL,
	[ModifiedBy] [int] NULL,
	[EndCustomerId] [int] NULL,
	[AssignedOn] [datetime2](7) NULL,
	[RegionId] [int] NULL,
	[BillingCycleEndDate] [datetime2](7) NULL,
	[ReadyToInvoiceOn] [datetime2](7) NULL,
	[Id] [int] NULL,
	[PurchaseOrderNumber] [nvarchar](30) NULL,
	[ErrCount] [int] NULL,
	[ChannelPartnerId] [int] NULL,
	[StatusId] [int] NULL,
	[CompletedOn] [datetime2](7) NULL
)
