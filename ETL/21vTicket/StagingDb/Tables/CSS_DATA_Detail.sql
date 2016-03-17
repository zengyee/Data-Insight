CREATE TABLE [dbo].[CSS_DATA_Detail] (
    [id]               BIGINT            IDENTITY (1, 1) NOT NULL,
    [InsertDate]       DATETIME       CONSTRAINT [DF_CSS_DATA_Detail_InsertDate] DEFAULT (getdate()) NOT NULL,
	[Case_ID] [nvarchar](100) NULL,
	[CurrentOwner_ID] [nvarchar](50) NULL,
	[FromQueue] [nvarchar](50) NULL,
	[ToQueue] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[InitialResponseDate] [datetime] NULL,
	[ClosedDate] [datetime] NULL,
	[SolutionDeliveredDate] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[IssueCode] [nvarchar](max) NULL,
	[ParentIssueCode] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[IssueDescription] [nvarchar](max) NULL,
	[InquiryType] [nvarchar](50) NULL,
	[CaseStatus] [nvarchar](50) NULL,
	[Open/Close] [nvarchar](10) NULL,
	[ProductType] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[OrgID] [nvarchar](256) NULL,
	[SubscriptionID] [nvarchar](100) NULL,
	[Severity] [nvarchar](50) NULL,
	[CustomerType] [nvarchar](50) NULL,
	[FeedBack] [nvarchar](50) NULL,
	[LaborTime] [int] NULL,
	[ReactiveCount] [int] NULL,
	[EscalatetoMS] [bit] NULL,
	[MSLed] [bit] NULL,
	[CaseSource] [nvarchar](50) NULL,
	[ReferenceID] [nvarchar](2048) NULL,
	[MssolveID] [nvarchar](100) NULL,
	[TfsID] [nvarchar](100) NULL,
	[CorreCaseID] [nvarchar](100) NULL, 
    [SupportType] [nvarchar](100) NULL, 
    [SolutionOfferedTime] DATETIME NULL, 
    [SolutionConfirmedTime] DATETIME NULL
    CONSTRAINT [PK_CSS_DATA_Detail] PRIMARY KEY ([id])
);


GO

CREATE INDEX [IX_CSS_DATA_Detail_Case_ID] ON [dbo].[CSS_DATA_Detail] ([Case_ID])
