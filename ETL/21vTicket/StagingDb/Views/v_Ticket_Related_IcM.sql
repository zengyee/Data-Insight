CREATE VIEW [dbo].[v_Ticket_Related_IcM]
	AS SELECT m.*,icm.icm_IncidentId,icm.icm_CreateDate,icm.icm_Title, icm.icm_Status, icm.icm_IsCustomerImpacting
	,CASE WHEN m.OutageRelated = 1 OR icm.icm_IncidentId IS NOT NULL THEN 1 ELSE 0 END AS [LSIRelated]
	,CASE WHEN m.OutageRelated = 1 OR icm.icm_IncidentId IS NOT NULL THEN 0 ELSE 1 END AS [NotLSI]
		FROM [dbo].[v_CSS_Data_Mooncake] m LEFT JOIN [$(IcMChina)].[dbo].[v_SupportTicketRelated] icm 
		on icm.[icm_SupportticketId] LIKE '%'+ m.[Case_ID]+'%' 
		--WHERE m.OutageRelated = 1 OR icm.icm_IncidentId IS NOT NULL