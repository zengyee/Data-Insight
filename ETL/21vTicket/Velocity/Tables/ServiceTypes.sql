CREATE TABLE [dbo].[ServiceTypes]
(
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NOT NULL, 
    CONSTRAINT [PK_ServiceTypes] PRIMARY KEY ([Id])
)
