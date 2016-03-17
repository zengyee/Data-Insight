CREATE TABLE [dbo].[v_Service]
(
	[DimServiceKey] [int] NULL,
	[Service] [nvarchar](255) NULL,
	[ServiceType] [nvarchar](255) NULL,
	[ServiceRegion] [nvarchar](255) NULL,
	[ResourceName] [nvarchar](255) NULL,
	[MeteredService] [nvarchar](255) NULL,
	[MeteredServiceType] [nvarchar](255) NULL,
	[MeteredRegion] [nvarchar](255) NULL
)
