CREATE TABLE [dbo].[Services_temp]
(
		[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NOT NULL, 
    CONSTRAINT [PK_Services_temp] PRIMARY KEY ([Id])
)
