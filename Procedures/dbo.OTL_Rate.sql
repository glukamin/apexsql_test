SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 08/27/2007
-- Description:	Insert the rating of the template in rating table
-- =============================================
CREATE PROCEDURE [dbo].[OTL_Rate]
	(
		@TemplateId int,
		@UserId int,
		@Rating decimal
	)
 AS
SET NOCOUNT ON

	BEGIN TRANSACTION
	
	DECLARE @count INT
	SET @count=(SELECT COUNT(*) FROM OTL_Ratings WHERE UserId=@UserId AND TemplateId=@TemplateId)
	
	IF @count=0
	BEGIN
		INSERT INTO OTL_Ratings VALUES(@UserId,@TemplateId,@Rating)
		SELECT * FROM OTL_Ratings WHERE Id=@@IDENTITY
	END	
	
	
	IF @@ERROR>0
	BEGIN
		ROLLBACK TRANSACTION
		RETURN (-1)
	END
	ELSE
	BEGIN
		COMMIT TRANSACTION
		RETURN (0)
	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Rate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Rate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Rate]
	TO [davor.dumeljic]
GO
