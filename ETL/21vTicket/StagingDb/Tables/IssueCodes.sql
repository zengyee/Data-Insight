CREATE TABLE [dbo].[IssueCodes]
(
	[IssueCodeFullPath] [nvarchar](1024) NULL,
	[IssueCode] [nvarchar](255) NOT NULL,
	[ParentIssueCode] [nvarchar](255) NULL 
	)

GO
