SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.forum_sp_GetUserDetails
(
 @Email varchar(100) )
AS
BEGIN
      SELECT
          *
      FROM
          tblAuthor
      WHERE
          tblAuthor.Author_email LIKE '%' + @Email + '%' 
	  AND tblAuthor.Group_ID IN ( 4 , 5 , 6 , 20 , 21 )
END
GO
GRANT EXECUTE
	ON [dbo].[forum_sp_GetUserDetails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[forum_sp_GetUserDetails]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[forum_sp_GetUserDetails]
	TO [davor.dumeljic]
GO
