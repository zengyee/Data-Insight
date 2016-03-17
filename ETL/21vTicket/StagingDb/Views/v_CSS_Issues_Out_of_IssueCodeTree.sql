CREATE VIEW [dbo].[v_CSS_Issues_Out_of_IssueCodeTree]
	AS 

select * from [IssueCodes] where IssueCode not in (
select distinct i.IssueCode from IssueCodes i inner join [IssueCodeTree] t on i.IssueCode = t.Level1
or i.IssueCode = t.Level2
or i.IssueCode = t.Level3
or i.IssueCode = t.Level4
or i.IssueCode = t.Level5
or i.IssueCode = t.Level0

)
