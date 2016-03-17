CREATE TABLE [dbo].[Velocity_EnrollmentAttributes]
(
		EDWExtractGrouping		int	,
	Name		nvarchar(50	),
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime,
	Value		int	,
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	Id		int	,
	EDWFirstInserted		datetime,
	EDWSourceExtractID		varchar(40)
)
