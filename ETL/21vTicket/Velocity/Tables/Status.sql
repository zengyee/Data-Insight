﻿CREATE TABLE [dbo].[Status]
(
	RelatedType		nvarchar(50),
	EDWProcessID		int,
	ExternalStatusCode		nvarchar(50	),
	EDWIsDeletedFlag		bit	,
	Name		nvarchar(50	),
	EDWExtractGrouping		int	,
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	Value		int	,
	Id		int NOT NULL	,
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime, 
    CONSTRAINT [PK_Status] PRIMARY KEY ([Id])
)