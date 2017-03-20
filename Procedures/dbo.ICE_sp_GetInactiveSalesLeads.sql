SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_GetInactiveSalesLeads
(
 @StartDate datetime ,
 @EndDate datetime )
AS
BEGIN
	SET @EndDate = @EndDate + ' 23:59:59'
      SELECT
          S.SalesLeadId ,
          S.First_Name ,
          S.Last_Name ,
          S.Phone ,
          S.Email ,
          S.Country ,
          S.Zip ,
          S.Author_ID ,
          S.Date_Added ,
          S.Date_Submitted_To_SF,
	  A.Username,
	  A.Password
      FROM
          ICE_SalesLeads S INNER JOIN tblAuthor A
          ON S.Author_ID = A.Author_ID
      WHERE
          A.Join_date = A.Last_visit AND A.Join_date BETWEEN @StartDate AND @EndDate
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetInactiveSalesLeads]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetInactiveSalesLeads]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetInactiveSalesLeads]
	TO [davor.dumeljic]
GO
