﻿CREATE VIEW [dbo].[v_SupportTicketRelated]
	AS 
	SELECT icm.[IncidentId]	AS	[icm_IncidentId]
		,icm.[SourceName]	AS	[icm_SourceName]
		,icm.[SourceType]	AS	[icm_SourceType]
		,icm.[SourceIncidentId]	AS	[icm_SourceIncidentId]
		,icm.[SourceCreateDate]	AS	[icm_SourceCreateDate]
		,icm.[SourceOrigin]	AS	[icm_SourceOrigin]
		,icm.[SourceCreatedBy]	AS	[icm_SourceCreatedBy]
		,icm.[SourceModifiedDate]	AS	[icm_SourceModifiedDate]
		,icm.[CreateDate]	AS	[icm_CreateDate]
		,icm.[ModifiedDate]	AS	[icm_ModifiedDate]
		,icm.[RoutingId]	AS	[icm_RoutingId]
		,icm.[CorrelationId]	AS	[icm_CorrelationId]
		,icm.[OccurringEnvironment]	AS	[icm_OccurringEnvironment]
		,icm.[OccurringDatacenter]	AS	[icm_OccurringDatacenter]
		,icm.[OccurringDeviceGroup]	AS	[icm_OccurringDeviceGroup]
		,icm.[OccurringDeviceName]	AS	[icm_OccurringDeviceName]
		,icm.[OccurringServiceInstanceId]	AS	[icm_OccurringServiceInstanceId]
		,icm.[RaisingEnvironment]	AS	[icm_RaisingEnvironment]
		,icm.[RaisingDatacenter]	AS	[icm_RaisingDatacenter]
		,icm.[RaisingDeviceGroup]	AS	[icm_RaisingDeviceGroup]
		,icm.[RaisingDeviceName]	AS	[icm_RaisingDeviceName]
		,icm.[RaisingServiceInstanceId]	AS	[icm_RaisingServiceInstanceId]
		,icm.[OwningTenantName]	AS	[icm_OwningTenantName]
		,icm.[OwningTeamName]	AS	[icm_OwningTeamName]
		,icm.[OwningContactAlias]	AS	[icm_OwningContactAlias]
		,icm.[ParentIncidentId]	AS	[icm_ParentIncidentId]
		,icm.[Severity]	AS	[icm_Severity]
		,icm.[Status]	AS	[icm_Status]
		,icm.[IsNoise]	AS	[icm_IsNoise]
		,icm.[IsSecurityRisk]	AS	[icm_IsSecurityRisk]
		,icm.[IsCustomerImpacting]	AS	[icm_IsCustomerImpacting]
		,icm.[Component]	AS	[icm_Component]
		,icm.[Revision]	AS	[icm_Revision]
		,icm.[TsgId]	AS	[icm_TsgId]
		,icm.[Title]	AS	[icm_Title]
		,icm.[ReproSteps]	AS	[icm_ReproSteps]
		,icm.[CustomerName]	AS	[icm_CustomerName]
		,icm.[CommitDate]	AS	[icm_CommitDate]
		,icm.[ResolveDate]	AS	[icm_ResolveDate]
		,icm.[ResolvedBy]	AS	[icm_ResolvedBy]
		,icm.[RootCauseId]	AS	[icm_RootCauseId]
		,icm.[RootCauseLinkDate]	AS	[icm_RootCauseLinkDate]
		,icm.[Mitigation]	AS	[icm_Mitigation]
		,icm.[KBArticleId]	AS	[icm_KBArticleId]
		,icm.[PIRReportId]	AS	[icm_PIRReportId]
		,icm.[PIRLinkDate]	AS	[icm_PIRLinkDate]
		,icm.[ImpactedScenarios]	AS	[icm_ImpactedScenarios]
		,icm.[HitCount]	AS	[icm_HitCount]
		,icm.[LastCorrelationDate]	AS	[icm_LastCorrelationDate]
		,icm.[Keywords]	AS	[icm_Keywords]
		,icm.[MitigateDate]	AS	[icm_MitigateDate]
		,icm.[ImpactStartDate]	AS	[icm_ImpactStartDate]
		,icm.[MitigatedBy]	AS	[icm_MitigatedBy]
		,icm.[CommsMgrEngagementMode]	AS	[icm_CommsMgrEngagementMode]
		,icm.[CommsMgrEngagementAdditionalDetails]	AS	[icm_CommsMgrEngagementAdditionalDetails]
		,icm.[IncidentType]	AS	[icm_IncidentType]
		,icm.[ChildCount]	AS	[icm_ChildCount]
		,icm.[RelatedLinksCount]	AS	[icm_RelatedLinksCount]
		,icm.[ExternalLinksCount]	AS	[icm_ExternalLinksCount]
		,icm.[HowFixed]	AS	[icm_HowFixed]
		,icm.[IncidentSubType]	AS	[icm_IncidentSubType]
		,icm.[TsgOutput]	AS	[icm_TsgOutput]
		,icm.[MonitorId]	AS	[icm_MonitorId]
		,icm.[ResponsibleTenantName]	AS	[icm_ResponsibleTenantName]
		,icm.[SupportTicketId]	AS	[icm_SupportTicketId]
		,icm.[SubscriptionId]	AS	[icm_SubscriptionId]
		,icm.[WarehouseModifiedDate]	AS	[icm_WarehouseModifiedDate]
		,icm.[PublicPirId]	AS	[icm_PublicPirId]
		,icm.[OriginatingTenantName]	AS	[icm_OriginatingTenantName]
  FROM [dbo].[WarehouseIncidents] icm
  WHERE icm.[SupportTicketId] IS NOT NULL OR icm.[SubscriptionId] IS NOT NULL OR icm.IsCustomerImpacting = 1
