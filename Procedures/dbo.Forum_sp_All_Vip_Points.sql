SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.Forum_sp_All_Vip_Points
as
begin
select convert(varchar, year(P.[Date])) + '-' + convert(varchar, month(P.[Date])) as [Month],
T.Username,
count(*) as [Bug Count],
sum(P.Points) as [Points Given]
from
dbo.ApexSQL_Points P
inner join dbo.tblAuthor T on P.Admin_ID = T.Author_ID
where P.Reason_ID in (1, 3)
group by convert(varchar, year(P.[Date])) + '-' + convert(varchar, month(P.[Date])), T.Username
order by [Month]
end
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_All_Vip_Points]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_All_Vip_Points]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_All_Vip_Points]
	TO [davor.dumeljic]
GO
