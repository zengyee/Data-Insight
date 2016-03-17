CREATE PROCEDURE [dbo].[ETL_MergeTemp_RestAll]
AS
	
	if(exists(select 1 from [agreementParticipants_temp]))
	begin
		truncate table [agreementParticipants]
		insert into [agreementParticipants] select * from [agreementParticipants_temp]
	end
	------------------------
	if(exists(select 1 from [BillableItems_temp]))
	begin
		truncate table [BillableItems]
		insert into [BillableItems] select * from [BillableItems_temp]
	end
	------------------------
		
	if(exists(select 1 from [BillableItemService_temp]))
	begin
		truncate table [BillableItemService]
		insert into [BillableItemService] select * from [BillableItemService_temp]
	end
	------------------------

	if(exists(select 1 from [ContactInformation_temp]))
	begin
		truncate table [ContactInformation]
		insert into [ContactInformation] select * from [ContactInformation_temp]
	end
	------------------------

	if(exists(select 1 from [Countries_temp]))
	begin
		truncate table [Countries]
		insert into [Countries] select * from [Countries_temp]
	end
	------------------------
	
	if(exists(select 1 from [Currencies_temp]))
	begin
		truncate table [Currencies]
		insert into [Currencies] select * from [Currencies_temp]
	end
	------------------------
	
	if(exists(select 1 from [DepartmentAccounts_temp]))
	begin
		truncate table [DepartmentAccounts]
		insert into [DepartmentAccounts] select * from [DepartmentAccounts_temp]
	end
	------------------------

	if(exists(select 1 from [Departments_temp]))
	begin
		truncate table [Departments]
		insert into [Departments] select * from [Departments_temp]
	end
	------------------------
	
	if(exists(select 1 from [EaCommerceAccounts_temp]))
	begin
		truncate table [EaCommerceAccounts]
		insert into [EaCommerceAccounts] select * from [EaCommerceAccounts_temp]
	end
	------------------------

	if(exists(select 1 from [EnrollmentAttributes_temp]))
	begin
		truncate table [EnrollmentAttributes]
		insert into [EnrollmentAttributes] select * from [EnrollmentAttributes_temp]
	end
	------------------------
	
	if(exists(select 1 from [EnrollmentCommitmentTerms_temp]))
	begin
		truncate table [EnrollmentCommitmentTerms]
		insert into [EnrollmentCommitmentTerms] select * from [EnrollmentCommitmentTerms_temp]
	end
	------------------------

	if(exists(select 1 from [EnrollmentDepartments_temp]))
	begin
		truncate table [EnrollmentDepartments]
		insert into [EnrollmentDepartments] select * from [EnrollmentDepartments_temp]
	end
	------------------------
	
	if(exists(select 1 from [EnrollmentParticipants_temp]))
	begin
		truncate table [EnrollmentParticipants]
		insert into [EnrollmentParticipants] select * from [EnrollmentParticipants_temp]
	end
	------------------------

	if(exists(select 1 from [Entitlements_temp]))
	begin
		truncate table [Entitlements]
		insert into [Entitlements] select * from [Entitlements_temp]
	end
	------------------------

	if(exists(select 1 from [EntitlementSubscribers_temp]))
	begin
		truncate table [EntitlementSubscribers]
		insert into [EntitlementSubscribers] select * from [EntitlementSubscribers_temp]
	end
	------------------------

	if(exists(select 1 from [ExternalAccounts_temp]))
	begin
		truncate table [ExternalAccounts]
		insert into [ExternalAccounts] select * from [ExternalAccounts_temp]
	end
	------------------	
	if(exists(select 1 from [MonetaryAdjustmentTypes_temp]))
	begin
		truncate table [MonetaryAdjustmentTypes]
		insert into [MonetaryAdjustmentTypes] select * from [MonetaryAdjustmentTypes_temp]
	end
	------------------------

	if(exists(select 1 from [Organizations_temp]))
	begin
		truncate table [Organizations]
		insert into [Organizations] select * from [Organizations_temp]
	end
	------------------------
	
	if(exists(select 1 from [PriceAdjustment_temp]))
	begin
		truncate table [PriceAdjustment]
		insert into [PriceAdjustment] select * from [PriceAdjustment_temp]
	end
	------------------------

	if(exists(select 1 from [PurchaseOrderLineItems_temp]))
	begin
		truncate table [PurchaseOrderLineItems]
		insert into [PurchaseOrderLineItems] select * from [PurchaseOrderLineItems_temp]
	end
	------------------------
	
	if(exists(select 1 from [PurchaseOrders_temp]))
	begin
		truncate table [PurchaseOrders]
		insert into [PurchaseOrders] select * from [PurchaseOrders_temp]
	end
	------------------------


	if(exists(select 1 from [ServiceRegions_temp]))
	begin
		truncate table [ServiceRegions]
		insert into [ServiceRegions] select * from [ServiceRegions_temp]
	end
	------------------------

	if(exists(select 1 from [ServiceResources_temp]))
	begin
		truncate table [ServiceResources]
		insert into [ServiceResources] select * from [ServiceResources_temp]
	end
	------------------------
	
	if(exists(select 1 from [Services_temp]))
	begin
		truncate table [Services]
		insert into [Services] select * from [Services_temp]
	end
	------------------------
	
	if(exists(select 1 from [ServiceTypes_temp]))
	begin
		truncate table [ServiceTypes]
		insert into [ServiceTypes] select * from [ServiceTypes_temp]
	end
	------------------------	
	if(exists(select 1 from [UserRoles_temp]))
	begin
		truncate table [UserRoles]
		insert into [UserRoles] select * from [UserRoles_temp]
	end
	------------------------
		
	if(exists(select 1 from [Users_temp]))
	begin
		truncate table [Users]
		insert into [Users] select * from [Users_temp]
	end
	------------------------


RETURN 0
