CREATE TABLE [dbo].[CCIC_Customer]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[EnglishName] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[HMC] [bit] NULL,
	[CAT] [nvarchar](100) NULL,
	[Scenario] [nvarchar](100) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[HiPo] [bit] NULL,
	[PSS] [nvarchar](100) NULL,
	[CSA] [nvarchar](100) NULL
	)
