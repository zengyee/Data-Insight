CREATE VIEW dbo.vw_Ticket
AS
SELECT        DATEDIFF(minute, CreateDate, ResolvedDate) AS TTR, DATEDIFF(DAY, CreateDate, ClosedDate) AS DTC, DATEDIFF(minute, CreateDate, ClosedDate) AS TTC, 
                         DATEDIFF(minute, AlarmTriggerDate, CreateDate) AS [Trigger], id, TicketID, CreateDate, AlarmTriggerDate, Subject, Status, StatusCode, Version, 
                         RelatedLinkCount, Owner, OwnerGroup, Source, Classification, Severity, Priority, Property, CreatedBy, ChangedBy, AssignedTo, AssignedGroup, 
                         AssignedDate, ChangedDate, StateChangedDate, T1ProcessDate, T2ProcessDate, EscalationByTeam, EscalationDate, Append, PendingStatus, 
                         PendingReason, T1FirstResponseTime, T2FirstResponseTime, PendingTime, PendLength, FirstAssignedDate, ResolvedDate, ResolvedBy, 
                         ResolvedByTeam, ClosedDate, ClosedBy, InTSG
FROM            dbo.IS_WorkItems_Detail
WHERE        (Source NOT LIKE '%O365%') AND (Subject <> 'test') AND (Append = 'false') AND (AlarmTriggerDate <= CreateDate)

