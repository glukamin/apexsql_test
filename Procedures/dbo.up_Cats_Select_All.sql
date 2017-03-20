SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  PROCEDURE dbo.up_Cats_Select_All
AS
BEGIN
 
 SELECT CatID, CatName, Colour, Age
  FROM blockwood.Cats
 
END
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Select_All]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Select_All]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Select_All]
	TO [davor.dumeljic]
GO
