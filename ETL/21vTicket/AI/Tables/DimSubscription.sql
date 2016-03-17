﻿CREATE TABLE [dbo].[DimSubscription]
(
	[DimSubscriptionKey] INT NOT NULL ,	
	[DimBillingSystemKey] [int] NULL,
	[SubscriptionGUID] [uniqueidentifier] NULL,
	[DataSource] [nvarchar](100) NULL,
	[SubscriptionName] [nvarchar](256) NULL,
	[SubscriptionCreatedDate] [datetime] NULL,
	[AnniversaryDate] [tinyint] NULL,
	[AI_FirstUseDate] [datetime] NULL,
	[AI_FirstInvoiceDate] [datetime] NULL,
	[AI_SubscriptionCanceledDate] [datetime] NULL,
	[SubscriptionStartDate] [datetime] NULL,
	[SubscriptionEndDate] [datetime] NULL,
	[PaymentMethodType] [nvarchar](255) NULL,
	[NonRenewalReasonName] [nvarchar](50) NULL,
	[IsAutoRenew] [nvarchar](1) NULL,
	[HasTransitioned] [nvarchar](1) NULL,
	[IncludedQuantity] [int] NULL,
	[AllowedOverageQuantity] [int] NULL,
	[BillingCycle] [nvarchar](100) NULL,
	[FriendlySubscriptionName] [nvarchar](200) NULL,
	[SubscriptionStatusModifier] [nvarchar](128) NULL,
	[CustomerId] [nvarchar](16) NULL,
	[ChannelType] [nvarchar](1000) NULL,
	[EndCustomerSubAccount] [nvarchar](1024) NULL,
	[AI_IsTest] [bit] NULL,
	[AI_BillingType] [varchar](30) NULL,
	[AI_AccountType] [varchar](30) NULL,
	[AI_PassStatus] [varchar](30) NULL,
	[AI_CreatedAsTrial] [bit] NULL,
	[AI_TrialToPaidConversion] [bit] NULL,
	[AI_TrialToPaidConversionDate] [datetime] NULL,
	[AI_SubscriptionStatus] [nvarchar](16) NULL,
	[AI_IsSupport] [bit] NULL,
	[AIMeta_SCDIsCurrent] [bit] NULL,
	[AIMeta_SCDEffectiveFrom] [datetime2](7) NULL,
	[AIMeta_SCDEffectiveTo] [datetime2](7) NULL,
	[DurableDimSubscriptionKey] [int] NULL,
	[OMSSubscriptionIdentifier] [uniqueidentifier] NULL,
	[V1SubscriptionIdentifier] [nvarchar](256) NULL,
	[MINTSubscriptionIdentifier] [int] NULL,
	[OMSMINTSubscriptionIdentifier] [nvarchar](50) NULL,
	[i_billable_acct_id] [bigint] NULL,
	[si_subscription_ref_id] [smallint] NULL,
	[OmsAcctId] [nvarchar](36) NULL,
	[OmsSubscriptionId] [nvarchar](36) NULL,
	[CTPBDKID] [varchar](64) NULL,
	[MTSubscriptionAccountIdentifier] [int] NULL,
	[MTSubscriptionIdentifier] [int] NULL,
	[UXSubscriptionIdentifier] [nvarchar](255) NULL,
	[CurrentStateEndDate] [datetime] NULL,
	[ExternalSubscriptionIdentifier] [uniqueidentifier] NULL,
	[ExternalData] [nvarchar](2000) NULL,
	[AtlasIdentifier] [nvarchar](128) NULL,
	[RIOIdentifier] [nvarchar](128) NULL,
	[WebTrendsReferralSource] [nvarchar](128) NULL,
	[WebTrendsCampaignIdentifier] [nvarchar](128) NULL,
	[AccountSKUIdentifier] [uniqueidentifier] NULL,
	[MonetaryCapReachedNotify] [int] NULL,
	[AdminPUID] [nvarchar](200) NULL,
	[AI_AdminPUIDWebtrendsHash] [nvarchar](255) NULL,
	[IsFraudIdentified] [bit] NULL,
	[FraudIdentifiedDate] [datetime] NULL,
	[TPID] [int] NULL,
	[Tier1PartnerMPNId] [int] NULL,
	[Tier2PartnerMPNId] [int] NULL,
	[CAID] [nvarchar](1000) NULL,
	[SubscriptionID] [nvarchar](1000) NULL,
	[AI_IsCSP] [bit] NULL,
	[AI_Locked] [bit] NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[AIMeta_CreatedDimAuditKey] [bigint] NULL,
	[AIMeta_UpdatedDimAuditKey] [bigint] NULL, 
    CONSTRAINT [PK_DimSubscription] PRIMARY KEY ([DimSubscriptionKey])
)