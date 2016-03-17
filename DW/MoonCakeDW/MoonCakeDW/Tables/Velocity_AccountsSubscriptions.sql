CREATE TABLE [dbo].[Velocity_AccountsSubscriptions]
(
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[SubscriptionId] [bigint] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [int] NULL,
	[StartsOn] [datetime2](7) NULL,
	[EndsOn] [datetime2](7) NULL
)
