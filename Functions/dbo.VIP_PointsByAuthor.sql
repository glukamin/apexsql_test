SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[VIP_PointsByAuthor]
(
	@Author_ID int
)
returns int
as
begin
	return (select sum(Points) from ApexSQL_Points where ApexSQL_Points.[User_ID] = @Author_ID) + (select count(*) from tblThread where tblThread.Author_ID = @Author_ID)
end

GO
GRANT EXECUTE
	ON [dbo].[VIP_PointsByAuthor]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PointsByAuthor]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PointsByAuthor]
	TO [davor.dumeljic]
GO
