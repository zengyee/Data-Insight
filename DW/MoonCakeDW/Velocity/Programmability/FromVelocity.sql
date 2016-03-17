---------------------------------------------------Velocity->temp

truncate table [Velocity].[dbo].[Velocity_Accounts_temp]
truncate table [Velocity].[dbo].[Velocity_AccountsSubscriptions_temp]
truncate table [Velocity].[dbo].[Velocity_agreementParticipants_temp]
truncate table [Velocity].[dbo].[Velocity_BillableItemPrice_temp]
truncate table [Velocity].[dbo].[Velocity_BillableItems_temp]
truncate table [Velocity].[dbo].[Velocity_BillableItemService_temp]
truncate table [Velocity].[dbo].[Velocity_ContactInformation_temp]
truncate table [Velocity].[dbo].[Velocity_Countries_temp]
truncate table [Velocity].[dbo].[Velocity_Currencies_temp]
truncate table [Velocity].[dbo].[Velocity_DepartmentAccounts_temp]
truncate table [Velocity].[dbo].[Velocity_Departments_temp]
truncate table [Velocity].[dbo].[Velocity_EaCommerceAccounts_temp]
truncate table [Velocity].[dbo].[Velocity_EnrollmentAttributes_temp]
truncate table [Velocity].[dbo].[Velocity_EnrollmentCommitmentTerms_temp]
truncate table [Velocity].[dbo].[Velocity_EnrollmentDepartments_temp]
truncate table [Velocity].[dbo].[Velocity_EnrollmentParticipants_temp]
truncate table [Velocity].[dbo].[Velocity_Enrollments_temp]
truncate table [Velocity].[dbo].[Velocity_EnrollmentsAccounts_temp]
truncate table [Velocity].[dbo].[Velocity_Entitlements_temp]
truncate table [Velocity].[dbo].[Velocity_EntitlementSubscribers_temp]
truncate table [Velocity].[dbo].[Velocity_ExternalAccounts_temp]
truncate table [Velocity].[dbo].[Velocity_Invoices_temp]
truncate table [Velocity].[dbo].[Velocity_MonetaryAdjustmentTypes_temp]
truncate table [Velocity].[dbo].[Velocity_MonthlyCommitmentPurchases_temp]
truncate table [Velocity].[dbo].[Velocity_MonthlyItemCharges_temp]
truncate table [Velocity].[dbo].[Velocity_Organizations_temp]
truncate table [Velocity].[dbo].[Velocity_PriceAdjustment_temp]
truncate table [Velocity].[dbo].[Velocity_PurchaseOrderLineItems]
truncate table [Velocity].[dbo].[Velocity_PurchaseOrders_temp]
truncate table [Velocity].[dbo].[Velocity_QuarterlyUsageSummary_temp]
truncate table [Velocity].[dbo].[Velocity_ServiceRegions_temp]
truncate table [Velocity].[dbo].[Velocity_ServiceResources_temp]
truncate table [Velocity].[dbo].[Velocity_Services_temp]
truncate table [Velocity].[dbo].[Velocity_ServiceTypes_temp]
truncate table [Velocity].[dbo].[Velocity_Status_temp]
truncate table [Velocity].[dbo].[Velocity_Subscription_temp]
truncate table [Velocity].[dbo].[Velocity_UserRoles_temp]
truncate table [Velocity].[dbo].[Velocity_Users_temp]




insert into [Velocity].[dbo].[Velocity_Accounts_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
@Select=N'StatusId,IsOrgIdPUID,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,Id,Name,WindowsLiveId,Version,UserId,BisLastUpdated,
FirstName,LastName', @From=N'WAEPPROD_Accounts',@Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_Countries]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWLastUpdated,Id,LanguageCode,EDWProcessID,ISOCountryCode,EDWIsDeletedFlag,Name,PriceListCountryCode,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,EDWSourceSystemID,CountryCode,BillingCurrencyCode',  @From=N'WAEPPROD_Countries', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_AccountsSubscriptions_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
@Select=N'Id,AccountId,SubscriptionId,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,StartsOn,EndsOn', @From=N'WAEPPROD_AccountsSubscriptions',@Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_agreementParticipants_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,EDWExtractGrouping,AgreementParticipantKey,EDWFirstInserted,EmailContact,Version,StartsOn,ModifiedOn,EDWSourceSystemID,ParticipantType,EDWLastUpdated,EnrollmentId,EndsOn,StatusId,CreatedOn,EDWProcessID,EDWIsDeletedFlag,ModifiedBy,OrganizationId,PriceListCustomerTypeCode,Email,CreatedBy,EDWSourceExtractID,SourceModifiedDate', @From=N'WAEPPROD_AgreementParticipants', @Where=N'1=1'



insert into [Velocity].[dbo].[Velocity_BillableItemPrice_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'PartNumber,OriginalPrice,NormalizedPrice,StartsOn,EDWSourceSystemID,BillableItemId,EDWLastUpdated,ModifiedOn,Price,AdjustmentType,Comments,SourceTypeId,EDWIsDeletedFlag,EnrollmentId,CreatedOn,EndsOn,EDWProcessID,TierType,ModifiedBy,Id,EDWFirstInserted,CurrencyId,EDWSourceExtractID,SourceKey,BillableItemType,EDWExtractGrouping,CreatedBy',  @From=N'WAEPPROD_BillableItemPrices', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_BillableItems_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWProcessID,CommitmentQuantityPerUnit,HasCommitmentOffer,SkuTypeId,ConsumptionQuantityPerUnit,NewCommitmentName,EDWIsDeletedFlag,NewQuantityPerUnit,ModifiedBy,IsMonetaryCommitmentService,Id,CommitmentName,ReviewedBy,ConsumptionName,EDWSourceExtractID,EDWExtractGrouping,MocpResourcesPerUnit,ModifiedOn,EDWFirstInserted,CreatedBy,StartsOn,StatusId,NewConsumptionPartNumber,CommitmentPartNumber,ReviewComments,ConsumptionPartNumber,WorkflowStatus,EDWSourceSystemID,UnitOfMeasure,EDWLastUpdated,CreatedOn,NewCommitmentPartNumber,WorkflowInstanceId,Name,NewConsumptionName,EndsOn',  @From=N'WAEPPROD_BillableItems', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_BillableItemService_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceSystemID,EDWLastUpdated,ServiceResourceId,BillableItemId,ResourceGUID,EDWProcessID,CreatedOn,EDWIsDeletedFlag,ServiceId,ServiceRegionId,EDWFirstInserted,ModifiedBy,EDWSourceExtractID,Id,EDWExtractGrouping,CreatedBy,ModifiedOn,ServiceTypeId',  @From=N'WAEPPROD_BillableItemServices', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_ContactInformation_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CountryId,Id,CreatedBy,EDWSourceSystemID,EDWLastUpdated,Phone,FirstName,ModifiedOn,PostalCode,Street,EDWProcessID,AddressId,Name,LastName,City,EDWIsDeletedFlag,EmergencyNumber,ModifiedBy,CreatedOn,EDWSourceExtractID,EDWExtractGrouping,Department,EDWFirstInserted,Email,Fax,State',  @From=N'WAEPPROD_ContactInformation', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Countries_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWLastUpdated,Id,LanguageCode,EDWProcessID,ISOCountryCode,EDWIsDeletedFlag,Name,PriceListCountryCode,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,EDWSourceSystemID,CountryCode,BillingCurrencyCode',  @From=N'WAEPPROD_Countries', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Currencies_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,EDWSourceSystemID,CurrencyCode,EDWLastUpdated,CurrencyName,EDWProcessID,EDWIsDeletedFlag',  @From=N'WAEPPROD_Currencies', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_DepartmentAccounts_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'ModifiedOn,EDWSourceSystemID,EDWLastUpdated,CreatedOn,AccountId,EDWProcessID,EDWIsDeletedFlag,ModifiedBy,Id,StartsOn,EDWSourceExtractID,CreatedBy,EDWExtractGrouping,EDWFirstInserted,DepartmentId,EndsOn', @From=N'WAEPPROD_DepartmentAccounts', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Departments_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CreatedOn,SpendingQuota,ModifiedBy,CostCenter,EDWSourceExtractID,EDWFirstInserted,Id,EDWExtractGrouping,IsGovernment,ChargeCode,EffectiveStartDate,ParentId,CreatedBy,EDWLastUpdated,Name,ContractId,EDWSourceSystemID,PrimaryContactId,EffectiveEndDate,BillingNotificationPct,EDWProcessID,ModifiedOn,Description,TechnicalContactId,EDWIsDeletedFlag,CompanyName,IsMsp', @From=N'WAEPPROD_Departments', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_EaCommerceAccounts_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CreatedBy,CommerceAccountId,Version,EDWProcessID,EDWIsDeletedFlag,StatusId,TenantId,EDWSourceExtractID,ModifiedOn,EDWExtractGrouping,Id,EDWFirstInserted,OrgObjectId,CreatedOn,ModifiedBy,EDWLastUpdated,EDWSourceSystemID,AccountId', @From=N'WAEPPROD_EaCommerceAccounts', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_EnrollmentAttributes_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWExtractGrouping,Name,EDWSourceSystemID,EDWLastUpdated,Value,EDWIsDeletedFlag,EDWProcessID,Id,EDWFirstInserted,EDWSourceExtractID',  @From=N'WAEPPROD_EnrollmentAttributes', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_EnrollmentCommitmentTerms_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWProcessID,EDWIsDeletedFlag,EnrollmentId,EDWSourceExtractID,FormattedTermDate,EDWFirstInserted,EDWExtractGrouping,TermStartDate,CreatedOn,EDWLastUpdated,EDWSourceSystemID,TermEndDate,ModifiedOn,Id',  @From=N'WAEPPROD_EnrollmentCommitmentTerms', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_EnrollmentDepartments_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWExtractGrouping,EndsOn,DepartmentId,ModifiedOn,EDWSourceSystemID,EDWLastUpdated,EnrollmentId,ModifiedBy,CreatedOn,EDWProcessID,EDWIsDeletedFlag,Id,CreatedBy,StartsOn,EDWFirstInserted,EDWSourceExtractID',  @From=N'WAEPPROD_EnrollmentDepartments', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_EnrollmentParticipants_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'OrganizationId,EDWExtractGrouping,StatusId,ParticipantTypeCode,ModifiedOn,Id,EDWLastUpdated,EDWSourceSystemID,StartsOn,AgreementParticipantKey,EDWProcessID,ModifiedBy,CreatedOn,EnrollmentId,EDWIsDeletedFlag,ParticipantType,CreatedBy,EndsOn,EDWFirstInserted,EDWSourceExtractID', @From=N'WAEPPROD_EnrollmentParticipants', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Enrollments_temp]
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

insert into [Velocity].[dbo].[Velocity_EnrollmentsAccounts_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
@Select=N'Id,AccountId,EnrollmentId,IsDeleted,CreatedOn,CreatedBy,ModifiedOn,ModifiedBy,StartsOn,EndsOn'
, @From=N'WAEPPROD_EnrollmentsAccounts', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_Entitlements_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceSystemID,SubscriberId,EDWLastUpdated,BenefitDetailGuid,Name,ExpirationDateReactivated,EDWProcessID,CreatedBy,EDWIsDeletedFlag,Identifier,ModifiedBy,StartDate,CreatedOn,EDWFirstInserted,EDWExtractGrouping,EDWSourceExtractID,Type,Id,ExpirationDate,ModifiedOn,IsTempSupport', @From=N'WAEPPROD_Entitlements', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_EntitlementSubscribers_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,PUID,EDWIsDeletedFlag,EDWProcessID,EDWSourceExtractID,WindowsLiveId,EDWFirstInserted,EDWExtractGrouping,EDWSourceSystemID,CreatedOn,EDWLastUpdated', @From=N'WAEPPROD_EntitlementSubscribers', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_ExternalAccounts_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'ModifiedOn,StatusId,EDWProcessID,EDWIsDeletedFlag,CreatedOn,AccountId,EDWSourceExtractID,ModifiedBy,EDWFirstInserted,EDWExtractGrouping,ExternalAccountId,IsActive,CreatedBy,EDWLastUpdated,EDWSourceSystemID,Id,MintAccountId',  @From=N'WAEPPROD_ExternalAccounts', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Invoices_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
@Select=N'InvoiceType,ModifiedOn,OperationCenterId,BillingCycleStartDate,EnrollmentId,Comments,CreatedOn,AssignedTo,ModifiedBy,EndCustomerId,AssignedOn,RegionId,BillingCycleEndDate,ReadyToInvoiceOn,Id,PurchaseOrderNumber,ErrCount,ChannelPartnerId,StatusId,CompletedOn', @From=N'WAEPPROD_Invoices', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_MonetaryAdjustmentTypes_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Description,EDWIsDeletedFlag,EDWProcessID,EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping,EDWSourceSystemID,Id,EDWLastUpdated',  @From=N'WAEPPROD_MonetaryAdjustmentTypes', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_MonthlyCommitmentPurchases_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping,ActualQuantityOrdered,Month,EDWLastUpdated,EDWSourceSystemID,BillableItemPriceId,EDWProcessID,MonthlyPurchase,EDWIsDeletedFlag,Id,PurchaseOrderLineItemId',  @From=N'WAEPPROD_MonthlyCommitmentPurchases', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_MonthlyItemCharges_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
@Select=N'StatusId,EDWLastUpdated,CommitmentResourceQty,ItemCharges,CommitmentPriceId,PriceType,EDWIsDeletedFlag,EDWProcessID,Id,ConsumptionPriceId,BillingMonth,CreatedOn,ConsumptionUnitsQty,EDWFirstInserted,InvoiceId,EDWExtractGrouping,EDWSourceExtractID,BillableItemId,CommitmentUnitsQty,ConsumptionResourceQty,EDWSourceSystemID,ModifiedOn', @From=N'WAEPPROD_MonthlyItemCharges', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_Organizations_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWExtractGrouping,EDWFirstInserted,EDWSourceExtractID,Id,CountryId,CreatedBy,EDWSourceSystemID,ModifiedOn,EDWLastUpdated,SourceModifiedDate,OrganizationPublicNumber,CreatedOn,AuthLevelStatusId,EDWProcessID,BusinessName,EDWIsDeletedFlag,ModifiedBy,Version',  @From=N'WAEPPROD_Organizations', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_PriceAdjustment_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'WorkflowStatus,ReviewComments,ModifiedOn,EDWProcessID,Id,EnrollmentNumber,CreatedBy,EndsOn,BillableItemId,EDWSourceExtractID,EDWIsDeletedFlag,EDWFirstInserted,WorkflowInstanceId,AdjustmentType,DiscountRate,Name,CreatedOn,ModifiedBy,EDWExtractGrouping,EDWLastUpdated,ReviewedBy,PartNumber,EDWSourceSystemID,PriceOverrideComments,StartsOn', @From=N'WAEPPROD_PriceAdjustment', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_PurchaseOrderLineItems]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWIsDeletedFlag,POLineItemStatusCode,ExtendedLineItemAmount,EDWProcessID,StatusId,SalesOrderLineItemKey,Id,SourceModifiedDate,OfferingLevelCode,BillingMultiplierPrice,CreatedBy,QuantityOrdered,EDWSourceExtractID,CoveragePeriodStartDate,Comments,EDWFirstInserted,EDWExtractGrouping,BillingOptionCode,Version,PurchaseOrderId,ProgramId,PartNumber,PricingPeriodDate,PurchaseUnitQuantity,EDWSourceSystemID,CoveragePeriodEndDate,ModifiedOn,EDWLastUpdated,ProgramOfferingCode,AdjustmentType,CurrencyId,BillableItemId,ModifiedBy,CreatedOn,UsedPrice,POLineItemKey',  @From=N'WAEPPROD_PurchaseOrderLineItems', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_PurchaseOrders_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceExtractID,EDWExtractGrouping,EDWFirstInserted,PurchaseOrderKey,CurrencyId,PriceSheetId,ModifiedBy,CreatedOn,EDWSourceSystemID,EDWLastUpdated,PurchaseOrderNumber,CreatedBy,Version,EnrollmentId,EDWProcessID,OverrideCommitmentPurchase,Id,StatusId,EDWIsDeletedFlag,StartsOn,SourceModifiedDate,ModifiedOn', @From=N'WAEPPROD_PurchaseOrders', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_QuarterlyUsageSummary_temp]
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


insert into [Velocity].[dbo].[Velocity_ServiceRegions_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'EDWSourceSystemID,EDWLastUpdated,Description,ParentId,Id,EDWIsDeletedFlag,EDWProcessID,Name,EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping',  @From=N'WAEPPROD_ServiceRegions', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Services_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
 @Select=N'Id,Name,Description',  @From=N'WAEPPROD_Services', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_ServiceTypes_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', 
 @Select=N'Id,Name,Description',  @From=N'WAEPPROD_ServiceTypes', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_Status_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'RelatedType,EDWProcessID,ExternalStatusCode,EDWIsDeletedFlag,Name,EDWExtractGrouping,EDWSourceExtractID,EDWFirstInserted,Value,Id,EDWSourceSystemID,EDWLastUpdated', @From=N'WAEPPROD_Status', @Where=N'1=1'

insert into [Velocity].[dbo].[Velocity_Subscription_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N' CreatedOn ,ModifiedBy      ,EDWSourceSystemID
      ,TransferState      ,EDWLastUpdated      ,StartDate      ,OfferName   ,WindowsLiveId      ,OMSSubscriptionGuid      ,BisLastUpdated      ,CreatedBy
      ,EDWIsDeletedFlag      ,Id      ,EDWProcessID      ,EndDate      ,SubscriptionId
      ,ModifiedOn      ,StatusId      ,SuspensionReason      ,EDWSourceExtractID
      ,EDWFirstInserted      ,AccountId      ,EDWExtractGrouping     ,MOCPSubscriptionGuid      ,Name',  @From=N'WAEPPROD_Subscriptions', @Where=N'1=1'
	

insert into [Velocity].[dbo].[Velocity_UserRoles_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'CreatedBy,EDWSourceExtractID,EDWFirstInserted,EDWExtractGrouping,EntityType,UserId,EDWSourceSystemID,EDWLastUpdated,ModifiedOn,ModifiedBy,RoleId,CreatedOn,EDWIsDeletedFlag,EDWProcessID,Id,EntityId', @From=N'WAEPPROD_UserRoles', @Where=N'1=1'


insert into [Velocity].[dbo].[Velocity_Users_temp]
EXEC DSLGet @DataPackage='CommercePlatform_China_MS-Led', @Version='18.0', @Select=N'Id,EDWSourceSystemID,EDWLastUpdated,Version,Domain,ModifiedBy,CreatedOn,EDWIsDeletedFlag,WindowsLiveId,EDWProcessID,IsOrgId,AdminPermission,PreferredCulture,CreatedBy,EDWFirstInserted,EDWSourceExtractID,FrequencyCode,EDWExtractGrouping,PUID,AdminPermissionExpiryTime,NotificationContact,ModifiedOn',  @From=N'WAEPPROD_Users', @Where=N'1=1'

-------------------------------------------------temp->product
Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Accounts_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Accounts]
		insert into [Velocity].[dbo].[Velocity_Accounts] select * from [Velocity].[dbo].[Velocity_Accounts_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_AccountsSubscriptions_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_AccountsSubscriptions]
		insert into [Velocity].[dbo].[Velocity_AccountsSubscriptions] select * from [Velocity].[dbo].[Velocity_AccountsSubscriptions_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_agreementParticipants_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_agreementParticipants]
		insert into [Velocity].[dbo].[Velocity_agreementParticipants] select * from [Velocity].[dbo].[Velocity_agreementParticipants_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_BillableItemPrice_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_BillableItemPrice]
		insert into [Velocity].[dbo].[Velocity_BillableItemPrice] select * from [Velocity].[dbo].[Velocity_BillableItemPrice_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_BillableItems_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_BillableItems]
		insert into [Velocity].[dbo].[Velocity_BillableItems] select * from [Velocity].[dbo].[Velocity_BillableItems_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_BillableItemService_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_BillableItemService]
		insert into [Velocity].[dbo].[Velocity_BillableItemService] select * from [Velocity].[dbo].[Velocity_BillableItemService_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_ContactInformation_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_ContactInformation]
		insert into [Velocity].[dbo].[Velocity_ContactInformation] select * from [Velocity].[dbo].[Velocity_ContactInformation_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Countries_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Countries]
		insert into [Velocity].[dbo].[Velocity_Countries] select * from [Velocity].[dbo].[Velocity_Countries_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Currencies_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Currencies]
		insert into [Velocity].[dbo].[Velocity_Currencies] select * from [Velocity].[dbo].[Velocity_Currencies_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_DepartmentAccounts_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_DepartmentAccounts]
		insert into [Velocity].[dbo].[Velocity_DepartmentAccounts] select * from [Velocity].[dbo].[Velocity_DepartmentAccounts_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Departments_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Departments]
		insert into [Velocity].[dbo].[Velocity_Departments] select * from [Velocity].[dbo].[Velocity_Departments_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EaCommerceAccounts_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EaCommerceAccounts]
		insert into [Velocity].[dbo].[Velocity_EaCommerceAccounts] select * from [Velocity].[dbo].[Velocity_EaCommerceAccounts_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EnrollmentAttributes_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EnrollmentAttributes]
		insert into [Velocity].[dbo].[Velocity_EnrollmentAttributes] select * from [Velocity].[dbo].[Velocity_EnrollmentAttributes_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EnrollmentCommitmentTerms_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EnrollmentCommitmentTerms]
		insert into [Velocity].[dbo].[Velocity_EnrollmentCommitmentTerms] select * from [Velocity].[dbo].[Velocity_EnrollmentCommitmentTerms_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EnrollmentDepartments_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EnrollmentDepartments]
		insert into [Velocity].[dbo].[Velocity_EnrollmentDepartments] select * from [Velocity].[dbo].[Velocity_EnrollmentDepartments_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EnrollmentParticipants_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EnrollmentParticipants]
		insert into [Velocity].[dbo].[Velocity_EnrollmentParticipants] select * from [Velocity].[dbo].[Velocity_EnrollmentParticipants_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Enrollments_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Enrollments]
		insert into [Velocity].[dbo].[Velocity_Enrollments] select * from [Velocity].[dbo].[Velocity_Enrollments_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EnrollmentsAccounts_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EnrollmentsAccounts]
		insert into [Velocity].[dbo].[Velocity_EnrollmentsAccounts] select * from [Velocity].[dbo].[Velocity_EnrollmentsAccounts_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Entitlements_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Entitlements]
		insert into [Velocity].[dbo].[Velocity_Entitlements] select * from [Velocity].[dbo].[Velocity_Entitlements_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_EntitlementSubscribers_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_EntitlementSubscribers]
		insert into [Velocity].[dbo].[Velocity_EntitlementSubscribers] select * from [Velocity].[dbo].[Velocity_EntitlementSubscribers_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_ExternalAccounts_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_ExternalAccounts]
		insert into [Velocity].[dbo].[Velocity_ExternalAccounts] select * from [Velocity].[dbo].[Velocity_ExternalAccounts_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Invoices_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Invoices]
		insert into [Velocity].[dbo].[Velocity_Invoices] select * from [Velocity].[dbo].[Velocity_Invoices_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_MonetaryAdjustmentTypes_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_MonetaryAdjustmentTypes]
		insert into [Velocity].[dbo].[Velocity_MonetaryAdjustmentTypes] select * from [Velocity].[dbo].[Velocity_MonetaryAdjustmentTypes_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_MonthlyCommitmentPurchases_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_MonthlyCommitmentPurchases]
		insert into [Velocity].[dbo].[Velocity_MonthlyCommitmentPurchases] select * from [Velocity].[dbo].[Velocity_MonthlyCommitmentPurchases_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_MonthlyItemCharges_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_MonthlyItemCharges]
		insert into [Velocity].[dbo].[Velocity_MonthlyItemCharges] select * from [Velocity].[dbo].[Velocity_MonthlyItemCharges_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Organizations_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Organizations]
		insert into [Velocity].[dbo].[Velocity_Organizations] select * from [Velocity].[dbo].[Velocity_Organizations_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_PriceAdjustment_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_PriceAdjustment]
		insert into [Velocity].[dbo].[Velocity_PriceAdjustment] select * from [Velocity].[dbo].[Velocity_PriceAdjustment_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_PurchaseOrderLineItems_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_PurchaseOrderLineItems]
		insert into [Velocity].[dbo].[Velocity_PurchaseOrderLineItems] select * from [Velocity].[dbo].[Velocity_PurchaseOrderLineItems_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_PurchaseOrders_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_PurchaseOrders]
		insert into [Velocity].[dbo].[Velocity_PurchaseOrders] select * from [Velocity].[dbo].[Velocity_PurchaseOrders_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_QuarterlyUsageSummary_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_QuarterlyUsageSummary]
		insert into [Velocity].[dbo].[Velocity_QuarterlyUsageSummary] select * from [Velocity].[dbo].[Velocity_QuarterlyUsageSummary_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_ServiceRegions_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_ServiceRegions]
		insert into [Velocity].[dbo].[Velocity_ServiceRegions] select * from [Velocity].[dbo].[Velocity_ServiceRegions_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_ServiceResources_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_ServiceResources]
		insert into [Velocity].[dbo].[Velocity_ServiceResources] select * from [Velocity].[dbo].[Velocity_ServiceResources_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Services_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Services]
		insert into [Velocity].[dbo].[Velocity_Services] select * from [Velocity].[dbo].[Velocity_Services_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_ServiceTypes_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_ServiceTypes]
		insert into [Velocity].[dbo].[Velocity_ServiceTypes] select * from [Velocity].[dbo].[Velocity_ServiceTypes_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Status_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Status]
		insert into [Velocity].[dbo].[Velocity_Status] select * from [Velocity].[dbo].[Velocity_Status_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Subscription_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Subscription]
		insert into [Velocity].[dbo].[Velocity_Subscription] select * from [Velocity].[dbo].[Velocity_Subscription_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch

Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_UserRoles_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_UserRoles]
		insert into [Velocity].[dbo].[Velocity_UserRoles] select * from [Velocity].[dbo].[Velocity_UserRoles_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch


Begin Try
	Begin Tran
	if(exists(select 1 from [Velocity].[dbo].[Velocity_Users_temp]))
	begin
		truncate table [Velocity].[dbo].[Velocity_Users]
		insert into [Velocity].[dbo].[Velocity_Users] select * from [Velocity].[dbo].[Velocity_Users_temp]
	end
	Commit Tran
End Try
Begin Catch
	if @@TRANCOUNT>1
		Rollback Tran
End Catch






