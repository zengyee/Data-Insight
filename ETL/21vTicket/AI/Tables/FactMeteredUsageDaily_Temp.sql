﻿CREATE TABLE [dbo].[FactMeteredUsageDaily_Temp](
	[DimDateKey] [int] NOT NULL,
	[DimSubscriptionKey] [int] NOT NULL,
	[DimTenantKey] [int] NOT NULL,
	[DimAccountKey] [int] NOT NULL,
	[DimOfferKey] [int] NOT NULL,
	[BillingDimGeographyKey] [int] NOT NULL,
	[ServiceUseDimGeographyKey] [int] NOT NULL,
	[TenantDimGeographyKey] [int] NOT NULL,
	[AccountDimGeographyKey] [int] NOT NULL,
	[DimInfoFieldKey] [int] NULL,
	[DimRatingParameterKey] [int] NULL,
	[DimServiceKey] [int] NOT NULL,
	[DimBillingSystemKey] [int] NOT NULL,
	[TotalUnits] [numeric](18, 8) NULL,
	[AI_SQLStorageMB] [numeric](18, 8) NULL,
	[AI_NormalizedUsage] [numeric](18, 10) NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[AIMeta_CreatedDimAuditKey] [bigint] NULL,
	[AIMeta_UpdatedDimAuditKey] [bigint] NULL,
	[ResourceGUID] [uniqueidentifier] NULL,
	[DimImageTypeKey] [int] NULL,
	[DimLocationKey] [int] NOT NULL,
	[DimMeteredServiceKey] [int] NOT NULL,
	[DimProjectKey] [int] NOT NULL--, 
    --CONSTRAINT [PK_FactMeteredUsageDaily_Temp] PRIMARY KEY ([DimDateKey], [DimSubscriptionKey], [DimTenantKey], [DimAccountKey], [DimOfferKey], [BillingDimGeographyKey], [ServiceUseDimGeographyKey], [TenantDimGeographyKey], [AccountDimGeographyKey], [DimServiceKey], [DimBillingSystemKey], [DimLocationKey], [DimMeteredServiceKey], [DimProjectKey]) 
) ON [PRIMARY]
