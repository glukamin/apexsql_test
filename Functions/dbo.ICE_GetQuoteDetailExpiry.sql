SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ICE_GetQuoteDetailExpiry](@Quote_Detail_ID int)
returns datetime
as
Begin
declare @Expiry datetime
Select @Expiry = DateAdd(Year, ISNULL(ICE_Quote_Details.Maintenance_ID, 0), ICE_Quotes.Quote_Date) from ICE_Quotes inner join ICE_Quote_Details on ICE_Quotes.Quote_ID=ICE_Quote_Details.Quote_ID where ICE_Quote_Details.Quote_Detail_ID=ISNULL(@Quote_Detail_ID, 0)
return @Expiry
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteDetailExpiry]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteDetailExpiry]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetQuoteDetailExpiry]
	TO [davor.dumeljic]
GO
