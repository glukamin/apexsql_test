SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Dragan Radivojevic
-- Create date: 01/26/2009
-- Description:	Forum Posts by Product
-- =============================================
CREATE PROCEDURE [dbo].[VIP_PostsByProduct2] 	
	@From datetime = '01-01-1980'	
AS
BEGIN	
	SET NOCOUNT ON;	
	DECLARE @To datetime
	SET @To = GETDATE()
	EXEC [dbo].[VIP_PostsByProduct] @fromDate = @From, @toDate = @To
END


GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProduct2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProduct2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_PostsByProduct2]
	TO [davor.dumeljic]
GO
