SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO
CREATE Function [dbo].[ICE_QuoteTotal](@Quote_ID int)
returns money
as
begin
return dbo.ICE_IsZero((Select Amount + ISNULL(Wire_Transfer_Amount, 0) - ISNULL(dbo.ICE_QuoteDiscount(@Quote_ID), 0) from ICE_Quotes where Quote_ID=@Quote_ID))
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_QuoteTotal]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_QuoteTotal]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_QuoteTotal]
	TO [davor.dumeljic]
GO
