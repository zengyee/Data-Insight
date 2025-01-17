﻿CREATE TABLE [dbo].[Users_temp]
(
	[Id] [int] NOT NULL,
	[EDWSourceSystemID] [int] NULL,
	[EDWLastUpdated] [datetime] NOT NULL,
	[Version] [int] NOT NULL,
	[Domain] [nvarchar](250) NULL,
	[ModifiedBy] [int] NULL,
	[CreatedOn] [datetime2](7) NULL,
	[EDWIsDeletedFlag] [bit] NULL,
	[WindowsLiveId] [nvarchar](255) NULL,
	[EDWProcessID] [int] NULL,
	[IsOrgId] [bit] NOT NULL,
	[AdminPermission] [int] NULL,
	[PreferredCulture] [nvarchar](25) NULL,
	[CreatedBy] [int] NULL,
	[EDWFirstInserted] [datetime] NULL,
	[EDWSourceExtractID] [nvarchar](40) NULL,
	[FrequencyCode] [nvarchar](1) NULL,
	[EDWExtractGrouping] [int] NOT NULL,
	[PUID] [nvarchar](200) NULL,
	[AdminPermissionExpiryTime] [datetime2](7) NULL,
	[NotificationContact] [nvarchar](255) NULL,
	[ModifiedOn] [datetime2](7) NOT NULL, 
    CONSTRAINT [PK_Users_temp] PRIMARY KEY ([Id])
)
