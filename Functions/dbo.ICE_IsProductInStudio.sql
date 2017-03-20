SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function dbo.ICE_IsProductInStudio
(
	@Product_ID int, 
	@StudioProductType char(1)   -- ["D"|"U"]  (Developer Studio | Universal Studio)
)
/*
Returns true if the input product belongs to the ApexSQL 
Developer/Universal Studio bundle
*/
returns int
as
Begin

If exists(
	Select Product_ID from ICE_Products
	where Product_ID=(select case when @StudioProductType='D' then 141582 else 204978 End)
	and Bundle_Products like '%'+convert(varchar, @Product_ID)+'%'
)	
	return 1

return 0
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsProductInStudio]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsProductInStudio]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_IsProductInStudio]
	TO [davor.dumeljic]
GO
