CREATE PROCEDURE [dbo].[ETL_sp_Insert_IS_WorkItem_Detail_by_Changes]
AS
	INSERT INTO [dbo].[IS_WorkItems_Detail]
	([id],[TicketID],[CreateDate],[AlarmTriggerDate],[Subject],[Status],[StatusCode],[Version],[RelatedLinkCount],[Owner],[OwnerGroup],[Source],[Classification],[Severity]
	,[Priority],[Property],[CreatedBy],[ChangedBy],[AssignedTo],[AssignedGroup],[AssignedDate],[ChangedDate],[StateChangedDate],[T1ProcessDate],[T2ProcessDate],[EscalationByTeam],[EscalationDate]
	,[Append],[PendingStatus],[PendingReason],[T1FirstResponseTime],[T2FirstResponseTime],[PendingTime],[PendLength],[FirstAssignedDate],[ResolvedDate],[ResolvedBy],[ResolvedByTeam],[ClosedDate]
	,[ClosedBy],[InTSG])
	SELECT t.[id],t.[TicketID],t.[CreateDate],t.[AlarmTriggerDate],t.[Subject],t.[Status],t.[StatusCode],t.[Version],t.[RelatedLinkCount],t.[Owner],t.[OwnerGroup],t.[Source],t.[Classification],t.[Severity]
	,t.[Priority],t.[Property],t.[CreatedBy],t.[ChangedBy],t.[AssignedTo],t.[AssignedGroup],t.[AssignedDate],t.[ChangedDate],t.[StateChangedDate],t.[T1ProcessDate],t.[T2ProcessDate],t.[EscalationByTeam],t.[EscalationDate]
	,t.[Append],t.[PendingStatus],t.[PendingReason],t.[T1FirstResponseTime],t.[T2FirstResponseTime],t.[PendingTime],t.[PendLength],t.[FirstAssignedDate],t.[ResolvedDate],t.[ResolvedBy],t.[ResolvedByTeam],t.[ClosedDate]
	,t.[ClosedBy],t.[InTSG]
	FROM [IS_WorkItems_Detail_Temp] t LEFT JOIN [IS_WorkItems_Detail] d ON t.id=d.id AND t.TicketID=d.TicketID AND t.Version = d.Version
	WHERE d.id IS NULL	 
	 
RETURN 0
