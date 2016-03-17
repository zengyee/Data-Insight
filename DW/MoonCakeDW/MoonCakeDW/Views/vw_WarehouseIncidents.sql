CREATE VIEW [dbo].[vw_WarehouseIncidents]
	AS 
	SELECT        a.*, b.newsupportticketid
FROM            (SELECT        *, supportticketidtxt = CONVERT(xml, '<root><v>' + replace(replace(supportticketid, '&', ','), ',', '</v><v>') + '</v></root>')
                          FROM            [dbo].[Icm_WarehouseIncidents]) a OUTER apply
                             (SELECT        newsupportticketid = C.v.value('.', 'nvarchar(100)')
                               FROM            a.supportticketidtxt.nodes('/root/v') C(v)) b
WHERE        a.supportticketid IS NOT NULL