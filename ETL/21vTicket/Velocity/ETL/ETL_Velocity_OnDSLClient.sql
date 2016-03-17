CREATE PROCEDURE [dbo].[ETL_Velocity]
AS

	TRUNCATE TABLE [Velocity].[dbo].[Accounts_temp]
	TRUNCATE TABLE [Velocity].[dbo].[AccountsSubscriptions_temp]
	TRUNCATE TABLE [Velocity].[dbo].[agreementParticipants_temp]
	TRUNCATE TABLE [Velocity].[dbo].[BillableItemPrice_temp]
	TRUNCATE TABLE [Velocity].[dbo].[BillableItems_temp]
	TRUNCATE TABLE [Velocity].[dbo].[BillableItemService_temp]
	TRUNCATE TABLE [Velocity].[dbo].[ContactInformation_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Countries_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Currencies_temp]
	TRUNCATE TABLE [Velocity].[dbo].[DepartmentAccounts_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Departments_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EaCommerceAccounts_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EnrollmentAttributes_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EnrollmentCommitmentTerms_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EnrollmentDepartments_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EnrollmentParticipants_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Enrollments_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EnrollmentsAccounts_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Entitlements_temp]
	TRUNCATE TABLE [Velocity].[dbo].[EntitlementSubscribers_temp]
	TRUNCATE TABLE [Velocity].[dbo].[ExternalAccounts_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Invoices_temp]
	TRUNCATE TABLE [Velocity].[dbo].[MonetaryAdjustmentTypes_temp]
	TRUNCATE TABLE [Velocity].[dbo].[MonthlyCommitmentPurchases_temp]
	TRUNCATE TABLE [Velocity].[dbo].[MonthlyItemCharges_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Organizations_temp]
	TRUNCATE TABLE [Velocity].[dbo].[PriceAdjustment_temp]
	TRUNCATE TABLE [Velocity].[dbo].[PurchaseOrderLineItems]
	TRUNCATE TABLE [Velocity].[dbo].[PurchaseOrders_temp]
	TRUNCATE TABLE [Velocity].[dbo].[QuarterlyUsageSummary_temp]
	TRUNCATE TABLE [Velocity].[dbo].[ServiceRegions_temp]
	TRUNCATE TABLE [Velocity].[dbo].[ServiceResources_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Services_temp]
	TRUNCATE TABLE [Velocity].[dbo].[ServiceTypes_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Status_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Subscription_temp]
	TRUNCATE TABLE [Velocity].[dbo].[UserRoles_temp]
	TRUNCATE TABLE [Velocity].[dbo].[Users_temp]




	INSERT INTO [Velocity].[dbo].[Accounts_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
	@Select=N'StatusId,IsOrgIdPUID,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,Id,Name,WindowsLiveId,Version,UserId,BisLastUpdated,
	FirstName,LastName', @From=N'WAEPPROD_Accounts',@Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[AccountsSubscriptions_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
	@Select=N'Id,AccountId,SubscriptionId,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,StartsOn,EndsOn', @From=N'WAEPPROD_AccountsSubscriptions',@Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[agreementParticipants_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,EDWExtractGrouping,AgreementParticipantKey,EDWFirstInserted,EmailContact,Version,StartsOn,ModifiedOn,EDWSourceSystemID,ParticipantType,EDWLastUpdated,EnrollmentId,EndsOn,StatusId,CreatedOn,EDWProcessID,EDWIsDeletedFlag,ModifiedBy,OrganizationId,PriceListCustomerTypeCode,Email,CreatedBy,EDWSourceExtractID,SourceModifiedDate', @From=N'WAEPPROD_AgreementParticipants', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[BillableItemPrice_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'PartNumber,OriginalPrice,NormalizedPrice,StartsOn,EDWSourceSystemID,BillableItemId,EDWLastUpdated,ModifiedOn,Price,AdjustmentType,Comments,SourceTypeId,EDWIsDeletedFlag,EnrollmentId,CreatedOn,EndsOn,EDWProcessID,TierType,ModifiedBy,Id,EDWFirstInserted,CurrencyId,EDWSourceExtractID,SourceKey,BillableItemType,EDWExtractGrouping,CreatedBy',  @From=N'WAEPPROD_BillableItemPrices', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[BillableItems_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWProcessID,CommitmentQuantityPerUnit,HasCommitmentOffer,SkuTypeId,ConsumptionQuantityPerUnit,NewCommitmentName,EDWIsDeletedFlag,NewQuantityPerUnit,ModifiedBy,IsMonetaryCommitmentService,Id,CommitmentName,ReviewedBy,ConsumptionName,EDWSourceExtractID,EDWExtractGrouping,MocpResourcesPerUnit,ModifiedOn,EDWFirstInserted,CreatedBy,StartsOn,StatusId,NewConsumptionPartNumber,CommitmentPartNumber,ReviewComments,ConsumptionPartNumber,WorkflowStatus,EDWSourceSystemID,UnitOfMeasure,EDWLastUpdated,CreatedOn,NewCommitmentPartNumber,WorkflowInstanceId,Name,NewConsumptionName,EndsOn',  @From=N'WAEPPROD_BillableItems', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[BillableItemService_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceSystemID,EDWLastUpdated,ServiceResourceId,BillableItemId,ResourceGUID,EDWProcessID,CreatedOn,EDWIsDeletedFlag,ServiceId,ServiceRegionId,EDWFirstInserted,ModifiedBy,EDWSourceExtractID,Id,EDWExtractGrouping,CreatedBy,ModifiedOn,ServiceTypeId',  @From=N'WAEPPROD_BillableItemServices', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[ContactInformation_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CountryId,Id,CreatedBy,EDWSourceSystemID,EDWLastUpdated,Phone,FirstName,ModifiedOn,PostalCode,Street,EDWProcessID,AddressId,Name,LastName,City,EDWIsDeletedFlag,EmergencyNumber,ModifiedBy,CreatedOn,EDWSourceExtractID,EDWExtractGrouping,Department,EDWFirstInserted,Email,Fax,State',  @From=N'WAEPPROD_ContactInformation', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Countries_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWLastUpdated,Id,LanguageCode,EDWProcessID,ISOCountryCode,EDWIsDeletedFlag,Name,PriceListCountryCode,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,EDWSourceSystemID,CountryCode,BillingCurrencyCode',  @From=N'WAEPPROD_Countries', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Currencies_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,EDWSourceSystemID,CurrencyCode,EDWLastUpdated,CurrencyName,EDWProcessID,EDWIsDeletedFlag',  @From=N'WAEPPROD_Currencies', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[DepartmentAccounts_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'ModifiedOn,EDWSourceSystemID,EDWLastUpdated,CreatedOn,AccountId,EDWProcessID,EDWIsDeletedFlag,ModifiedBy,Id,StartsOn,EDWSourceExtractID,CreatedBy,EDWExtractGrouping,EDWFirstInserted,DepartmentId,EndsOn', @From=N'WAEPPROD_DepartmentAccounts', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Departments_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CreatedOn,SpendingQuota,ModifiedBy,CostCenter,EDWSourceExtractID,EDWFirstInserted,Id,EDWExtractGrouping,IsGovernment,ChargeCode,EffectiveStartDate,ParentId,CreatedBy,EDWLastUpdated,Name,ContractId,EDWSourceSystemID,PrimaryContactId,EffectiveEndDate,BillingNotificationPct,EDWProcessID,ModifiedOn,Description,TechnicalContactId,EDWIsDeletedFlag,CompanyName,IsMsp', @From=N'WAEPPROD_Departments', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[EaCommerceAccounts_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CreatedBy,CommerceAccountId,Version,EDWProcessID,EDWIsDeletedFlag,StatusId,TenantId,EDWSourceExtractID,ModifiedOn,EDWExtractGrouping,Id,EDWFirstInserted,OrgObjectId,CreatedOn,ModifiedBy,EDWLastUpdated,EDWSourceSystemID,AccountId', @From=N'WAEPPROD_EaCommerceAccounts', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[EnrollmentAttributes_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWExtractGrouping,Name,EDWSourceSystemID,EDWLastUpdated,Value,EDWIsDeletedFlag,EDWProcessID,Id,EDWFirstInserted,EDWSourceExtractID',  @From=N'WAEPPROD_EnrollmentAttributes', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[EnrollmentCommitmentTerms_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWProcessID,EDWIsDeletedFlag,EnrollmentId,EDWSourceExtractID,FormattedTermDate,EDWFirstInserted,EDWExtractGrouping,TermStartDate,CreatedOn,EDWLastUpdated,EDWSourceSystemID,TermEndDate,ModifiedOn,Id',  @From=N'WAEPPROD_EnrollmentCommitmentTerms', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[EnrollmentDepartments_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWExtractGrouping,EndsOn,DepartmentId,ModifiedOn,EDWSourceSystemID,EDWLastUpdated,EnrollmentId,ModifiedBy,CreatedOn,EDWProcessID,EDWIsDeletedFlag,Id,CreatedBy,StartsOn,EDWFirstInserted,EDWSourceExtractID',  @From=N'WAEPPROD_EnrollmentDepartments', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[EnrollmentParticipants_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'OrganizationId,EDWExtractGrouping,StatusId,ParticipantTypeCode,ModifiedOn,Id,EDWLastUpdated,EDWSourceSystemID,StartsOn,AgreementParticipantKey,EDWProcessID,ModifiedBy,CreatedOn,EnrollmentId,EDWIsDeletedFlag,ParticipantType,CreatedBy,EndsOn,EDWFirstInserted,EDWSourceExtractID', @From=N'WAEPPROD_EnrollmentParticipants', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Enrollments_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
		@Select=N'[Id]
			,[AmendmentType]
			,[StatusId]
			,[StartEffectiveDate]
			,[EndEffectiveDate]
			,[AmendmentStartDate]
			,[AmendmentEndDate]
			,[OperationsCenterId]
			,[PriceListCurrencyId]
			,[BillingCycle]
			,[GuaranteedServicePercentage]
			,[CountryId]
			,[RegionId]
			,[EndCustomerName]
			,[AuthLevelStatusId]
			,[InvoiceNotificationCycle]
			,[HermesStartDate]
			,[Attributes]
			,[CanExtendTerm]
			,[Channel]
			,[Version]
			,[SourceModifiedDate]
			,[ExternalStatusId]
			,[CreatedOn]
			,[CreatedBy]
			,[ModifiedOn]
			,[ModifiedBy]
			,[EnrollmentKey]
			,[AgreementTypeId]
			,[PriceListCountryCode]
			,[MPNId]
			,[TerminateSuccessful]
			,[TransferDepartments]
			,[PublicCustomerNumber]
			,[PriorEnrollmentKey]
			,[TransferTo]
			,[TransferDate]
			,[LicenseAgreementTypeId]
			,[ContractTypeId]
			,[EnrollmentNumber]
			,[ProgramId]
			,[ProgramOfferingCode]
			,[OfferingLevelCode]',
	@From=N'WAEPPROD_Enrollments', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[EnrollmentsAccounts_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
	@Select=N'Id,AccountId,EnrollmentId,IsDeleted,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,StartsOn,EndsOn'
	, @From=N'WAEPPROD_EnrollmentsAccounts', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[Entitlements_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceSystemID,SubscriberId,EDWLastUpdated,BenefitDetailGuid,Name,ExpirationDateReactivated,EDWProcessID,CreatedBy,EDWIsDeletedFlag,Identifier,ModifiedBy,StartDate,CreatedOn,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,Type,Id,ExpirationDate,ModifiedOn,IsTempSupport', @From=N'WAEPPROD_Entitlements', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[EntitlementSubscribers_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,PUID,EDWIsDeletedFlag,EDWProcessID,EDWSourceExtractID,WindowsLiveId,EDWFirstInserted,EDWExtractGrouping,EDWSourceSystemID,CreatedOn,EDWLastUpdated', @From=N'WAEPPROD_EntitlementSubscribers', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[ExternalAccounts_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'ModifiedOn,StatusId,EDWProcessID,EDWIsDeletedFlag,CreatedOn,AccountId,EDWSourceExtractID,ModifiedBy,EDWFirstInserted,EDWExtractGrouping,ExternalAccountId,IsActive,CreatedBy,EDWLastUpdated,EDWSourceSystemID,Id,MintAccountId',  @From=N'WAEPPROD_ExternalAccounts', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Invoices_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
	@Select=N'InvoiceType,ModifiedOn,OperationCenterId,BillingCycleStartDate,EnrollmentId,Comments,CreatedOn,AssignedTo,ModifiedBy,EndCustomerId,AssignedOn,RegionId,BillingCycleEndDate,ReadyToInvoiceOn,Id,PurchaseOrderNumber,ErrCount,ChannelPartnerId,StatusId,CompletedOn', @From=N'WAEPPROD_Invoices', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[MonetaryAdjustmentTypes_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Description,EDWIsDeletedFlag,EDWProcessID,EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping,EDWSourceSystemID,Id,EDWLastUpdated',  @From=N'WAEPPROD_MonetaryAdjustmentTypes', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[MonthlyCommitmentPurchases_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping,ActualQuantityOrdered,Month,EDWLastUpdated,EDWSourceSystemID,BillableItemPriceId,EDWProcessID,MonthlyPurchase,EDWIsDeletedFlag,Id,PurchaseOrderLineItemId',  @From=N'WAEPPROD_MonthlyCommitmentPurchases', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[MonthlyItemCharges_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
	@Select=N'StatusId,EDWLastUpdated,CommitmentResourceQty,ItemCharges,CommitmentPriceId,PriceType,EDWIsDeletedFlag,EDWProcessID,Id,ConsumptionPriceId,BillingMonth,CreatedOn,ConsumptionUnitsQty,EDWFirstInserted,InvoiceId,EDWExtractGrouping,EDWSourceExtractID,BillableItemId,CommitmentUnitsQty,ConsumptionResourceQty,EDWSourceSystemID,ModifiedOn', @From=N'WAEPPROD_MonthlyItemCharges', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[Organizations_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWExtractGrouping,EDWFirstInserted,EDWSourceExtractID,Id,CountryId,CreatedBy,EDWSourceSystemID,ModifiedOn,EDWLastUpdated,SourceModifiedDate,OrganizationPublicNumber,CreatedOn,AuthLevelStatusId,EDWProcessID,BusinessName,EDWIsDeletedFlag,ModifiedBy,Version',  @From=N'WAEPPROD_Organizations', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[PriceAdjustment_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'WorkflowStatus,ReviewComments,ModifiedOn,EDWProcessID,Id,EnrollmentNumber,CreatedBy,EndsOn,BillableItemId,EDWSourceExtractID,EDWIsDeletedFlag,EDWFirstInserted,WorkflowInstanceId,AdjustmentType,DiscountRate,Name,CreatedOn,ModifiedBy,EDWExtractGrouping,EDWLastUpdated,ReviewedBy,PartNumber,EDWSourceSystemID,PriceOverrideComments,StartsOn', @From=N'WAEPPROD_PriceAdjustment', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[PurchaseOrderLineItems]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWIsDeletedFlag,POLineItemStatusCode,ExtendedLineItemAmount,EDWProcessID,StatusId,SalesOrderLineItemKey,Id,SourceModifiedDate,OfferingLevelCode,BillingMultiplierPrice,CreatedBy,QuantityOrdered,EDWSourceExtractID,CoveragePeriodStartDate,Comments,EDWFirstInserted,EDWExtractGrouping,BillingOptionCode,Version,PurchaseOrderId,ProgramId,PartNumber,PricingPeriodDate,PurchaseUnitQuantity,EDWSourceSystemID,CoveragePeriodEndDate,ModifiedOn,EDWLastUpdated,ProgramOfferingCode,AdjustmentType,CurrencyId,BillableItemId,ModifiedBy,CreatedOn,UsedPrice,POLineItemKey',  @From=N'WAEPPROD_PurchaseOrderLineItems', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[PurchaseOrders_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceExtractID,EDWExtractGrouping,EDWFirstInserted,PurchaseOrderKey,CurrencyId,PriceSheetId,ModifiedBy,CreatedOn,EDWSourceSystemID,EDWLastUpdated,PurchaseOrderNumber,CreatedBy,Version,EnrollmentId,EDWProcessID,OverrideCommitmentPurchase,Id,StatusId,EDWIsDeletedFlag,StartsOn,SourceModifiedDate,ModifiedOn', @From=N'WAEPPROD_PurchaseOrders', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[QuarterlyUsageSummary_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
		@Select=N'[Id]
			,[EnrollmentId]
			,[Month]
			,[BeginBalance]
			,[NewPurchases]
			,[SIECredit]
			,[PromoCredit]
			,[Utilized]
			,[EndBalance]
			,[ChargesBilledSeparately]
			,[Overage]
			,[CreatedOn]
			,[ModifiedOn]',
	@From=N'WAEPPROD_QuarterlyUsageSummary', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[ServiceRegions_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceSystemID,EDWLastUpdated,Description,ParentId,Id,EDWIsDeletedFlag,EDWProcessID,Name,EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping',  @From=N'WAEPPROD_ServiceRegions', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Services_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
		@Select=N'Id,Name,Description',  @From=N'WAEPPROD_Services', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[ServiceTypes_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
		@Select=N'Id,Name,Description',  @From=N'WAEPPROD_ServiceTypes', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[Status_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'RelatedType,EDWProcessID,ExternalStatusCode,EDWIsDeletedFlag,Name,EDWExtractGrouping,EDWSourceExtractID,EDWFirstInserted,Value,Id,EDWSourceSystemID,EDWLastUpdated', @From=N'WAEPPROD_Status', @Where=N'1=1'

	INSERT INTO [Velocity].[dbo].[Subscription_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N' CreatedOn ,ModifiedBy      ,EDWSourceSystemID
			,TransferState      ,EDWLastUpdated      ,StartDate      ,OfferName   ,WindowsLiveId      ,OMSSubscriptionGuid      ,BisLastUpdated      ,CreatedBy
			,EDWIsDeletedFlag      ,Id      ,EDWProcessID      ,EndDate      ,SubscriptionId
			,ModifiedOn      ,StatusId      ,SuspensionReason      ,EDWSourceExtractID
			,EDWFirstInserted      ,AccountId      ,EDWExtractGrouping     ,MOCPSubscriptionGuid      ,Name',  @From=N'WAEPPROD_Subscriptions', @Where=N'1=1'
	

	INSERT INTO [Velocity].[dbo].[UserRoles_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CreatedBy,EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping,EntityType,UserId,EDWSourceSystemID,EDWLastUpdated,ModifiedOn,ModifiedBy,RoleId,CreatedOn,EDWIsDeletedFlag,EDWProcessID,Id,EntityId', @From=N'WAEPPROD_UserRoles', @Where=N'1=1'


	INSERT INTO [Velocity].[dbo].[Users_temp]
	EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,EDWSourceSystemID,EDWLastUpdated,Version,Domain,ModifiedBy,CreatedOn,EDWIsDeletedFlag,WindowsLiveId,EDWProcessID,IsOrgId,AdminPermission,PreferredCulture,CreatedBy,EDWFirstInserted,EDWSourceExtractID,FrequencyCode,EDWExtractGrouping,PUID,AdminPermissionExpiryTime,NotificationContact,ModifiedOn',  @From=N'WAEPPROD_Users', @Where=N'1=1'

RETURN 0

