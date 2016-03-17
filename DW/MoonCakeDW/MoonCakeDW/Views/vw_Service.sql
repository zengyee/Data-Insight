CREATE VIEW [dbo].[vw_Service]
	AS 
	SELECT        DimServiceKey, Service, ServiceType, ServiceRegion, ResourceName, MeteredService, MeteredServiceType, MeteredRegion, 
                         ServiceCategoryName--, AIMeta_SCDIsCurrent, AIMeta_SCDEffectiveFrom, AIMeta_SCDEffectiveTo
FROM            dbo.AI_DimService
where MeteredRegion like 'China%' and AIMeta_SCDIsCurrent =1
