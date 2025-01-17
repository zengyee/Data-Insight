﻿CREATE TABLE [dbo].[Velocity_ContactInformation_temp]
(
	CountryId		int,
	Id		int,
	CreatedBy		int	,
	EDWSourceSystemID		int	,
	EDWLastUpdated		datetime,
	Phone		nvarchar(16	),
	FirstName		nvarchar(100),
	ModifiedOn		datetime2	,
	PostalCode		nvarchar(15	),
	Street		nvarchar(200	),
	EDWProcessID		int,
	AddressId		int	,
	Name		nvarchar(100),
	LastName		nvarchar(100),
	City		nvarchar(35),
	EDWIsDeletedFlag		bit	,
	EmergencyNumber		nvarchar(16),
	ModifiedBy		int	,
	CreatedOn		datetime2,
	EDWSourceExtractID		varchar(40),
	EDWExtractGrouping		int,
	Department		nvarchar(200),
	EDWFirstInserted		datetime,
	Email		nvarchar(100),
	Fax		nvarchar(16	),
	State		nvarchar(35	)

)
