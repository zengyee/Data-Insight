﻿CREATE TABLE [dbo].[Velocity_MonetaryAdjustmentTypes]
(
		Description		nvarchar(255),
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceSystemID		int	,
	Id		int,
	EDWLastUpdated		datetime
)