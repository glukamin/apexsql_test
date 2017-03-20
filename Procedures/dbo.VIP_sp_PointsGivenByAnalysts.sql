SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.VIP_sp_PointsGivenByAnalysts
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN
      SELECT 
          ( SELECT
                Username
            FROM
                tblAuthor
            WHERE
                tblAuthor.Author_ID = Admin_ID ) AS Analyst ,
          sum([Points]) AS Points
      FROM
          [dbo].[ApexSQL_Points]
      WHERE
          dbo.ApexSQL_Points.[Date] BETWEEN @DateStart AND @DateEnd
      GROUP BY
          dbo.ApexSQL_Points.Admin_ID
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_sp_PointsGivenByAnalysts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_sp_PointsGivenByAnalysts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_sp_PointsGivenByAnalysts]
	TO [davor.dumeljic]
GO
