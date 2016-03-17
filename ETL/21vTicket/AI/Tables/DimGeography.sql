﻿CREATE TABLE [dbo].[DimGeography](
	[DimGeographyKey] [int] NULL,
	[BigAreaIdentifier] [smallint] NULL,
	[BigAreaCode] [nvarchar](20) NULL,
	[BigAreaName] [nvarchar](50) NULL,
	[AreaIdentifier] [smallint] NULL,
	[AreaCode] [nvarchar](20) NULL,
	[AreaName] [nvarchar](50) NULL,
	[Area] [nvarchar](10) NULL,
	[RegionIdentifier] [smallint] NULL,
	[RegionCode] [nvarchar](20) NULL,
	[RegionName] [nvarchar](50) NULL,
	[SubregionIdentifier] [smallint] NULL,
	[SubregionCode] [nvarchar](20) NULL,
	[SubregionName] [nvarchar](50) NULL,
	[SubsidiaryIdentifier] [smallint] NULL,
	[SubsidiaryCode] [nvarchar](20) NULL,
	[SubsidiaryName] [nvarchar](50) NULL,
	[CurrencyIdentifier] [smallint] NULL,
	[CurrencyCode] [nvarchar](20) NULL,
	[CurrencyName] [nvarchar](50) NULL,
	[CountryIdentifier] [smallint] NULL,
	[ISOCountryCode] [nvarchar](20) NULL,
	[CountryCode] [nvarchar](20) NULL,
	[CountryName] [nvarchar](50) NULL,
	[SortKey] [smallint] NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[AIMeta_CreatedDimAuditKey] [bigint] NULL,
	[AIMeta_UpdatedDimAuditKey] [bigint] NULL,
	[AIMeta_SCDIsCurrent] [bit] NULL,
	[AIMeta_SCDEffectiveFrom] [datetime2](7) NULL,
	[AIMeta_SCDEffectiveTo] [datetime2](7) NULL
) ON [PRIMARY]


