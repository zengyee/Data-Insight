CREATE VIEW [dbo].[vw_FactUsageDaily]
	AS 

	SELECT        DimDateKey, DimSubscriptionKey, DimTenantKey, DimAccountKey, DimOfferKey, BillingDimGeographyKey, ServiceUseDimGeographyKey, TenantDimGeographyKey, AccountDimGeographyKey, 
                         DimInfoFieldKey, DimRatingParameterKey, DimServiceKey, DimBillingSystemKey, TotalUnits, AI_SQLStorageMB, AI_NormalizedUsage, AIMeta_CreatedAt, AIMeta_UpdatedAt, AIMeta_CreatedDimAuditKey, 
                         AIMeta_UpdatedDimAuditKey, ResourceGUID, DimImageTypeKey, DimLocationKey, DimMeteredServiceKey, DimProjectKey
FROM            dbo.FactMeteredUsageDaily
WHERE        (DimBillingSystemKey = 2) AND (DimLocationKey <= 2) AND (AI_NormalizedUsage > 0)
