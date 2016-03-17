CREATE PROCEDURE [dbo].[ETL_MergeTemp_FactMeteredUsageDaily]
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
    MERGE [dbo].[FactMeteredUsageDaily] AS target
		USING (SELECT * FROM [FactMeteredUsageDaily_Temp]) 
			AS source ([DimDateKey]
					,[DimSubscriptionKey]
					,[DimTenantKey]
					,[DimAccountKey]
					,[DimOfferKey]
					,[BillingDimGeographyKey]
					,[ServiceUseDimGeographyKey]
					,[TenantDimGeographyKey]
					,[AccountDimGeographyKey]
					,[DimInfoFieldKey]
					,[DimRatingParameterKey]
					,[DimServiceKey]
					,[DimBillingSystemKey]
					,[TotalUnits]
					,[AI_SQLStorageMB]
					,[AI_NormalizedUsage]
					,[AIMeta_CreatedAt]
					,[AIMeta_UpdatedAt]
					,[AIMeta_CreatedDimAuditKey]
					,[AIMeta_UpdatedDimAuditKey]
					,[ResourceGUID]
					,[DimImageTypeKey]
					,[DimLocationKey]
					,[DimMeteredServiceKey]
					,[DimProjectKey])
				ON (target.[DimDateKey] = source.[DimDateKey] 				
					AND target.[DimSubscriptionKey] = source.[DimSubscriptionKey]
					AND target.[DimTenantKey] = source.[DimTenantKey]
					AND target.[DimAccountKey] = source.[DimAccountKey]
					AND target.[DimOfferKey] = source.[DimOfferKey]
					AND target.[BillingDimGeographyKey] = source.[BillingDimGeographyKey]
					AND target.[ServiceUseDimGeographyKey] = source.[ServiceUseDimGeographyKey]
					AND target.[TenantDimGeographyKey] = source.[TenantDimGeographyKey]
					AND target.[AccountDimGeographyKey] = source.[AccountDimGeographyKey]
					AND target.[DimInfoFieldKey] = source.[DimInfoFieldKey]
					AND target.[DimRatingParameterKey] = source.[DimRatingParameterKey]
					AND target.[DimServiceKey] = source.[DimServiceKey]
					AND target.[DimBillingSystemKey] = source.[DimBillingSystemKey]
					AND target.[DimImageTypeKey] = source.[DimImageTypeKey]
					AND target.[DimLocationKey] = source.[DimLocationKey]
					AND target.[DimMeteredServiceKey] = source.[DimMeteredServiceKey]
					AND target.[DimProjectKey] = source.[DimProjectKey])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[TotalUnits] = source.[TotalUnits]
					,[AI_SQLStorageMB] = source.[AI_SQLStorageMB]
					,[AI_NormalizedUsage] = source.[AI_NormalizedUsage]
					,[AIMeta_CreatedAt] = source.[AIMeta_CreatedAt]
					,[AIMeta_UpdatedAt] = source.[AIMeta_UpdatedAt]
					,[AIMeta_CreatedDimAuditKey] = source.[AIMeta_CreatedDimAuditKey]
					,[AIMeta_UpdatedDimAuditKey] = source.[AIMeta_UpdatedDimAuditKey]
					,[ResourceGUID] = source.[ResourceGUID]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([DimDateKey]
			,[DimSubscriptionKey]
			,[DimTenantKey]
			,[DimAccountKey]
			,[DimOfferKey]
			,[BillingDimGeographyKey]
			,[ServiceUseDimGeographyKey]
			,[TenantDimGeographyKey]
			,[AccountDimGeographyKey]
			,[DimInfoFieldKey]
			,[DimRatingParameterKey]
			,[DimServiceKey]
			,[DimBillingSystemKey]
			,[TotalUnits]
			,[AI_SQLStorageMB]
			,[AI_NormalizedUsage]
			,[AIMeta_CreatedAt]
			,[AIMeta_UpdatedAt]
			,[AIMeta_CreatedDimAuditKey]
			,[AIMeta_UpdatedDimAuditKey]
			,[ResourceGUID]
			,[DimImageTypeKey]
			,[DimLocationKey]
			,[DimMeteredServiceKey]
			,[DimProjectKey])
    VALUES (source.[DimDateKey]
			  ,source.[DimSubscriptionKey]
			  ,source.[DimTenantKey]
			  ,source.[DimAccountKey]
			  ,source.[DimOfferKey]
			  ,source.[BillingDimGeographyKey]
			  ,source.[ServiceUseDimGeographyKey]
			  ,source.[TenantDimGeographyKey]
			  ,source.[AccountDimGeographyKey]
			  ,source.[DimInfoFieldKey]
			  ,source.[DimRatingParameterKey]
			  ,source.[DimServiceKey]
			  ,source.[DimBillingSystemKey]
			  ,source.[TotalUnits]
			  ,source.[AI_SQLStorageMB]
			  ,source.[AI_NormalizedUsage]
			  ,source.[AIMeta_CreatedAt]
			  ,source.[AIMeta_UpdatedAt]
			  ,source.[AIMeta_CreatedDimAuditKey]
			  ,source.[AIMeta_UpdatedDimAuditKey]
			  ,source.[ResourceGUID]
			  ,source.[DimImageTypeKey]
			  ,source.[DimLocationKey]
			  ,source.[DimMeteredServiceKey]
			  ,source.[DimProjectKey])

	--OUTPUT Parameters
    OUTPUT $action, inserted.[DimAccountKey] INTO #MyTempTable;

	DECLARE	@InsertedRows INT
	DECLARE @UpdatedRows INT
	SELECT @InsertedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'INSERT'
	SELECT @UpdatedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'UPDATE'
	
	-- Update Log
	UPDATE ETL_Log
		SET [FactMeteredUsageDaily_InsertedRows] = @InsertedRows,
			[FactMeteredUsageDaily_UpdatedRows] = @UpdatedRows
		WHERE [id] = @ETLId

 	DROP TABLE #MyTempTable

RETURN 0
