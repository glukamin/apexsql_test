SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION dbo.ICE_GetNoActivations
(		
	@CustId int	
)
RETURNS int 
AS 
BEGIN
	RETURN (select count(*)
		from ICE_Activations A
		inner join ICE_Unlock_Codes UC on A.Unlock_Code_ID = UC.Unlock_Code_ID
		inner join ICE_Orders O on UC.Order_ID = O.Order_ID
		where O.Cust_ID = @CustId)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetNoActivations]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetNoActivations]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetNoActivations]
	TO [davor.dumeljic]
GO
