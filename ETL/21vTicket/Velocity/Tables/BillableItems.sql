﻿CREATE TABLE [dbo].[BillableItems]
(
			EDWProcessID		int,
	CommitmentQuantityPerUnit		numeric	(15,3),
	HasCommitmentOffer		bit	,
	SkuTypeId		smallint,
	ConsumptionQuantityPerUnit		numeric(15,0),
	NewCommitmentName		nvarchar(127),
	EDWIsDeletedFlag		bit	,
	NewQuantityPerUnit		numeric	(15,3),
	ModifiedBy		int	,
	IsMonetaryCommitmentService		bit	,
	Id		int NOT NULL,
	CommitmentName		nvarchar(127),
	ReviewedBy		int	,
	ConsumptionName		nvarchar(127),
	EDWSourceExtractID		varchar(40),
	EDWExtractGrouping		int	,
	MocpResourcesPerUnit		numeric	(15,6),
	ModifiedOn		datetime2	,
	EDWFirstInserted		datetime,
	CreatedBy		int	,
	StartsOn		datetime2,
	StatusId		int	,
	NewConsumptionPartNumber		nvarchar(16),
	CommitmentPartNumber		nvarchar(16	),
	ReviewComments		nvarchar(1000),
	ConsumptionPartNumber		nvarchar(16),
	WorkflowStatus		int,
	EDWSourceSystemID		int	,
	UnitOfMeasure		nvarchar(50),
	EDWLastUpdated		datetime,
	CreatedOn		datetime2,
	NewCommitmentPartNumber		nvarchar(16),
	WorkflowInstanceId		uniqueidentifier,
	Name		nvarchar(127),
	NewConsumptionName		nvarchar(127),
	EndsOn		datetime2, 
    CONSTRAINT [PK_BillableItems] PRIMARY KEY ([Id])

)
