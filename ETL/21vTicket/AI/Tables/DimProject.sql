CREATE TABLE [dbo].[DimProject]
(
	[DimProjectKey] [bigint] NOT NULL,
	[Project] [nvarchar](255) NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL, 
    CONSTRAINT [PK_Dim_Project] PRIMARY KEY ([DimProjectKey])
)
