CREATE VIEW [dbo].[v_CustomerImpactIncident]
	AS SELECT	CASE WHEN i.IncidentId is NOT NULL THEN 'IridiasLSI' ELSE 'Normal' END AS CustomerImpact,
				LEFT(CONVERT(varchar(50),l.[CreateDate],102),7) AS CreateMonth,
				CASE l.[IncidentType] WHEN 'CustomerReported' THEN 'CRI' WHEN 'LiveSite' THEN 'LSI' ELSE 'UNKNOWN' END AS [TYPE],
				SUBSTRING([OwningTeamName],CharIndex('\',[OwningTeamName],0)+1 ,LEN([OwningTeamName])- CharIndex('\',[OwningTeamName],0)) AS OwningTeam,
				DATEDIFF(minute, [CreateDate],[ResolveDate]) AS TTR,
				LEFT ([Title], 60) as ShortTitle,
				l.*
		FROM [dbo].[v_LSICRI] l LEFT JOIN [dbo].[IridiasLSI] i on i.IncidentId=l.IncidentId
