CREATE TABLE [dbo].[ETL_Log]
(
    [id]            INT             IDENTITY (1, 1) NOT NULL,
    [StartTime]     DATETIME        CONSTRAINT [DF_ETL_Log_StartTime] DEFAULT (getdate()) NOT NULL,
    [EndTime]       DATETIME        NULL,
    [Status]        NVARCHAR (50)   NULL,
    [Error Message] NVARCHAR (1024) NULL,
	[DimAccount_InsertedRows] INT NULL,
	[DimSubscription_InsertedRows] INT NULL,
    [FactMeteredUsageDaily_InsertedRows] INT NULL, 
	[FactServiceBilling_InsertedRows] INT NULL,
	[DimAccount_UpdatedRows] INT NULL,
	[DimSubscription_UpdatedRows] INT NULL,
    [FactMeteredUsageDaily_UpdatedRows] INT NULL, 
	[FactServiceBilling_UpdatedRows] INT NULL,
	CONSTRAINT [PK_ETL_Log] PRIMARY KEY CLUSTERED ([id] ASC)
);
