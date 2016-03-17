CREATE TABLE [dbo].[AccountsSubscriptions]
(
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[SubscriptionId] [bigint] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime2](7) NULL,
	[ModifiedBy] [int] NULL,
	[StartsOn] [datetime2](7) NULL,
	[EndsOn] [datetime2](7) NULL, 
    --CONSTRAINT [FK_Velocity_AccountsSubscriptions_Accounts] FOREIGN KEY ([AccountId]) REFERENCES [Accounts]([Id]), 
    --CONSTRAINT [FK_Velocity_AccountsSubscriptions_Subscription] FOREIGN KEY ([SubscriptionId]) REFERENCES [Subscription]([Id]), 
    CONSTRAINT [PK_AccountsSubscriptions] PRIMARY KEY ([Id])
)
