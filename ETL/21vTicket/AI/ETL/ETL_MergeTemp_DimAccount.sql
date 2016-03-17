CREATE PROCEDURE [dbo].[ETL_MergeTemp_DimAccount]
	@ETLId INT
AS

	SET NOCOUNT ON;
	-- Temp table to record changes
	CREATE TABLE #MyTempTable
	(  
		[ActionTaken] nvarchar(10),
		[IncidentId] bigint
	)

	-- Merge by Insert and Update
    MERGE [dbo].[DimAccount] AS target
		USING (SELECT * FROM [DimAccount_temp]) 
			AS source ([DimAccountKey]
					  ,[DimBillingSystemKey]
					  ,[BillingSystemAccountType]
					  ,[CurrentBillingSystemName]
					  ,[OrganizationName]
					  ,[CommunicationCulture]
					  ,[CommunicationLanguage]
					  ,[IsTaxExempt]
					  ,[OptOutUseOfEmail]
					  ,[OptOutUseOfPhone]
					  ,[TPID]
					  ,[CustomerId]
					  ,[AIMeta_SCDIsCurrent]
					  ,[AIMeta_SCDEffectiveFrom]
					  ,[AIMeta_SCDEffectiveTo]
					  ,[OMSTenantIdentifier]
					  ,[V1TenantIdentifier]
					  ,[MINTAccountIdentifier]
					  ,[OMSMINTAccountID]
					  ,[MTAccountIdentifier]
					  ,[IsMigratedToMINT]
					  ,[BusinessAddressID]
					  ,[AccountPUID]
					  ,[DepthBreadthIndicator]
					  ,[TenantTypeName]
					  ,[DefaultDomain]
					  ,[CurrentDefaultDomain]
					  ,[CurrentDomainLiveNamespaceType]
					  ,[CurrentDefaultDomainCapability]
					  ,[InitialDomain]
					  ,[DirSyncEnabled]
					  ,[TenantCreatedDate]
					  ,[MINTAccountCreatedDate]
					  ,[TenantStateIdentifier]
					  ,[TenantStateName]
					  ,[TenantStateChangeReasonIdentifier]
					  ,[TenantStateChangeReasonName]
					  ,[TPName]
					  ,[AI_PassStatus]
					  ,[AI_PassToPaidConversion]
					  ,[AI_PassToPaidConversionDateKey]
					  ,[AI_PassConvertedTo]
					  ,[AIMeta_CreatedAt]
					  ,[AIMeta_UpdatedAt]
					  ,[AIMeta_CreatedDimAuditKey]
					  ,[AIMeta_UpdatedDimAuditKey])
				ON (target.[DimAccountKey] = source.[DimAccountKey])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[DimAccountKey]=	source.[DimAccountKey]
					,[DimBillingSystemKey]=	source.[DimBillingSystemKey]
					,[BillingSystemAccountType]=	source.[BillingSystemAccountType]
					,[CurrentBillingSystemName]=	source.[CurrentBillingSystemName]
					,[OrganizationName]=	source.[OrganizationName]
					,[CommunicationCulture]=	source.[CommunicationCulture]
					,[CommunicationLanguage]=	source.[CommunicationLanguage]
					,[IsTaxExempt]=	source.[IsTaxExempt]
					,[OptOutUseOfEmail]=	source.[OptOutUseOfEmail]
					,[OptOutUseOfPhone]=	source.[OptOutUseOfPhone]
					,[TPID]=	source.[TPID]
					,[CustomerId]=	source.[CustomerId]
					,[AIMeta_SCDIsCurrent]=	source.[AIMeta_SCDIsCurrent]
					,[AIMeta_SCDEffectiveFrom]=	source.[AIMeta_SCDEffectiveFrom]
					,[AIMeta_SCDEffectiveTo]=	source.[AIMeta_SCDEffectiveTo]
					,[OMSTenantIdentifier]=	source.[OMSTenantIdentifier]
					,[V1TenantIdentifier]=	source.[V1TenantIdentifier]
					,[MINTAccountIdentifier]=	source.[MINTAccountIdentifier]
					,[OMSMINTAccountID]=	source.[OMSMINTAccountID]
					,[MTAccountIdentifier]=	source.[MTAccountIdentifier]
					,[IsMigratedToMINT]=	source.[IsMigratedToMINT]
					,[BusinessAddressID]=	source.[BusinessAddressID]
					,[AccountPUID]=	source.[AccountPUID]
					,[DepthBreadthIndicator]=	source.[DepthBreadthIndicator]
					,[TenantTypeName]=	source.[TenantTypeName]
					,[DefaultDomain]=	source.[DefaultDomain]
					,[CurrentDefaultDomain]=	source.[CurrentDefaultDomain]
					,[CurrentDomainLiveNamespaceType]=	source.[CurrentDomainLiveNamespaceType]
					,[CurrentDefaultDomainCapability]=	source.[CurrentDefaultDomainCapability]
					,[InitialDomain]=	source.[InitialDomain]
					,[DirSyncEnabled]=	source.[DirSyncEnabled]
					,[TenantCreatedDate]=	source.[TenantCreatedDate]
					,[MINTAccountCreatedDate]=	source.[MINTAccountCreatedDate]
					,[TenantStateIdentifier]=	source.[TenantStateIdentifier]
					,[TenantStateName]=	source.[TenantStateName]
					,[TenantStateChangeReasonIdentifier]=	source.[TenantStateChangeReasonIdentifier]
					,[TenantStateChangeReasonName]=	source.[TenantStateChangeReasonName]
					,[TPName]=	source.[TPName]
					,[AI_PassStatus]=	source.[AI_PassStatus]
					,[AI_PassToPaidConversion]=	source.[AI_PassToPaidConversion]
					,[AI_PassToPaidConversionDateKey]=	source.[AI_PassToPaidConversionDateKey]
					,[AI_PassConvertedTo]=	source.[AI_PassConvertedTo]
					,[AIMeta_CreatedAt]=	source.[AIMeta_CreatedAt]
					,[AIMeta_UpdatedAt]=	source.[AIMeta_UpdatedAt]
					,[AIMeta_CreatedDimAuditKey]=	source.[AIMeta_CreatedDimAuditKey]
					,[AIMeta_UpdatedDimAuditKey]=	source.[AIMeta_UpdatedDimAuditKey]



	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([DimAccountKey]
			,[DimBillingSystemKey]
			,[BillingSystemAccountType]
			,[CurrentBillingSystemName]
			,[OrganizationName]
			,[CommunicationCulture]
			,[CommunicationLanguage]
			,[IsTaxExempt]
			,[OptOutUseOfEmail]
			,[OptOutUseOfPhone]
			,[TPID]
			,[CustomerId]
			,[AIMeta_SCDIsCurrent]
			,[AIMeta_SCDEffectiveFrom]
			,[AIMeta_SCDEffectiveTo]
			,[OMSTenantIdentifier]
			,[V1TenantIdentifier]
			,[MINTAccountIdentifier]
			,[OMSMINTAccountID]
			,[MTAccountIdentifier]
			,[IsMigratedToMINT]
			,[BusinessAddressID]
			,[AccountPUID]
			,[DepthBreadthIndicator]
			,[TenantTypeName]
			,[DefaultDomain]
			,[CurrentDefaultDomain]
			,[CurrentDomainLiveNamespaceType]
			,[CurrentDefaultDomainCapability]
			,[InitialDomain]
			,[DirSyncEnabled]
			,[TenantCreatedDate]
			,[MINTAccountCreatedDate]
			,[TenantStateIdentifier]
			,[TenantStateName]
			,[TenantStateChangeReasonIdentifier]
			,[TenantStateChangeReasonName]
			,[TPName]
			,[AI_PassStatus]
			,[AI_PassToPaidConversion]
			,[AI_PassToPaidConversionDateKey]
			,[AI_PassConvertedTo]
			,[AIMeta_CreatedAt]
			,[AIMeta_UpdatedAt]
			,[AIMeta_CreatedDimAuditKey]
			,[AIMeta_UpdatedDimAuditKey])
    VALUES (source.[DimAccountKey]
			,source.[DimBillingSystemKey]
			,source.[BillingSystemAccountType]
			,source.[CurrentBillingSystemName]
			,source.[OrganizationName]
			,source.[CommunicationCulture]
			,source.[CommunicationLanguage]
			,source.[IsTaxExempt]
			,source.[OptOutUseOfEmail]
			,source.[OptOutUseOfPhone]
			,source.[TPID]
			,source.[CustomerId]
			,source.[AIMeta_SCDIsCurrent]
			,source.[AIMeta_SCDEffectiveFrom]
			,source.[AIMeta_SCDEffectiveTo]
			,source.[OMSTenantIdentifier]
			,source.[V1TenantIdentifier]
			,source.[MINTAccountIdentifier]
			,source.[OMSMINTAccountID]
			,source.[MTAccountIdentifier]
			,source.[IsMigratedToMINT]
			,source.[BusinessAddressID]
			,source.[AccountPUID]
			,source.[DepthBreadthIndicator]
			,source.[TenantTypeName]
			,source.[DefaultDomain]
			,source.[CurrentDefaultDomain]
			,source.[CurrentDomainLiveNamespaceType]
			,source.[CurrentDefaultDomainCapability]
			,source.[InitialDomain]
			,source.[DirSyncEnabled]
			,source.[TenantCreatedDate]
			,source.[MINTAccountCreatedDate]
			,source.[TenantStateIdentifier]
			,source.[TenantStateName]
			,source.[TenantStateChangeReasonIdentifier]
			,source.[TenantStateChangeReasonName]
			,source.[TPName]
			,source.[AI_PassStatus]
			,source.[AI_PassToPaidConversion]
			,source.[AI_PassToPaidConversionDateKey]
			,source.[AI_PassConvertedTo]
			,source.[AIMeta_CreatedAt]
			,source.[AIMeta_UpdatedAt]
			,source.[AIMeta_CreatedDimAuditKey]
			,source.[AIMeta_UpdatedDimAuditKey])

	--OUTPUT Parameters
    OUTPUT $action, inserted.[DimAccountKey] INTO #MyTempTable;

	DECLARE	@InsertedRows INT
	DECLARE @UpdatedRows INT
	SELECT @InsertedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'INSERT'
	SELECT @UpdatedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'UPDATE'
	
	-- Update Log
	UPDATE ETL_Log
		SET [DimAccount_InsertedRows] = @InsertedRows,
			[DimAccount_UpdatedRows] = @UpdatedRows
		WHERE [id] = @ETLId

 	DROP TABLE #MyTempTable


	
RETURN 0
