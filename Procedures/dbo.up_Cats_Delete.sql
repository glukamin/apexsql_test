SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  PROCEDURE dbo.up_Cats_Delete(@CatID int)
AS
BEGIN
 
 DELETE FROM blockwood.Cats
     WHERE CatID = @CatID
END
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Delete]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Delete]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Delete]
	TO [davor.dumeljic]
GO
