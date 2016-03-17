CREATE TABLE [dbo].[Services]
(
		[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NOT NULL, 
    CONSTRAINT [PK_Services] PRIMARY KEY ([Id])
)
