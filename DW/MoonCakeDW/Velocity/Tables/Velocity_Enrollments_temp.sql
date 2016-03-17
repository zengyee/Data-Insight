﻿CREATE TABLE [dbo].[Velocity_Enrollments_temp]
(
	[Id] [int] NOT NULL,
	[AmendmentType] [nvarchar](25) NOT NULL,
	[StatusId] [int] NOT NULL,
	[StartEffectiveDate] [datetime2](7) NOT NULL,
	[EndEffectiveDate] [datetime2](7) NOT NULL,
	[AmendmentStartDate] [datetime2](7) NOT NULL,
	[AmendmentEndDate] [datetime2](7) NOT NULL,
	[OperationsCenterId] [int] NOT NULL,
	[PriceListCurrencyId] [int] NOT NULL,
	[BillingCycle] [nvarchar](25) NOT NULL,
	[GuaranteedServicePercentage] [numeric](5, 3) NOT NULL,
	[CountryId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[EndCustomerName] [nvarchar](150) NOT NULL,
	[AuthLevelStatusId] [int] NOT NULL,
	[InvoiceNotificationCycle] [nchar](25) NOT NULL,
	[HermesStartDate] [date] NOT NULL,
	[Attributes] [int] NOT NULL,
	[CanExtendTerm] [bit] NOT NULL,
	[Channel] [nvarchar](50) NOT NULL,
	[Version] [int] NOT NULL,
	[SourceModifiedDate] [datetime2](7) NOT NULL,
	[ExternalStatusId] [int] NOT NULL,
	[CreatedOn] [datetime2](7) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedOn] [datetime2](7) NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[EnrollmentKey] [nvarchar](36) NOT NULL,
	[AgreementTypeId] [int] NULL,
	[PriceListCountryCode] [nvarchar](15) NULL,
	[MPNId] [nvarchar](255) NULL,
	[TerminateSuccessful] [bit] NULL,
	[TransferDepartments] [bit] NULL,
	[PublicCustomerNumber] [nvarchar](12) NULL,
	[PriorEnrollmentKey] [nvarchar](36) NULL,
	[TransferTo] [int] NULL,
	[TransferDate] [datetime2](7) NULL,
	[LicenseAgreementTypeId] [int] NULL,
	[ContractTypeId] [int] NULL,
	[EnrollmentNumber] [nvarchar](36) NULL,
	[ProgramId] [int] NULL,
	[ProgramOfferingCode] [char](3) NULL,
	[OfferingLevelCode] [char](3) NULL
)
