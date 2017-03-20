SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ivan Vasic
-- Create date: 01/26/2009
-- Description:	Forum Posts by Product
-- =============================================
CREATE PROCEDURE [dbo].[VIP_PostsByProductAllTime] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
	DECLARE @fromDate datetime 
	SET @fromDate = dbo.VIP_Datesubstract(GETDATE(),10,0,0)
	DECLARE @toDate datetime
	SET @toDate = GETDATE()
    -- Insert statements for procedure here
	select SUBSTRING(c.CAT_Name,9, LEN(c.CAT_Name)-8) as Product, COUNT(th.Thread_ID) as Posts from tblForum as f 
		inner join tblCategory as c on c.CAT_ID = f.CAT_ID
		inner join tblTopic as t on t.Forum_ID = f.Forum_ID
		inner join tblThread as th on th.Topic_ID = t.Topic_ID
	where th.Message_date between @fromDate and isnull(@toDate, getdate()) and c.CAT_ID <> 14 --General
	group by c.CAT_name order by Posts desc

END

GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProductAllTime]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProductAllTime]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProductAllTime]
	TO [davor.dumeljic]
GO
