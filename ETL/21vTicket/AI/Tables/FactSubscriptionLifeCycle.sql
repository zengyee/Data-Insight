﻿CREATE TABLE [dbo].[FactSubscriptionLifeCycle]
(
	[FactSubscriptionLifeCycleKey] [bigint] NOT NULL,
	[DimDateKey] [int] NULL,
	[DimSubscriptionKey] [int] NULL,
	[DimAccountKey] [int] NULL,
	[DimOfferKey] [int] NULL,
	[DimSubscriptionStatusKey] [int] NULL,
	[ParentDimSubscriptionKey] [int] NULL,
	[BillingDimGeographyKey] [int] NULL,
	[ServiceUseDimGeographyKey] [int] NULL,
	[TenantDimGeographyKey] [int] NULL,
	[DimChannelKey] [int] NULL,
	[DimBillingSystemKey] [int] NULL,
	[SubscriptionCreatedDimDateKey] [int] NULL,
	[SubscriptionCreatedDate] [datetime] NULL,
	[TrialStartDimDateKey] [int] NULL,
	[TrialStartDate] [datetime] NULL,
	[TrialEndDimDateKey] [int] NULL,
	[TrialEndDate] [datetime] NULL,
	[PaidStartDimDateKey] [int] NULL,
	[PaidStartDate] [datetime] NULL,
	[PaidEndDimDateKey] [int] NULL,
	[PaidEndDate] [datetime] NULL,
	[TrialToPaidConversionDimDateKey] [int] NULL,
	[TrialToPaidConversionDate] [datetime] NULL,
	[AI_FirstUseDimDateKey] [int] NULL,
	[AI_FirstUseDate] [datetime] NULL,
	[AI_LastUseDimDateKey] [int] NULL,
	[AI_LastUseDate] [datetime] NULL,
	[AI_DaysSinceLastUse] [int] NULL,
	[AI_FirstInvoiceDimDateKey] [int] NULL,
	[AI_FirstInvoiceDate] [datetime] NULL,
	[AI_LastInvoiceDimDateKey] [int] NULL,
	[AI_LastInvoiceDate] [datetime] NULL,
	[LastTrialExtendedDimDateKey] [int] NULL,
	[LastTrialExtendedDate] [datetime] NULL,
	[LastDisabledDimDateKey] [int] NULL,
	[LastDisabledDate] [datetime] NULL,
	[LastWarnedDimDateKey] [int] NULL,
	[LastWarnedDate] [datetime] NULL,
	[AI_Expired] [bit] NULL,
	[AI_SubscriptionStatus] [nvarchar](16) NULL,
	[AI_SubscriberCanceled] [bit] NULL,
	[AI_CanceledDimDateKey] [int] NULL,
	[AI_CanceledDate] [datetime] NULL,
	[DeprovisionedDimDateKey] [int] NULL,
	[DeprovisionedDate] [datetime] NULL,
	[LastStatusChangeDimDateKey] [int] NULL,
	[LastStatusChangeDate] [datetime] NULL,
	[PaidIncludedQuantity] [int] NULL,
	[PaidAllowedOverageQuantity] [int] NULL,
	[TrialIncludedQuantity] [int] NULL,
	[TrialAllowedOverageQuantity] [int] NULL,
	[SubscriptionCount] [int] NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[AIMeta_CreatedDimAuditKey] [bigint] NULL,
	[AIMeta_UpdatedDimAuditKey] [bigint] NULL, 
    CONSTRAINT [PK_FactSubscriptionLifeCycle] PRIMARY KEY ([FactSubscriptionLifeCycleKey]))
