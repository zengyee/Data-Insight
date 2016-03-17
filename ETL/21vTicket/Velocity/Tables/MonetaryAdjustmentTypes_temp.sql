CREATE TABLE [dbo].[MonetaryAdjustmentTypes_temp]
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
    CONSTRAINT [PK_MonetaryAdjustmentTypes_temp] PRIMARY KEY ([Id])

)
