CREATE TABLE [dbo].[DimService]
(
	[DimServiceKey] INT NOT NULL PRIMARY KEY, 
    [Service] nvarchar(255),
    [ServiceType] nvarchar(255),
    [ServiceRegion] nvarchar(255),
    [ResourceName] nvarchar(255),
    [MeteredService] nvarchar(255),
    [MeteredServiceType] nvarchar(255),
    [MeteredRegion] nvarchar(255),
    [AIMeta_SCDIsCurrent] bit,
    [AIMeta_SCDEffectiveFrom] datetime2(7),
    [AIMeta_SCDEffectiveTo] datetime2(7),
    [ResourceDescription] nvarchar(max),
    [ServiceInfo1] nvarchar(255),
    [ServiceInfo2] nvarchar(255),
    [AIMeta_CreatedAt] datetime2(7),
    [AIMeta_UpdatedAt] datetime2(7),
    [AIMeta_CreatedDimAuditKey] bigint,
    [AIMeta_UpdatedDimAuditKey] bigint,
    [ServiceCategoryName] nvarchar(256)
)
