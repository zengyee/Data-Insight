CREATE VIEW dbo.vw_TicketPerRecord
AS
SELECT        TOP (100) PERCENT TTR, DTC, TTC, [Trigger], id, TicketID, CreateDate, AlarmTriggerDate, Subject, Status, StatusCode, Version, RelatedLinkCount, Owner, 
                         OwnerGroup, Source, Classification, Severity, Priority, Property, CreatedBy, ChangedBy, AssignedTo, AssignedGroup, AssignedDate, ChangedDate, 
                         StateChangedDate, T1ProcessDate, T2ProcessDate, EscalationByTeam, EscalationDate, Append, PendingStatus, PendingReason, T1FirstResponseTime, 
                         T2FirstResponseTime, PendingTime, PendLength, FirstAssignedDate, ResolvedDate, ResolvedBy, ResolvedByTeam, ClosedDate, ClosedBy, InTSG
FROM            dbo.vw_Ticket AS a
WHERE        (NOT EXISTS
                             (SELECT        1 AS Expr1
                               FROM            dbo.vw_Ticket AS b
                               WHERE        (TicketID = a.TicketID) AND (Version > a.Version)))
ORDER BY TicketID

