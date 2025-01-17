﻿CREATE TABLE [dbo].[WarehouseIncidents_Temp](
	[IncidentId] [bigint] NOT NULL,
	[SourceName] [varchar](128) NULL,
	[SourceType] [varchar](128) NULL,
	[SourceIncidentId] [varchar](128) NULL,
	[SourceCreateDate] [datetime] NULL,
	[SourceOrigin] [varchar](128) NULL,
	[SourceCreatedBy] [varchar](128) NULL,
	[SourceModifiedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[RoutingId] [varchar](200) NULL,
	[CorrelationId] [varchar](200) NULL,
	[OccurringEnvironment] [varchar](32) NULL,
	[OccurringDatacenter] [varchar](32) NULL,
	[OccurringDeviceGroup] [varchar](64) NULL,
	[OccurringDeviceName] [varchar](128) NULL,
	[OccurringServiceInstanceId] [varchar](64) NULL,
	[RaisingEnvironment] [varchar](32) NULL,
	[RaisingDatacenter] [varchar](32) NULL,
	[RaisingDeviceGroup] [varchar](64) NULL,
	[RaisingDeviceName] [varchar](128) NULL,
	[RaisingServiceInstanceId] [varchar](64) NULL,
	[OwningTenantName] [varchar](64) NULL,
	[OwningTeamName] [varchar](128) NULL,
	[OwningContactAlias] [varchar](32) NULL,
	[ParentIncidentId] [bigint] NULL,
	[Severity] [int] NULL,
	[Status] [varchar](16) NULL,
	[IsNoise] [bit] NULL,
	[IsSecurityRisk] [bit] NULL,
	[IsCustomerImpacting] [bit] NULL,
	[Component] [nvarchar](512) NULL,
	[Revision] [int] NULL,
	[TsgId] [nvarchar](64) NULL,
	[Title] [nvarchar](max) NULL,
	[ReproSteps] [nvarchar](max) NULL,
	[CustomerName] [nvarchar](max) NULL,
	[CommitDate] [datetime] NULL,
	[ResolveDate] [datetime] NULL,
	[ResolvedBy] [varchar](128) NULL,
	[RootCauseId] [bigint] NULL,
	[RootCauseLinkDate] [datetime] NULL,
	[Mitigation] [nvarchar](max) NULL,
	[KBArticleId] [bigint] NULL,
	[PIRReportId] [bigint] NULL,
	[PIRLinkDate] [datetime] NULL,
	[ImpactedScenarios] [nvarchar](max) NULL,
	[HitCount] [bigint] NULL,
	[LastCorrelationDate] [datetime] NULL,
	[Keywords] [nvarchar](64) NULL,
	[MitigateDate] [datetime] NULL,
	[ImpactStartDate] [datetime] NULL,
	[MitigatedBy] [varchar](128) NULL,
	[CommsMgrEngagementMode] [varchar](64) NULL,
	[CommsMgrEngagementAdditionalDetails] [nvarchar](max) NULL,
	[IncidentType] [varchar](256) NULL,
	[ChildCount] [bigint] NULL,
	[RelatedLinksCount] [bigint] NULL,
	[ExternalLinksCount] [bigint] NULL,
	[HowFixed] [varchar](32) NULL,
	[IncidentSubType] [varchar](32) NULL,
	[TsgOutput] [nvarchar](max) NULL,
	[MonitorId] [varchar](64) NULL,
	[ResponsibleTenantName] [varchar](64) NULL,
	[SupportTicketId] [varchar](64) NULL,
	[SubscriptionId] [nvarchar](128) NULL,
	[WarehouseModifiedDate] [datetime] NULL,
	[PublicPirId] [bigint] NULL,
	[OriginatingTenantName] [varchar](64) NULL, 
    CONSTRAINT [PK_WarehouseIncidents_Temp] PRIMARY KEY ([IncidentId])
) 