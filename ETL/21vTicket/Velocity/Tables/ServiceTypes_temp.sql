CREATE TABLE [dbo].[ServiceTypes_temp]
(
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NOT NULL, 
    CONSTRAINT [PK_ServiceTypes_temp] PRIMARY KEY ([Id])
)
