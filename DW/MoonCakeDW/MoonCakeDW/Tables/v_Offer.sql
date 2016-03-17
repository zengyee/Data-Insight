CREATE TABLE [dbo].[v_Offer]
(
[DataSource] [nvarchar](100) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[SubscriptionGUID] [uniqueidentifier] NULL,
	[SubscriptionID] [nvarchar](1000) NULL,
	[SubscriptionStartDate] [datetime] NULL,
	[SubscriptionEndDate] [datetime] NULL,
	[AI_SubscriptionStatus] [nvarchar](16) NULL,
	[AI_TrialToPaidConversion] [bit] NULL,
	[AI_TrialToPaidConversionDate] [datetime] NULL,
	[AI_AccountType] [varchar](30) NULL
)
