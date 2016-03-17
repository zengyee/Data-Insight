CREATE TABLE [dbo].[HMC_Subscription_Temp]
(
	[SubscriptionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [EndCustomerName] NVARCHAR(150) NULL,
	[EnglishName] NVARCHAR(100) NULL
)
