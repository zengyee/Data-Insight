CREATE TABLE [dbo].[MonetaryAdjustmentTypes]
(
		Description		nvarchar(255),
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceSystemID		int	,
	Id		int NOT NULL,
	EDWLastUpdated		datetime, 
    CONSTRAINT [PK_MonetaryAdjustmentTypes] PRIMARY KEY ([Id])
)
