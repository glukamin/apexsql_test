SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  PROCEDURE dbo.up_Cats_Update(@CatID int,  @CatName nvarchar(50), @Colour nvarchar(50), @Age int)
AS
BEGIN
 
 Update blockwood.Cats SET
 CatName=@CatName,Colour=@Colour,Age=@Age
 WHERE
 CatID = @CatID
 
END
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Update]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Update]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Update]
	TO [davor.dumeljic]
GO
