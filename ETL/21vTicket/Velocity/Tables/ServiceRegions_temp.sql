CREATE TABLE [dbo].[ServiceRegions_temp]
(
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime,
	Description		nvarchar(50),
	ParentId		int	,
	Id		int NOT NULL,
	EDWIsDeletedFlag		bit,
	EDWProcessID		int,
	Name		nvarchar(50	),
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int, 
    CONSTRAINT [PK_ServiceRegions_temp] PRIMARY KEY ([Id])	

)
