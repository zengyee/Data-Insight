﻿CREATE TABLE [dbo].[IS_WorkItems_Detail] (
    [id]                  BIGINT         NOT NULL,
    [TicketID]            BIGINT         NULL,
    [CreateDate]          DATETIME       NULL,
    [AlarmTriggerDate]    DATETIME       NULL,
    [Subject]             NVARCHAR (256) NULL,
    [Status]              NVARCHAR (50)  NULL,
    [StatusCode]          INT            NULL,
    [Version]             INT            NULL,
    [RelatedLinkCount]    INT            NULL,
    [Owner]               NVARCHAR (50)  NULL,
    [OwnerGroup]          NVARCHAR (50)  NULL,
    [Source]              NVARCHAR (50)  NULL,
    [Classification]      NVARCHAR (50)  NULL,
    [Severity]            NVARCHAR (50)  NULL,
    [Priority]            NVARCHAR (50)  NULL,
    [Property]            NVARCHAR (50)  NULL,
    [CreatedBy]           NVARCHAR (50)  NULL,
    [ChangedBy]           NVARCHAR (50)  NULL,
    [AssignedTo]          NVARCHAR (50)  NULL,
    [AssignedGroup]       NVARCHAR (50)  NULL,
    [AssignedDate]        DATETIME       NULL,
    [ChangedDate]         DATETIME       NULL,
    [StateChangedDate]    DATETIME       NULL,
    [T1ProcessDate]       DATETIME       NULL,
    [T2ProcessDate]       DATETIME       NULL,
    [EscalationByTeam]    NVARCHAR (50)  NULL,
    [EscalationDate]      DATETIME       NULL,
    [Append]              NVARCHAR (50)  NULL,
    [PendingStatus]       NVARCHAR (50)  NULL,
    [PendingReason]       NVARCHAR (50)  NULL,
    [T1FirstResponseTime] DATETIME       NULL,
    [T2FirstResponseTime] DATETIME       NULL,
    [PendingTime]         DATETIME       NULL,
    [PendLength]          INT            NULL,
    [FirstAssignedDate]   DATETIME       NULL,
    [ResolvedDate]        DATETIME       NULL,
    [ResolvedBy]          NVARCHAR (50)  NULL,
    [ResolvedByTeam]      NVARCHAR (50)  NULL,
    [ClosedDate]          DATETIME       NULL,
    [ClosedBy]            NVARCHAR (50)  NULL,
    [InTSG]               NVARCHAR (256) NULL, 
    CONSTRAINT [PK_IS_WorkItems_Detail] PRIMARY KEY ([id])
);

