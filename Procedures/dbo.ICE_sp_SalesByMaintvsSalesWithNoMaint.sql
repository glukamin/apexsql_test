SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
(
	@BeginDate datetime,
	@EndDate datetime
)	
AS
DECLARE @Maint float
DECLARE @NoMaint float
SET @Maint = (SELECT COUNT(*) FROM ICE_Order_Details OD INNER JOIN ICE_Orders O ON OD.Order_ID = O.Order_ID WHERE OD.Maintenance_ID > 0 AND O.Order_Date between @BeginDate and @EndDate) 
SET @NoMaint = (SELECT COUNT(*) FROM ICE_Order_Details OD INNER JOIN ICE_Orders O ON OD.Order_ID = O.Order_ID WHERE OD.Maintenance_ID = 0 AND O.Order_Date between @BeginDate and @EndDate) 
SELECT 'Sales with no maint' AS [Description], CONVERT(varchar(20), @NoMaint*100 / (@Maint + @NoMaint)) AS [Percent]
UNION
SELECT 'Sales with maint' AS [Description], CONVERT(varchar(20), @Maint*100 / (@Maint + @NoMaint)) AS [Percent]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
	TO [davor.dumeljic]
GO
