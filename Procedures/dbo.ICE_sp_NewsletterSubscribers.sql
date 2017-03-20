SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_NewsletterSubscribers
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN

      SELECT
          dbo.ICE_GetMonthName(YEAR(apexsql.Newsletter.CreatedOn) * 100 + MONTH(apexsql.Newsletter.CreatedOn)) AS [Month] ,
          Count(*) AS [Count]
      FROM
          apexsql.Newsletter
      WHERE
          apexsql.Newsletter.CreatedOn BETWEEN @DateStart AND @DateEnd
      GROUP BY
          YEAR(apexsql.Newsletter.CreatedOn) * 100 + MONTH(apexsql.Newsletter.CreatedOn)
      ORDER BY
          YEAR(apexsql.Newsletter.CreatedOn) * 100 + MONTH(apexsql.Newsletter.CreatedOn)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NewsletterSubscribers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NewsletterSubscribers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_NewsletterSubscribers]
	TO [davor.dumeljic]
GO
