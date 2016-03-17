CREATE TABLE [dbo].[DimSubscriptionStatus]
(
	[DimSubscriptionStatusKey] INT NOT NULL PRIMARY KEY,
	[DimBillingSystemKey] [int] NULL,
	[SubscriptionStatusIdentifier] [int] NULL,
	[SubscriptionStatusName] [nvarchar](500) NULL,
	[BillingStatusIdentifier] [int] NULL,
	[BillingStatusName] [nvarchar](500) NULL,
	[ProvisioningStatusIdentifier] [int] NULL,
	[ProvisioningStatusName] [nvarchar](500) NULL,
	[AIMeta_SCDIsCurrent] [bit] NULL,
	[AIMeta_SCDEffectiveFrom] [datetime2](7) NULL,
	[AIMeta_SCDEffectiveTo] [datetime2](7) NULL
)
