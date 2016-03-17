CREATE FUNCTION [dbo].[FunGetDateStamp]
(
		@Case_ID nvarchar(100)
)
RETURNS 
@tbl TABLE 
(
	[id] bigint,
	[Case_ID] nvarchar(100),
	[CaseStatus] nvarchar(50),
	[LastUpdateDate] datetime,
	[lastLastUpdateDate] datetime,
	[diff] int
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


	
	RETURN 
END


