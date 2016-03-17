CREATE TABLE [dbo].[v_Customer_Top20]
(
	[CustomerId] [nvarchar](36) NULL,
	[YearMonth] [date] NULL,
	[CustomerOrder] [int] NULL,
	[BurndownConsumption] [numeric](38, 2) NULL,
	[RawConsumption] [numeric](38, 2) NULL
)
