CREATE TABLE [dbo].[EnrollmentAttributes_temp]
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
    CONSTRAINT [PK_EnrollmentAttributes_temp] PRIMARY KEY ([Id])

)
