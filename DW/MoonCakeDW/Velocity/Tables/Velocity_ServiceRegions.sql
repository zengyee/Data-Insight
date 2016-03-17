CREATE TABLE [dbo].[Velocity_ServiceRegions]
(
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime,
	Description		nvarchar(50),
	ParentId		int	,
	Id		int,
	EDWIsDeletedFlag		bit,
	EDWProcessID		int,
	Name		nvarchar(50	),
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	

)
