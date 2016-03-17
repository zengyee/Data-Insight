CREATE TABLE [dbo].[FactServiceBilling]
(	[FactServiceBillingKey] BIGINT NOT NULL PRIMARY KEY
    ,[DimBillingSystemKey] INT NULL
    ,[DimBillingPeriodsKey] INT NULL
    ,[DimSubscriptionKey] INT NULL
    ,[DimAccountKey] INT NULL
    ,[DimOfferKey] INT NULL
    ,[DimRatingParameterKey] INT NULL
    ,[ResourceGUID]  [uniqueidentifier] NULL
    ,[DimServiceKey] INT NULL
    ,[MeteredRegion] [nvarchar](255) NULL
    ,[BilledUSD] [numeric](18, 8) NULL
    ,[BilledLC] [numeric](18, 8) NULL
    ,[BilledCD] [numeric](18, 8) NULL
    ,[UnitsMetered] [numeric](18, 8) NULL
    ,[UnitsRated] [numeric](18, 8) NULL
    ,[UnitsFree] [numeric](18, 8) NULL
    ,[UnitsPaid] [numeric](18, 8) NULL
    ,[SubsidiaryID] INT NULL
    ,[WorkloadKey] INT NULL
    ,[AIMeta_CreatedAt] [datetime2](7) NULL
    ,[AIMeta_UpdatedAt] [datetime2](7) NULL
    ,[AIMeta_CreatedDimAuditKey] [bigint] NULL
    ,[AIMeta_UpdatedDimAuditKey] [bigint] NULL
    ,[AIMeta_IsDeleted] BIT NULL
)
