CREATE TABLE [dbo].[Accounts]
(
	[Id] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[IsOrgIdPUID] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[WindowsLiveId] [nvarchar](255) NOT NULL,
	[Version] [int] NOT NULL,
	[UserId] [int] NULL,
	[BisLastUpdated] [datetime2](7) NULL,
	[FirstName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL, 
    CONSTRAINT [PK_Velocity_Accounts] PRIMARY KEY ([Id])
)
GO
CREATE INDEX [IX_Accounts_ModifiedOn] ON [dbo].[Accounts] ([ModifiedOn])

GO

CREATE INDEX [IX_Accounts_WindowsLiveId] ON [dbo].[Accounts] ([WindowsLiveId])
