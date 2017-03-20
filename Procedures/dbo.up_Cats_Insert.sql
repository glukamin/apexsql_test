SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  PROCEDURE dbo.up_Cats_Insert
 ( @CatName nvarchar(50), @Colour nvarchar(50), @Age int)
AS
BEGIN
 INSERT INTO blockwood.Cats
 ( CatName, Colour, Age)
 VALUES
 ( @CatName, @Colour, @Age)
 SELECT @@identity
END
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Insert]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Insert]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[up_Cats_Insert]
	TO [davor.dumeljic]
GO
