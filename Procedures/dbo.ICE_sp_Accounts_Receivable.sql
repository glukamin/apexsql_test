SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Accounts_Receivable]
(
    @StartDate datetime,
    @EndDate datetime
)
AS
BEGIN
  SELECT sum(iod.Total) AS Total
  from dbo.ICE_Orders io
  INNER JOIN dbo.ICE_Order_Details iod ON iod.Order_ID = io.Order_ID
  WHERE io.Order_Status_ID = 1 AND io.Order_Date BETWEEN @StartDate AND @EndDate

  SELECT io.Order_Date AS OrderDate, ('APEX2-' + CONVERT(varchar, io.Order_ID)) AS InvoiceNuber
  from dbo.ICE_Orders io
  INNER JOIN dbo.ICE_Order_Details iod ON iod.Order_ID = io.Order_ID
  WHERE io.Order_Status_ID = 1 AND io.Order_Date BETWEEN @StartDate AND @EndDate

END
GO
