SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  PROCEDURE dbo.up_Cats_Select(@CatID int)
AS
BEGIN
 
 SELECT CatID, CatName, Colour, Age
  FROM blockwood.Cats
     WHERE CatID = @CatID
END
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Select]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Select]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Select]
	TO [davor.dumeljic]
GO
