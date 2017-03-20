SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[ICE_QuoteDiscount](@Quote_ID int)
returns money
as
begin
return dbo.ICE_IsZero(ROUND((Select (ISNULL((select Sum(qty * (Price - ISNULL(Discount, 0))) from ICE_Quote_Details where Quote_ID=@Quote_ID), 0) + ISNULL((select Sum(qty * (Price - ISNULL(Discount, 0))) from ICE_Quote_Extension_Details where Quote_ID=@Quote_ID), 0)) * ISNULL(Discount, 0) / 100 from ICE_Quotes where Quote_ID=@Quote_ID), 0))
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_QuoteDiscount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_QuoteDiscount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_QuoteDiscount]
	TO [davor.dumeljic]
GO
