CREATE VIEW [dbo].[v_LSICRI]
	AS SELECT * FROM [WarehouseIncidents]
		  WHERE  (Incidenttype ='LiveSite' or Incidenttype='CustomerReported') and (OccurringEnvironment ='PROD' ) 
  --All WASU incidents except the "Duplicate" incidents and Subtype="Root Cause" incidents are considered for TTM
