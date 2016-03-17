CREATE TABLE [dbo].[EnrollmentAttributes]
(
		EDWExtractGrouping		int	,
	Name		nvarchar(50	),
	EDWSourceSystemID		int,
	EDWLastUpdated		datetime,
	Value		int	,
	EDWIsDeletedFlag		bit,
	EDWProcessID		int	,
	Id		int NOT NULL	,
	EDWFirstInserted		datetime,
	EDWSourceExtractID		varchar(40), 
    CONSTRAINT [PK_EnrollmentAttributes] PRIMARY KEY ([Id])
)
