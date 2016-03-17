CREATE TABLE [dbo].[EnrollmentsAccounts_temp]
(
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[EnrollmentId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[StartsOn] [datetime2](7) NULL,
	[EndsOn] [datetime2](7) NULL, 
    CONSTRAINT [PK_EnrollmentsAccounts_temp] PRIMARY KEY ([Id])
)
