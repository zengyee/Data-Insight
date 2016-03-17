CREATE FUNCTION [dbo].[FunGetDateStampperRecord]
(
		@Case_ID nvarchar(100)
)
RETURNS 
@result TABLE 
(	
	[Case_ID] nvarchar(100),
	[awaiting for MS reply datetime] datetime,
	[awaiting for MS reply minute] int,
	[Closed datetime] datetime,
	[Closed minute] int,
	[Deferred By Customer datetime] datetime,
	[Deferred By Customer minute] int,
	[Escalated to MS datetime] datetime,
	[Escalated to MS minute] int,
	[Investigation datetime] datetime,
	[Investigation minute] int,
	[Re-Open datetime] datetime,
	[Re-Open minute] int,
	[Solution Delivered datetime] datetime,
	[Solution Delivered minute] int,
	[Waiting on Customer datetime] datetime,
	[Waiting on Customer minute] int,
	[Waiting on Operation datetime] datetime,
	[Waiting on Operation minute] int,
	[Waiting on Support datetime] datetime,
	[Waiting on Support minute] int
)
AS
BEGIN

declare @temp table (
	[id] bigint,
	[Case_ID] nvarchar(100),
	[CaseStatus] nvarchar(50),
	[LastUpdateDate] datetime,
	CreateDate datetime,
	lastid bigint)


declare	@tbl TABLE 
(
	[id] bigint,
	[Case_ID] nvarchar(100),
	[CaseStatus] nvarchar(50),
	[LastUpdateDate] datetime,
	[lastLastUpdateDate] datetime,
	[diff] int
)
insert into @temp
select aa.* 
from  (
select a.id,a.Case_ID,a.CaseStatus,a.LastUpdateDate,a.CreateDate
,(select top 1 id from [dbo].[CSS_DATA_Detail] b where a.Case_ID=b.Case_ID  and a.LastUpdateDate>b.LastUpdateDate order by id desc) lastid
from [dbo].[CSS_DATA_Detail] a
where a.Case_ID=@Case_ID
) aa
left join [dbo].[CSS_DATA_Detail] c on c.id=aa.lastid
where aa.CaseStatus<>c.CaseStatus or c.Case_ID is null 
order by aa.Case_ID,aa.LastUpdateDate


insert into @tbl
select c.id,c.Case_ID,c.CaseStatus,LastUpdateDate,isnull(c.lastLastUpdateDate,CreateDate) as lastLastUpdateDate
,datediff(MINUTE,isnull(c.lastLastUpdateDate,CreateDate),LastUpdateDate) as diff
from (
select  a.id,a.Case_ID,a.CaseStatus,a.LastUpdateDate,a.CreateDate
,(select top 1 LastUpdateDate from @temp b where a.Case_ID=b.Case_ID  and a.LastUpdateDate>b.LastUpdateDate order by id desc) lastLastUpdateDate
from @temp a
) c
order by LastUpdateDate

insert into @result
select Case_ID
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='awaiting for MS reply') as [awaiting for MS reply datetime]
, (select sum(diff) from @tbl where [CaseStatus]='awaiting for MS reply') as [awaiting for MS reply minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]  like 'Closed%') as [Closed datetime]
, (select sum(diff)  from @tbl where [CaseStatus]  like 'Closed%')as [Closed minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Deferred By Customer') as [Deferred By Customer datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Deferred By Customer') as [Deferred By Customer minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Escalated to MS') as [Escalated to MS datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Escalated to MS') as [Escalated to MS minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Investigation') as [Investigation datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Investigation') as [Investigation minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Re-Open') as [Re-Open datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Re-Open') as [Re-Open minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Solution Delivered') as [Solution Delivered datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Solution Delivered') as [Solution Delivered minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Waiting on Customer') as [Waiting on Customer datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Waiting on Customer') as [Waiting on Customer minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Waiting on Operation') as [Waiting on Operation datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Waiting on Operation') as [Waiting on Operationy minute]
, (select  min(LastUpdateDate)  from @tbl where [CaseStatus]='Waiting on Support') as [Waiting on Support datetime]
, (select sum(diff) from @tbl where [CaseStatus]='Waiting on Support') as [Waiting on Support minute]


from @tbl
group by Case_ID
	
	RETURN 
END

