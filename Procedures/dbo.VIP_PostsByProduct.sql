SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE   [dbo].[VIP_PostsByProduct] 
	-- Add the parameters for the stored procedure here
	@fromDate datetime = '01-01-1980',
	@toDate datetime = null
AS
BEGIN	
	SET NOCOUNT ON;	
    
	SELECT Product = CASE CAT_name -- we dont want to remove ApexSQL from General forum category because there is no such prefix in this category
	      			WHEN (SELECT Cat_Name FROM tblCategory WHERE tblCategory.Cat_ID = 14) THEN C.Cat_Name
	      			ELSE SUBSTRING(c.CAT_Name,9, LEN(c.CAT_Name)-8) 
			 END,
		COUNT(th.Thread_ID) as Posts 
		FROM tblForum AS f 				 	      
		inner join tblCategory AS c ON c.CAT_ID = f.CAT_ID
		inner join tblTopic AS t ON t.Forum_ID = f.Forum_ID
		inner join tblThread AS th ON th.Topic_ID = t.Topic_ID
		inner join tblAuthor AS A ON th.Author_ID = A.Author_ID
	where th.Message_date between @fromDate and isnull(@toDate, getdate()) --and c.CAT_ID <> 14 --General
	--and A.Group_ID in (4/*Newbie*/,5/*Groupie*/,6/*Senior Member*/,20 /*Master Member*/) and A.Active = 1
	group by c.CAT_name order by Posts desc
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProduct]
	TO [davor.dumeljic]
GO
