SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION dbo.ICE_GetRemainingActivations
(		
	@CustId int	
)
RETURNS int 
AS 
BEGIN
	RETURN (select sum(UC.Activation_Counter) 
	from ICE_Unlock_Codes UC
	inner join ICE_Orders O on UC.Order_ID = O.Order_ID
	where O.Cust_ID = @CustId)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetRemainingActivations]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetRemainingActivations]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetRemainingActivations]
	TO [davor.dumeljic]
GO
