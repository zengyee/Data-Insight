CREATE TABLE [dbo].[Velocity_ServiceResources_temp]
(
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	Id		int	,
	EDWSourceExtractID		varchar(40),
	EDWFirstInserted		datetime,
	EDWExtractGrouping		int	,
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime,
	Name		nvarchar(50),
	Description		nvarchar(255)

)
