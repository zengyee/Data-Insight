CREATE PROCEDURE [dbo].[ETL_MergeTemp_TopTables]
	@ETLId INT
AS
	--if(exists(select 1 from [Subscription_temp]))
	--begin
	--	truncate table [Subscription]
	--	insert into [Subscription] select * from [Subscription_temp]
	--end
	--------------------------

	SET NOCOUNT ON;
	-- Temp table to record changes
	CREATE TABLE #MyTempTable
	(  
		[ActionTaken] nvarchar(10),
		[IncidentId] bigint
	)

	-- Merge by Insert and Update
    MERGE [dbo].[Subscription] AS target
		USING (SELECT * FROM [Subscription_temp]) 
			AS source ([CreatedOn]
					  ,[ModifiedBy]
					  ,[EDWSourceSystemID]
					  ,[TransferState]
					  ,[EDWLastUpdated]
					  ,[StartDate]
					  ,[OfferName]
					  ,[WindowsLiveId]
					  ,[OMSSubscriptionGuid]
					  ,[BisLastUpdated]
					  ,[CreatedBy]
					  ,[EDWIsDeletedFlag]
					  ,[Id]
					  ,[EDWProcessID]
					  ,[EndDate]
					  ,[SubscriptionId]
					  ,[ModifiedOn]
					  ,[StatusId]
					  ,[SuspensionReason]
					  ,[EDWSourceExtractID]
					  ,[EDWFirstInserted]
					  ,[AccountId]
					  ,[EDWExtractGrouping]
					  ,[MOCPSubscriptionGuid]
					  ,[Name])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[CreatedOn]=	source.[CreatedOn]
					,[ModifiedBy]=	source.[ModifiedBy]
					,[EDWSourceSystemID]=	source.[EDWSourceSystemID]
					,[TransferState]=	source.[TransferState]
					,[EDWLastUpdated]=	source.[EDWLastUpdated]
					,[StartDate]=	source.[StartDate]
					,[OfferName]=	source.[OfferName]
					,[WindowsLiveId]=	source.[WindowsLiveId]
					,[OMSSubscriptionGuid]=	source.[OMSSubscriptionGuid]
					,[BisLastUpdated]=	source.[BisLastUpdated]
					,[CreatedBy]=	source.[CreatedBy]
					,[EDWIsDeletedFlag]=	source.[EDWIsDeletedFlag]
					,[Id]=	source.[Id]
					,[EDWProcessID]=	source.[EDWProcessID]
					,[EndDate]=	source.[EndDate]
					,[SubscriptionId]=	source.[SubscriptionId]
					,[ModifiedOn]=	source.[ModifiedOn]
					,[StatusId]=	source.[StatusId]
					,[SuspensionReason]=	source.[SuspensionReason]
					,[EDWSourceExtractID]=	source.[EDWSourceExtractID]
					,[EDWFirstInserted]=	source.[EDWFirstInserted]
					,[AccountId]=	source.[AccountId]
					,[EDWExtractGrouping]=	source.[EDWExtractGrouping]
					,[MOCPSubscriptionGuid]=	source.[MOCPSubscriptionGuid]
					,[Name]=	source.[Name]


	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([CreatedOn]
			,[ModifiedBy]
			,[EDWSourceSystemID]
			,[TransferState]
			,[EDWLastUpdated]
			,[StartDate]
			,[OfferName]
			,[WindowsLiveId]
			,[OMSSubscriptionGuid]
			,[BisLastUpdated]
			,[CreatedBy]
			,[EDWIsDeletedFlag]
			,[Id]
			,[EDWProcessID]
			,[EndDate]
			,[SubscriptionId]
			,[ModifiedOn]
			,[StatusId]
			,[SuspensionReason]
			,[EDWSourceExtractID]
			,[EDWFirstInserted]
			,[AccountId]
			,[EDWExtractGrouping]
			,[MOCPSubscriptionGuid]
			,[Name])
    VALUES (source.[CreatedOn]
			,source.[ModifiedBy]
			,source.[EDWSourceSystemID]
			,source.[TransferState]
			,source.[EDWLastUpdated]
			,source.[StartDate]
			,source.[OfferName]
			,source.[WindowsLiveId]
			,source.[OMSSubscriptionGuid]
			,source.[BisLastUpdated]
			,source.[CreatedBy]
			,source.[EDWIsDeletedFlag]
			,source.[Id]
			,source.[EDWProcessID]
			,source.[EndDate]
			,source.[SubscriptionId]
			,source.[ModifiedOn]
			,source.[StatusId]
			,source.[SuspensionReason]
			,source.[EDWSourceExtractID]
			,source.[EDWFirstInserted]
			,source.[AccountId]
			,source.[EDWExtractGrouping]
			,source.[MOCPSubscriptionGuid]
			,source.[Name])

	--OUTPUT Parameters
    OUTPUT $action, inserted.[Id] INTO #MyTempTable;

	DECLARE	@InsertedRows INT
	DECLARE @UpdatedRows INT
	SELECT @InsertedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'INSERT'
	SELECT @UpdatedRows = COUNT(*) FROM #MyTempTable WHERE [ActionTaken] = 'UPDATE'
	
	-- Update Log
	UPDATE ETL_Log
		SET [InsertedRows] = @InsertedRows,
			[UpdatedRows] = @UpdatedRows
		WHERE [id] = @ETLId

 	DROP TABLE #MyTempTable


	--if(exists(select 1 from [Accounts_temp]))
	--begin
	--	truncate table [Accounts]
	--	insert into [Accounts] select * from [Accounts_temp]
	--end
	--------------------------
		-- Merge by Insert and Update
    MERGE [dbo].[Accounts] AS target
		USING (SELECT * FROM [Accounts_temp]) 
			AS source ([StatusId]
					  ,[IsOrgIdPUID]
					  ,[CreatedOn]
					  ,[CreatedBy]
					  ,[ModifiedOn]
					  ,[ModifiedBy]
					  ,[Id]
					  ,[Name]
					  ,[WindowsLiveId]
					  ,[Version]
					  ,[UserId]
					  ,[BisLastUpdated]
					  ,[FirstName]
					  ,[LastName])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[StatusId]=	source.[StatusId]
				,[IsOrgIdPUID]=	source.[IsOrgIdPUID]
				,[CreatedOn]=	source.[CreatedOn]
				,[CreatedBy]=	source.[CreatedBy]
				,[ModifiedOn]=	source.[ModifiedOn]
				,[ModifiedBy]=	source.[ModifiedBy]
				,[Id]=	source.[Id]
				,[Name]=	source.[Name]
				,[WindowsLiveId]=	source.[WindowsLiveId]
				,[Version]=	source.[Version]
				,[UserId]=	source.[UserId]
				,[BisLastUpdated]=	source.[BisLastUpdated]
				,[FirstName]=	source.[FirstName]
				,[LastName]=	source.[LastName]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([StatusId]
			  ,[IsOrgIdPUID]
			  ,[CreatedOn]
			  ,[CreatedBy]
			  ,[ModifiedOn]
			  ,[ModifiedBy]
			  ,[Id]
			  ,[Name]
			  ,[WindowsLiveId]
			  ,[Version]
			  ,[UserId]
			  ,[BisLastUpdated]
			  ,[FirstName]
			  ,[LastName])
    VALUES (source.[StatusId]
			  ,source.[IsOrgIdPUID]
			  ,source.[CreatedOn]
			  ,source.[CreatedBy]
			  ,source.[ModifiedOn]
			  ,source.[ModifiedBy]
			  ,source.[Id]
			  ,source.[Name]
			  ,source.[WindowsLiveId]
			  ,source.[Version]
			  ,source.[UserId]
			  ,source.[BisLastUpdated]
			  ,source.[FirstName]
			  ,source.[LastName]);



	--if(exists(select 1 from [AccountsSubscriptions_temp]))
	--begin
	--	truncate table [AccountsSubscriptions]
	--	insert into [AccountsSubscriptions] select * from [AccountsSubscriptions_temp]
	--end
	--------------------------

    MERGE [dbo].[AccountsSubscriptions] AS target
		USING (SELECT * FROM [AccountsSubscriptions_temp]) 
			AS source ([Id]
					  ,[AccountId]
					  ,[SubscriptionId]
					  ,[CreatedOn]
					  ,[CreatedBy]
					  ,[ModifiedOn]
					  ,[ModifiedBy]
					  ,[StartsOn]
					  ,[EndsOn])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[Id]	=source.[Id]
					,[AccountId]	 =source.[AccountId]
					,[SubscriptionId]	 =source.[SubscriptionId]
					,[CreatedOn]	 =source.[CreatedOn]
					,[CreatedBy]	 =source.[CreatedBy]
					,[ModifiedOn]	 =source.[ModifiedOn]
					,[ModifiedBy]	 =source.[ModifiedBy]
					,[StartsOn]	 =source.[StartsOn]
					,[EndsOn]	 =source.[EndsOn]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([Id]
		  ,[AccountId]
		  ,[SubscriptionId]
		  ,[CreatedOn]
		  ,[CreatedBy]
		  ,[ModifiedOn]
		  ,[ModifiedBy]
		  ,[StartsOn]
		  ,[EndsOn])
    VALUES (source.[Id]
		  ,source.[AccountId]
		  ,source.[SubscriptionId]
		  ,source.[CreatedOn]
		  ,source.[CreatedBy]
		  ,source.[ModifiedOn]
		  ,source.[ModifiedBy]
		  ,source.[StartsOn]
		  ,source.[EndsOn]);

	--if(exists(select 1 from [Status_temp]))
	--begin
	--	truncate table [Status]
	--	insert into [Status] select * from [Status_temp]
	--end
	--------------------------
	MERGE [dbo].[Status] AS target
		USING (SELECT * FROM [Status_temp]) 
			AS source (	[RelatedType]
						,[EDWProcessID]
						,[ExternalStatusCode]
						,[EDWIsDeletedFlag]
						,[Name]
						,[EDWExtractGrouping]
						,[EDWSourceExtractID]
						,[EDWFirstInserted]
						,[Value]
						,[Id]
						,[EDWSourceSystemID]
						,[EDWLastUpdated])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[RelatedType]=	source.[RelatedType]
					,[EDWProcessID]=	source.[EDWProcessID]
					,[ExternalStatusCode]=	source.[ExternalStatusCode]
					,[EDWIsDeletedFlag]=	source.[EDWIsDeletedFlag]
					,[Name]=	source.[Name]
					,[EDWExtractGrouping]=	source.[EDWExtractGrouping]
					,[EDWSourceExtractID]=	source.[EDWSourceExtractID]
					,[EDWFirstInserted]=	source.[EDWFirstInserted]
					,[Value]=	source.[Value]
					,[Id]=	source.[Id]
					,[EDWSourceSystemID]=	source.[EDWSourceSystemID]
					,[EDWLastUpdated]=	source.[EDWLastUpdated]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT (	[RelatedType]
				,[EDWProcessID]
				,[ExternalStatusCode]
				,[EDWIsDeletedFlag]
				,[Name]
				,[EDWExtractGrouping]
				,[EDWSourceExtractID]
				,[EDWFirstInserted]
				,[Value]
				,[Id]
				,[EDWSourceSystemID]
				,[EDWLastUpdated])
    VALUES (source.[RelatedType]
			,source.[EDWProcessID]
			,source.[ExternalStatusCode]
			,source.[EDWIsDeletedFlag]
			,source.[Name]
			,source.[EDWExtractGrouping]
			,source.[EDWSourceExtractID]
			,source.[EDWFirstInserted]
			,source.[Value]
			,source.[Id]
			,source.[EDWSourceSystemID]
			,source.[EDWLastUpdated]
			);
	--if(exists(select 1 from [Enrollments_temp]))
	--begin
	--	truncate table [Enrollments]
	--	insert into [Enrollments] select * from [Enrollments_temp]
	--end
	--------------------------
		MERGE [dbo].[Enrollments] AS target
		USING (SELECT * FROM [Enrollments_temp]) 
			AS source (	[Id]
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
					  ,[OfferingLevelCode])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[Id]=	source.[Id]
					,[AmendmentType]=	source.[AmendmentType]
					,[StatusId]=	source.[StatusId]
					,[StartEffectiveDate]=	source.[StartEffectiveDate]
					,[EndEffectiveDate]=	source.[EndEffectiveDate]
					,[AmendmentStartDate]=	source.[AmendmentStartDate]
					,[AmendmentEndDate]=	source.[AmendmentEndDate]
					,[OperationsCenterId]=	source.[OperationsCenterId]
					,[PriceListCurrencyId]=	source.[PriceListCurrencyId]
					,[BillingCycle]=	source.[BillingCycle]
					,[GuaranteedServicePercentage]=	source.[GuaranteedServicePercentage]
					,[CountryId]=	source.[CountryId]
					,[RegionId]=	source.[RegionId]
					,[EndCustomerName]=	source.[EndCustomerName]
					,[AuthLevelStatusId]=	source.[AuthLevelStatusId]
					,[InvoiceNotificationCycle]=	source.[InvoiceNotificationCycle]
					,[HermesStartDate]=	source.[HermesStartDate]
					,[Attributes]=	source.[Attributes]
					,[CanExtendTerm]=	source.[CanExtendTerm]
					,[Channel]=	source.[Channel]
					,[Version]=	source.[Version]
					,[SourceModifiedDate]=	source.[SourceModifiedDate]
					,[ExternalStatusId]=	source.[ExternalStatusId]
					,[CreatedOn]=	source.[CreatedOn]
					,[CreatedBy]=	source.[CreatedBy]
					,[ModifiedOn]=	source.[ModifiedOn]
					,[ModifiedBy]=	source.[ModifiedBy]
					,[EnrollmentKey]=	source.[EnrollmentKey]
					,[AgreementTypeId]=	source.[AgreementTypeId]
					,[PriceListCountryCode]=	source.[PriceListCountryCode]
					,[MPNId]=	source.[MPNId]
					,[TerminateSuccessful]=	source.[TerminateSuccessful]
					,[TransferDepartments]=	source.[TransferDepartments]
					,[PublicCustomerNumber]=	source.[PublicCustomerNumber]
					,[PriorEnrollmentKey]=	source.[PriorEnrollmentKey]
					,[TransferTo]=	source.[TransferTo]
					,[TransferDate]=	source.[TransferDate]
					,[LicenseAgreementTypeId]=	source.[LicenseAgreementTypeId]
					,[ContractTypeId]=	source.[ContractTypeId]
					,[EnrollmentNumber]=	source.[EnrollmentNumber]
					,[ProgramId]=	source.[ProgramId]
					,[ProgramOfferingCode]=	source.[ProgramOfferingCode]
					,[OfferingLevelCode]=	source.[OfferingLevelCode]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT (	[Id]
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
				,[OfferingLevelCode])
    VALUES (source.[Id]
			  ,source.[AmendmentType]
			  ,source.[StatusId]
			  ,source.[StartEffectiveDate]
			  ,source.[EndEffectiveDate]
			  ,source.[AmendmentStartDate]
			  ,source.[AmendmentEndDate]
			  ,source.[OperationsCenterId]
			  ,source.[PriceListCurrencyId]
			  ,source.[BillingCycle]
			  ,source.[GuaranteedServicePercentage]
			  ,source.[CountryId]
			  ,source.[RegionId]
			  ,source.[EndCustomerName]
			  ,source.[AuthLevelStatusId]
			  ,source.[InvoiceNotificationCycle]
			  ,source.[HermesStartDate]
			  ,source.[Attributes]
			  ,source.[CanExtendTerm]
			  ,source.[Channel]
			  ,source.[Version]
			  ,source.[SourceModifiedDate]
			  ,source.[ExternalStatusId]
			  ,source.[CreatedOn]
			  ,source.[CreatedBy]
			  ,source.[ModifiedOn]
			  ,source.[ModifiedBy]
			  ,source.[EnrollmentKey]
			  ,source.[AgreementTypeId]
			  ,source.[PriceListCountryCode]
			  ,source.[MPNId]
			  ,source.[TerminateSuccessful]
			  ,source.[TransferDepartments]
			  ,source.[PublicCustomerNumber]
			  ,source.[PriorEnrollmentKey]
			  ,source.[TransferTo]
			  ,source.[TransferDate]
			  ,source.[LicenseAgreementTypeId]
			  ,source.[ContractTypeId]
			  ,source.[EnrollmentNumber]
			  ,source.[ProgramId]
			  ,source.[ProgramOfferingCode]
			  ,source.[OfferingLevelCode]
			);
	
	--if(exists(select 1 from [EnrollmentsAccounts_temp]))
	--begin
	--	truncate table [EnrollmentsAccounts]
	--	insert into [EnrollmentsAccounts] select * from [EnrollmentsAccounts_temp]
	--end
	--------------------------
	MERGE [dbo].[EnrollmentsAccounts] AS target
		USING (SELECT * FROM [EnrollmentsAccounts_temp]) 
			AS source (	[Id]
						,[AccountId]
						,[EnrollmentId]
						,[IsDeleted]
						,[CreatedOn]
						,[CreatedBy]
						,[ModifiedOn]
						,[ModifiedBy]
						,[StartsOn]
						,[EndsOn])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[Id]=	source.[Id]
					,[AccountId]=	source.[AccountId]
					,[EnrollmentId]=	source.[EnrollmentId]
					,[IsDeleted]=	source.[IsDeleted]
					,[CreatedOn]=	source.[CreatedOn]
					,[CreatedBy]=	source.[CreatedBy]
					,[ModifiedOn]=	source.[ModifiedOn]
					,[ModifiedBy]=	source.[ModifiedBy]
					,[StartsOn]=	source.[StartsOn]
					,[EndsOn]=	source.[EndsOn]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([Id]
		  ,[AccountId]
		  ,[EnrollmentId]
		  ,[IsDeleted]
		  ,[CreatedOn]
		  ,[CreatedBy]
		  ,[ModifiedOn]
		  ,[ModifiedBy]
		  ,[StartsOn]
		  ,[EndsOn])
    VALUES (source.[Id]
			,source.[AccountId]
			,source.[EnrollmentId]
			,source.[IsDeleted]
			,source.[CreatedOn]
			,source.[CreatedBy]
			,source.[ModifiedOn]
			,source.[ModifiedBy]
			,source.[StartsOn]
			,source.[EndsOn]
			);
		
	
	--if(exists(select 1 from [Invoices_temp]))
	--begin
	--	truncate table [Invoices]
	--	insert into [Invoices] select * from [Invoices_temp]
	--end
	--------------------------
	MERGE [dbo].[Invoices] AS target
		USING (SELECT * FROM [Invoices_temp]) 
			AS source ([InvoiceType]
					  ,[ModifiedOn]
					  ,[OperationCenterId]
					  ,[BillingCycleStartDate]
					  ,[EnrollmentId]
					  ,[Comments]
					  ,[CreatedOn]
					  ,[AssignedTo]
					  ,[ModifiedBy]
					  ,[EndCustomerId]
					  ,[AssignedOn]
					  ,[RegionId]
					  ,[BillingCycleEndDate]
					  ,[ReadyToInvoiceOn]
					  ,[Id]
					  ,[PurchaseOrderNumber]
					  ,[ErrCount]
					  ,[ChannelPartnerId]
					  ,[StatusId]
					  ,[CompletedOn])
				ON (target.[Id] = source.[Id])
    
	-- MATCHED
	WHEN MATCHED THEN 
        UPDATE SET	[InvoiceType]=	source.[InvoiceType]
					,[ModifiedOn]=	source.[ModifiedOn]
					,[OperationCenterId]=	source.[OperationCenterId]
					,[BillingCycleStartDate]=	source.[BillingCycleStartDate]
					,[EnrollmentId]=	source.[EnrollmentId]
					,[Comments]=	source.[Comments]
					,[CreatedOn]=	source.[CreatedOn]
					,[AssignedTo]=	source.[AssignedTo]
					,[ModifiedBy]=	source.[ModifiedBy]
					,[EndCustomerId]=	source.[EndCustomerId]
					,[AssignedOn]=	source.[AssignedOn]
					,[RegionId]=	source.[RegionId]
					,[BillingCycleEndDate]=	source.[BillingCycleEndDate]
					,[ReadyToInvoiceOn]=	source.[ReadyToInvoiceOn]
					,[Id]=	source.[Id]
					,[PurchaseOrderNumber]=	source.[PurchaseOrderNumber]
					,[ErrCount]=	source.[ErrCount]
					,[ChannelPartnerId]=	source.[ChannelPartnerId]
					,[StatusId]=	source.[StatusId]
					,[CompletedOn]=	source.[CompletedOn]

	-- NOT MATCHED
	WHEN NOT MATCHED THEN
    INSERT ([InvoiceType]
		  ,[ModifiedOn]
		  ,[OperationCenterId]
		  ,[BillingCycleStartDate]
		  ,[EnrollmentId]
		  ,[Comments]
		  ,[CreatedOn]
		  ,[AssignedTo]
		  ,[ModifiedBy]
		  ,[EndCustomerId]
		  ,[AssignedOn]
		  ,[RegionId]
		  ,[BillingCycleEndDate]
		  ,[ReadyToInvoiceOn]
		  ,[Id]
		  ,[PurchaseOrderNumber]
		  ,[ErrCount]
		  ,[ChannelPartnerId]
		  ,[StatusId]
		  ,[CompletedOn])
    VALUES (source.[InvoiceType]
			  ,source.[ModifiedOn]
			  ,source.[OperationCenterId]
			  ,source.[BillingCycleStartDate]
			  ,source.[EnrollmentId]
			  ,source.[Comments]
			  ,source.[CreatedOn]
			  ,source.[AssignedTo]
			  ,source.[ModifiedBy]
			  ,source.[EndCustomerId]
			  ,source.[AssignedOn]
			  ,source.[RegionId]
			  ,source.[BillingCycleEndDate]
			  ,source.[ReadyToInvoiceOn]
			  ,source.[Id]
			  ,source.[PurchaseOrderNumber]
			  ,source.[ErrCount]
			  ,source.[ChannelPartnerId]
			  ,source.[StatusId]
			  ,source.[CompletedOn]
			);
	


RETURN 0
