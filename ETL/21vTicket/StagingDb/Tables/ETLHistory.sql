CREATE TABLE [dbo].[ETLHistory] (
    [id]            INT             IDENTITY (1, 1) NOT NULL,
    [StartTime]     DATETIME        CONSTRAINT [DF_ETLHistory_StartTime] DEFAULT (getdate()) NOT NULL,
    [EndTime]       DATETIME        NULL,
    [Status]        NVARCHAR (50)   NULL,
    [Error Message] NVARCHAR (1024) NULL,
    [LastCSSId]     BIGINT             NULL,
    [LastISId]      BIGINT             NULL,
    CONSTRAINT [PK_ETLHistory] PRIMARY KEY CLUSTERED ([id] ASC)
);

