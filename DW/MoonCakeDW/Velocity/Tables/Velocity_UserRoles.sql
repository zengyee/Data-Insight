CREATE TABLE [dbo].[Velocity_UserRoles]
(
	[CreatedBy] [int] NOT NULL,
	[EDWSourceExtractID] [nvarchar](40) NULL,
	[EDWFirstInserted] [datetime] NULL,
	[EDWExtractGrouping] [int] NOT NULL,
	[EntityType] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[EDWSourceSystemID] [int] NULL,
	[EDWLastUpdated] [datetime] NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[EDWIsDeletedFlag] [bit] NULL,
	[EDWProcessID] [int] NULL,
	[Id] [int] NOT NULL,
	[EntityId] [int] NOT NULL
)
