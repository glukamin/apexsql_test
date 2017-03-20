SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.ICE_sp_SearchConditionsForOrders
AS
BEGIN
      SELECT
          'City' AS Name ,
          'City' AS Value
      UNION
      SELECT
          'State' AS Name ,
          'State' AS Value
      UNION
      SELECT
          'Zip' AS Name ,
          'Zip' AS Value
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SearchConditionsForOrders]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SearchConditionsForOrders]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SearchConditionsForOrders]
	TO [davor.dumeljic]
GO
