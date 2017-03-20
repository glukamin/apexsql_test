SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.VIP_GetVIPByEmail
(
	@Email varchar(50)
)
AS
BEGIN
	SELECT P.Date, P.Points, D.Reason_Name AS Reason, P.Comment, 
	(SELECT TOP 1 Username FROM tblAuthor WHERE tblAuthor.Author_ID = P.Admin_ID) AS Given_by
	FROM ApexSQL_Points P
	INNER JOIN tblAuthor A on P.User_ID = A.Author_ID
	INNER JOIN ApexSQL_Point_Descriptions D on P.Reason_ID = D.Reason_ID
	WHERE A.Author_email = @Email
	ORDER BY Date desc	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetVIPByEmail]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetVIPByEmail]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetVIPByEmail]
	TO [davor.dumeljic]
GO
