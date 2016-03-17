CREATE TABLE [dbo].[ServiceResources_temp]
(
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	Id		int NOT NULL	,
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime,
	Name		nvarchar(50),
	Description		nvarchar(255), 
    CONSTRAINT [PK_ServiceResources_temp] PRIMARY KEY ([Id])

)
