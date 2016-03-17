CREATE TABLE [dbo].[DimBillingSystem]
(
	[DimBillingSystemKey] INT NOT NULL PRIMARY KEY,
	[BillingSystemIdentifier] [nvarchar](50) NULL,
	[BillingSystemName] [nvarchar](50) NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[AIMeta_CreatedDimAuditKey] [bigint] NULL,
	[AIMeta_UpdatedDimAuditKey] [bigint] NULL,
	[AIMeta_SCDType1ColumnHash] [binary](16) NULL,
	[AIMeta_SCDType2ColumnHash] [binary](16) NULL,
	[AIMeta_SCDIsCurrent] [bit] NULL,
	[AIMeta_SCDEffectiveFrom] [datetime2](7) NULL,
	[AIMeta_SCDEffectiveTo] [datetime2](7) NULL
)
