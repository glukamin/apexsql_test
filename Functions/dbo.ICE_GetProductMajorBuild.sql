SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create Function dbo.ICE_GetProductMajorBuild (@Product_ID int, @Dated datetime)
returns varchar(100)
as
Begin
return ISNULL((select Top 1 convert(varchar, Major_Build_Version) from ICE_Major_Builds where Product_ID=@Product_ID and Dated<=@Dated order by Dated desc), '2005')
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductMajorBuild]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductMajorBuild]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetProductMajorBuild]
	TO [davor.dumeljic]
GO
