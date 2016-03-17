CREATE PROCEDURE [dbo].[sp_GetMedian]
	@tbl varchar(100),
	@col varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


declare @sql nvarchar(500)
set @sql='insert into [dbo].[ForMedian] select '+@col+' as col from '+ @tbl 
--set @sql='select ' +@col+' as col into #temp from '+ @tbl 
EXECUTE sp_executesql @sql


SELECT AVG(1.0 * col)
FROM
(
    SELECT o.col, rn = ROW_NUMBER() OVER (ORDER BY o.col), c.c
    FROM [dbo].[ForMedian] AS o
    CROSS JOIN (SELECT c = COUNT(*) FROM [dbo].[ForMedian]) AS c
) AS x
WHERE rn IN ((c + 1)/2, (c + 2)/2);

truncate table [dbo].[ForMedian]

END

