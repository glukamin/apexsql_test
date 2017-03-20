SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_Newsletter_Total
AS
BEGIN
      SELECT
          count(*) as Total
      FROM
          apexsql.Newsletter
      WHERE
          apexsql.Newsletter.Status = 1
END	
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Newsletter_Total]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Newsletter_Total]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Newsletter_Total]
	TO [davor.dumeljic]
GO
