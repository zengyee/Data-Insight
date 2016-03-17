CREATE TABLE [dbo].[QuarterlyUsageSummary_temp]
(
	[Id] [int] NOT NULL,
	[EnrollmentId] [int] NOT NULL,
	[Month] [datetime] NOT NULL,
	[BeginBalance] [numeric](15, 2) NOT NULL,
	[NewPurchases] [numeric](15, 2) NOT NULL,
	[SIECredit] [numeric](15, 2) NOT NULL,
	[PromoCredit] [numeric](15, 2) NOT NULL,
	[Utilized] [numeric](15, 2) NOT NULL,
	[EndBalance] [numeric](15, 2) NOT NULL,
	[ChargesBilledSeparately] [numeric](15, 2) NOT NULL,
	[Overage] [numeric](15, 2) NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[ModifiedOn] [datetime2](7) NOT NULL, 
    CONSTRAINT [PK_QuarterlyUsageSummary_temp] PRIMARY KEY ([Id])
)

GO

CREATE INDEX [IX_QuarterlyUsageSummary_temp_ModifiedOn] ON [dbo].[QuarterlyUsageSummary_temp] ([ModifiedOn])
