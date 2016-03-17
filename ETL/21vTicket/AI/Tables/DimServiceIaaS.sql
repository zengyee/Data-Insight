CREATE TABLE [dbo].[DimServiceIaaS]
(
	[DimServiceKey] [bigint] NOT NULL,
	[IaaSName] [nvarchar](256) NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[AIMeta_CreatedAt] [datetime2](7) NULL,
	[AIMeta_UpdatedAt] [datetime2](7) NULL,
	[AIMeta_CreatedPackageExecutionLogKey] [bigint] NULL,
	[AIMeta_UpdatedPackageExecutionLogKey] [bigint] NULL, 
    CONSTRAINT [PK_DimServiceIaaS] PRIMARY KEY ([DimServiceKey])
	)
